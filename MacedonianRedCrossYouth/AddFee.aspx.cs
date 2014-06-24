using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MacedonianRedCrossYouth
{
    public partial class AddFee : System.Web.UI.Page
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

                FillMembers();
            }
        }

        protected void FillMembers()
        {
            lstUsers.Items.Clear();

            int organization_id = int.Parse(Session["organization_id"].ToString());

            lstUsers.Items.Add(new ListItem("Изберете волонтер...", "0"));
            List<User> users = DatabaseManagement.getMembersList(organization_id);
            foreach (User u in users)
            {
                ListItem l = new ListItem(u.getFullName(), u.getUserId().ToString());
                lstUsers.Items.Add(l);
            }
        }

        protected void lstUsers_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (lstUsers.SelectedIndex != -1 && lstUsers.SelectedIndex != 0)
            {
                int user_id = int.Parse(lstUsers.SelectedItem.Value);
                FillFees(user_id);

                Panel1.Visible = true;
            }
            else
            {
                Panel1.Visible = false;
            }
        }

        protected void FillFees(int user_id)
        {
            List<int> fees = DatabaseManagement.getFeesList(user_id);

            lstFees.Items.Clear();
            for (int i = 2014; i > 2010; i--)
            {
                if (!fees.Contains(i))
                {
                    lstFees.Items.Add(new ListItem(i.ToString(), i.ToString()));
                }
            }
        }

        protected void btnAddFee_Click(object sender, EventArgs e)
        {
            if (lstFees.Items.Count == 0)
            {
                lblInfo.Text = "Членот ги има платено сите годишни членарини";
                lblInfo.ForeColor = System.Drawing.Color.Blue;
                lblInfo.Visible = true;
            }

            if (lstFees.SelectedIndex != -1)
            {
                int user_id = int.Parse(lstUsers.SelectedItem.Value);
                int year = int.Parse(lstFees.SelectedItem.Value);

                Boolean b = DatabaseManagement.AddFee(user_id, year);
                if (b)
                {
                    lblInfo.Text = "Успешно додадена членарина";
                    lblInfo.ForeColor = System.Drawing.Color.Green;

                    FillFees(user_id);
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
}