using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MacedonianRedCrossYouth
{
    public partial class AddMember : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                int user_id = int.Parse(Session["user_id"].ToString());
                int organization_id = int.Parse(Session["organization_id"].ToString());

                if (!DatabaseManagement.canViewVolonteriHimOrganization(user_id, organization_id))
                {
                    Response.Redirect("Restricted.aspx");
                }

                FillNonMembers();
            }
        }

        protected void lstUsers_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (lstUsers.SelectedIndex != -1 && lstUsers.SelectedIndex != 0)
            {
                Panel1.Visible = true;
            }
            else
            {
                Panel1.Visible = false;
            }
        }

        protected void FillNonMembers()
        {
            lstUsers.Items.Clear();

            int organization_id = int.Parse(Session["organization_id"].ToString());

            lstUsers.Items.Add(new ListItem("Изберете волонтер...", "0"));
            List<User> users = DatabaseManagement.getNonMembers(organization_id);
            foreach (User u in users)
            {
                ListItem l = new ListItem(u.getFullName(), u.getUserId().ToString());
                lstUsers.Items.Add(l);
            }
        }

        protected void btnAddMember_Click(object sender, EventArgs e)
        {
            int user_id = int.Parse(lstUsers.SelectedItem.Value);
            DateTime date = DateTime.Parse(tbYear.Text);

            Boolean b = DatabaseManagement.addMember(user_id, date);
            if (b)
            {
                lblInfo.Text = "Успешно додаден член";
                lblInfo.ForeColor = System.Drawing.Color.Green;

                FillNonMembers();
                tbYear.Text = "";
                Panel1.Visible = false;
            }
            else
            {
                lblInfo.Text = "Настана грешка при додавањето";
                lblInfo.ForeColor = System.Drawing.Color.Red;
            }
            lblInfo.Visible = true;
        }
    }
}