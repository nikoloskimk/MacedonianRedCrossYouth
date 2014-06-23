using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MacedonianRedCrossYouth
{
    public partial class AddUsersActivity : System.Web.UI.Page
    {
        public int activity_id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["organization_id"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            activity_id = Convert.ToInt32(Request.QueryString[0]);
            if (!IsPostBack)
            {
                List<User> users = DatabaseManagement.getUsersByOrganization((int)Session["organization_id"]);
                foreach (User u in users)
                {
                    ListItem l = new ListItem(u.getFullName(), u.getUserId().ToString());
                    ddVolonteri.Items.Add(l);
                }
            }
        }

        protected void btnDetails_Click(object sender, ImageClickEventArgs e)
        {
            List<int> users_on_activity = new List<int>();

            int[] indices = ddVolonteri.GetSelectedIndices();
            for (int i = 0; i < indices.Length; i++)
            {
                int val = int.Parse(ddVolonteri.Items[indices[i]].Value);
                users_on_activity.Add(val);
            }
            string [] hm = tbHoursSpent.Text.Split(':');
            float hours_spent = float.Parse(hm[0]) + float.Parse(hm[1]) / 60;
            foreach (int user_id in users_on_activity)
            {
                if(!DatabaseManagement.InsertUsersOnActivity(user_id, activity_id, hours_spent)){
                    break;
                }
            }

            if (IspolniGridVolonteriNaAktivnost())
                gvUsersActivity.Visible = true;
        }
        private Boolean IspolniGridVolonteriNaAktivnost()
        {
            DataSet ds = DatabaseManagement.getUsersOnActivity(activity_id);
            if (IsEmpty(ds))
            {
                return false;
            }
            gvUsersActivity.DataSource = ds;
            gvUsersActivity.DataBind();
            ViewState["volonteri_na_aktivnost"] = ds;
            return true;
        }

        private bool IsEmpty(DataSet ds)
        {
            foreach (DataTable table in ds.Tables)
            {
                if (table.Rows.Count != 0)
                    return false;
            }
            return true;
        }

        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}