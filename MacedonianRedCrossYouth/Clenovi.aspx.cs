using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MacedonianRedCrossYouth
{
    public partial class Clenovi : System.Web.UI.Page
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

                if (DatabaseManagement.canViewVolonteriAllOrganizations(user_id))
                {
                    ddOrganizations.Visible = true;
                    // prikazi drop down 
                    List<Organization> org = DatabaseManagement.getChildOrganizations(1);
                    int count = 0;
                    int myInd = -1;
                    foreach (Organization o in org)
                    {
                        ddOrganizations.Items.Add(new ListItem(o.getName(), o.getOrganizationID().ToString()));
                        if (o.getOrganizationID() == organization_id)
                        {
                            myInd = count;
                        }

                        count++;
                    }
                    ddOrganizations.SelectedIndex = myInd;
                }
                else if (!DatabaseManagement.canViewVolonteriHimOrganization(user_id, organization_id))
                {
                    Response.Redirect("Restricted.aspx");
                }

                IspolniClenovi(organization_id);

                if (!DatabaseManagement.canAddVolonteri(user_id))
                {
                    btnAddMember.Visible = false;
                    lblAddMember.Visible = false;

                    btnAddFee.Visible = false;
                    lblAddFee.Visible = false;
                }
            }
        }

        public void IspolniClenovi(int organization_id)
        {
            DataSet ds = DatabaseManagement.getMembers(organization_id);
            gvClenovi.DataSource = ds;
            gvClenovi.DataBind();
            ViewState["clenovi"] = ds;
        }

        public void IspolniClenarina(int organization_id)
        {
            DataSet ds = DatabaseManagement.getMembers(organization_id);
            gvClenovi.DataSource = ds;
            gvClenovi.DataBind();
            ViewState["clenovi"] = ds;
        }

        protected void ddOrganizations_SelectedIndexChanged(object sender, EventArgs e)
        {
            int newID = int.Parse(ddOrganizations.SelectedItem.Value);
            gvClenovi.SelectedIndex = -1;
            IspolniClenovi(newID);

            int organization_id = int.Parse(Session["organization_id"].ToString());

            if (newID != organization_id)
            {
                btnAddMember.Visible = false;
                lblAddMember.Visible = false;

                btnAddFee.Visible = false;
                lblAddFee.Visible = false;
            }
            else
            {
                btnAddMember.Visible = true;
                lblAddMember.Visible = true;

                btnAddFee.Visible = true;
                lblAddFee.Visible = true;
            }

            int user_id = int.Parse(Session["user_id"].ToString());

            /*
            if (DatabaseManagement.isUserAdmin(user_id))
            {
                btnAddMember.Visible = true;
                lblAddMember.Visible = true;
            }
            */

            gvClenarina.Visible = false;
        }

        protected void btnAddFee_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("AddFee.aspx");
        }

        protected void btnAddMember_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("AddMember.aspx");
        }

        protected void gvClenovi_SelectedIndexChanged(object sender, EventArgs e)
        {
            IspolniClenarina();
            gvClenarina.Visible = true;
        }

        public void IspolniClenarina()
        {
            int volonter_id = int.Parse(gvClenovi.DataKeys[gvClenovi.SelectedIndex].Value.ToString());
            DataSet ds = DatabaseManagement.getFees(volonter_id);
            gvClenarina.DataSource = ds;
            gvClenarina.DataBind();
        }

    }
}