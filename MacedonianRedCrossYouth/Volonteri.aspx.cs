using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MacedonianRedCrossYouth
{
    public partial class Volonteri : System.Web.UI.Page
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



                if (Request.QueryString["succ"] != null && Request.QueryString["succ"] != "")
                {
                    int c = int.Parse(Request.QueryString["succ"]);
                    switch (c)
                    {
                        case 1:
                            lblMessage.Text = "Успешно додаден корисник.";
                            break;
                    }
                    lblMessage.Visible = true;
                }

                IspolniVolonteri(organization_id);

                if (!DatabaseManagement.canAddVolonteri(user_id) && !DatabaseManagement.isUserAdmin(user_id))
                {
                    btnAddVolonter.Visible = false;
                    lblAddVolonter.Visible = false;
                }
            }
            else
            {
                lblMessage.Visible = false;
            }
        }

        public void IspolniVolonteri(int organization_id)
        {
            DataSet ds = DatabaseManagement.getVolonteri(organization_id);
            gvVolonteri.DataSource = ds;
            gvVolonteri.DataBind();
            ViewState["volonteri"] = ds;
        }

        public void IspolniAktivnostiVolonter()
        {
            int volonter_id = int.Parse(gvVolonteri.DataKeys[gvVolonteri.SelectedIndex].Value.ToString());
            DataSet ds = DatabaseManagement.getActivities(volonter_id);
            gvAktivnostiVolonter.DataSource = ds;
            gvAktivnostiVolonter.DataBind();
        }

        protected void btnAddVolonter_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("AddUser.aspx");
        }

        protected void gvVolonteri_SelectedIndexChanged(object sender, EventArgs e)
        {
            IspolniAktivnostiVolonter();
            gvAktivnostiVolonter.Visible = true;
        }

        protected void gvVolonteri_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvVolonteri.PageIndex = e.NewPageIndex;
            gvVolonteri.SelectedIndex = -1;
            DataSet ds = ViewState["volonteri"] as DataSet;
            gvVolonteri.DataSource = ds;
            gvVolonteri.DataBind();
            gvAktivnostiVolonter.Visible = false;
        }

        protected void ddOrganizations_SelectedIndexChanged(object sender, EventArgs e)
        {
            int newID = int.Parse(ddOrganizations.SelectedItem.Value);
            gvVolonteri.SelectedIndex = -1;
            IspolniVolonteri(newID);

            int organization_id = int.Parse(Session["organization_id"].ToString());

            if (newID != organization_id)
            {
                btnAddVolonter.Visible = false;
                lblAddVolonter.Visible = false;
            }
            else
            {
                btnAddVolonter.Visible = true;
                lblAddVolonter.Visible = true;
            }

            int user_id = int.Parse(Session["user_id"].ToString());
            if (DatabaseManagement.isUserAdmin(user_id))
            {
                btnAddVolonter.Visible = true;
                lblAddVolonter.Visible = true;
            }

            gvAktivnostiVolonter.Visible = false;
        }
    }
}