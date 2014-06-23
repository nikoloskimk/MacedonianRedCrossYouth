using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MacedonianRedCrossYouth
{
    public partial class Ulogi : System.Web.UI.Page
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
                if (!DatabaseManagement.isUserAdmin(user_id))
                {
                    Response.Redirect("Restricted.aspx");
                }

                lstUsers.Items.Add(new ListItem("Изберете волонтер...", "0"));
                List<User> users = DatabaseManagement.getAllUsers();
                foreach (User u in users)
                {
                    ListItem l = new ListItem(u.getFullName() + " (" + u.getOrganizationName().Trim() + ")", u.getUserId().ToString());
                    lstUsers.Items.Add(l);
                }
            }
        }

        protected void lstUsers_SelectedIndexChanged(object sender, EventArgs e)
        {


            lblInfo.Visible = false;
            if (lstUsers.SelectedIndex != -1)
            {
                if (lstUsers.SelectedIndex == 0)
                {
                    //hide something
                    panelUlogi.Visible = false;
                }
                else
                {
                    chk1.Checked = false;
                    chk2.Checked = false;
                    chk3.Checked = false;
                    chk4.Checked = false;
                    chk5.Checked = false;
                    chk6.Checked = false;
                    chk7.Checked = false;
                    chk8.Checked = false;
                    chk9.Checked = false;
                    panelUlogi.Visible = true;
                    int user_id = int.Parse(lstUsers.SelectedItem.Value);
                    List<MacedonianRedCrossYouth.DatabaseManagement.Roles> roles = DatabaseManagement.getRolesForUser(user_id);
                    foreach (MacedonianRedCrossYouth.DatabaseManagement.Roles r in roles)
                    {
                        switch (r)
                        {
                            case MacedonianRedCrossYouth.DatabaseManagement.Roles.Admin:
                                chk1.Checked = true;
                                break;
                            case MacedonianRedCrossYouth.DatabaseManagement.Roles.PresidentCKRM:
                                chk2.Checked = true;
                                break;
                            case MacedonianRedCrossYouth.DatabaseManagement.Roles.VicePresidentCKRM:
                                chk3.Checked = true;
                                break;
                            case MacedonianRedCrossYouth.DatabaseManagement.Roles.CoordinativeMember:
                                chk4.Checked = true;
                                break;
                            case MacedonianRedCrossYouth.DatabaseManagement.Roles.ClubManager:
                                chk5.Checked = true;
                                break;
                            case MacedonianRedCrossYouth.DatabaseManagement.Roles.ViceClubManager:
                                chk6.Checked = true;
                                break;
                            case MacedonianRedCrossYouth.DatabaseManagement.Roles.CoordinativeMemberClub:
                                chk7.Checked = true;
                                break;
                            case MacedonianRedCrossYouth.DatabaseManagement.Roles.ConcuilMember:
                                chk8.Checked = true;
                                break;
                            case MacedonianRedCrossYouth.DatabaseManagement.Roles.Volonteer:
                                chk9.Checked = true;
                                break;
                        }
                    }
                }
            }
            else
            {
                panelUlogi.Visible = false;
            }
        }

        protected void btnSaveRoles_Click(object sender, EventArgs e)
        {
            int user_id = int.Parse(lstUsers.SelectedItem.Value);
            List<int> newRoles = new List<int>();
            if (chk1.Checked)
            {
                newRoles.Add(1);
            }
            if (chk2.Checked)
            {
                newRoles.Add(2);
            }
            if (chk3.Checked)
            {
                newRoles.Add(3);
            }
            if (chk4.Checked)
            {
                newRoles.Add(4);
            }
            if (chk5.Checked)
            {
                newRoles.Add(5);
            }
            if (chk6.Checked)
            {
                newRoles.Add(6);
            }
            if (chk7.Checked)
            {
                newRoles.Add(7);
            }
            if (chk8.Checked)
            {
                newRoles.Add(8);
            }

            Boolean isSaved = DatabaseManagement.saveRolesForUser(user_id, newRoles);
            if (isSaved)
            {
                lblInfo.Visible = true;
            }
        }
    }
}