using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MacedonianRedCrossYouth
{
    public partial class AddActivity : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {


                if (Session["user_id"] != null)
                {
                    List<Organization> organizations = DatabaseManagement.getUserOrganizations((int)Session["user_id"]);

                    foreach (Organization o in organizations)
                    {
                        ListItem l = new ListItem(o.getName(), o.getOrganizationID().ToString());
                        ddOrganizations.Items.Add(l);
                    }

                    List<ActivityType> types = DatabaseManagement.getActivityTypes();

                    foreach (ActivityType t in types)
                    {
                        ListItem l = new ListItem(t.getActivityTypeName(), t.getActivityTypeID().ToString());
                        ddActivityTypes.Items.Add(l);
                    }
                }
                tbStartTime.Text = DateTime.Now.ToLocalTime().ToString("yyyy-MM-ddTHH:mm");
                tbEndTime.Text = DateTime.Now.ToLocalTime().ToString("yyyy-MM-ddTHH:mm");
                tbCosts.Text = "0";
            }

        }

        protected void btnAddActivity_Click(object sender, EventArgs e)
        {
            Boolean isAdded = AddActivityInDatabase();
            if(isAdded)
                Response.Redirect("Default.aspx?succ=1");
            else
            {
                //show some message
            }
        }

        protected void btnAddAnotherActivity_Click(object sender, EventArgs e)
        {
            AddActivityInDatabase();
            Response.Redirect("AddActivity.aspx");
        }

        public Boolean AddActivityInDatabase()
        {
            string title = tbTitile.Text;
            DateTime start_time = DateTime.Parse(tbStartTime.Text.ToString());
            DateTime end_time = DateTime.Parse(tbEndTime.Text.ToString());
            string description = tbDescription.Text;
            string summary = " ";
            int costs = int.Parse(tbCosts.Text.ToString());
            string place = tbPlace.Text;
            int organization_id = 1;
            if (Session["user_id"] != null)
                organization_id = int.Parse(ddOrganizations.SelectedItem.Value.ToString());
            int activity_type_id = int.Parse(ddActivityTypes.SelectedItem.Value.ToString());
            Boolean b = DatabaseManagement.InsertActivity(title, start_time, end_time, description, costs, summary,
                place, organization_id, activity_type_id);
            return b;
        }

    }
}