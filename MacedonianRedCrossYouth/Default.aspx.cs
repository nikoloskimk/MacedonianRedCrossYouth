using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MacedonianRedCrossYouth
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            MultiView1.ActiveViewIndex = 0;
            if (!IsPostBack)
            {
           
                if (Session["organization_id"] != null)
                {
                    List<Organization> organizations = DatabaseManagement.getChildOrganizations((int)Session["organization_id"]);
                    
                    foreach (Organization o in organizations)
                    {
                        ListItem l = new ListItem(o.getName(), o.getOrganizationID().ToString());
                        ddOrganizations.Items.Add(l);
                    }
                    if (organizations.Count==0)
                    {
                        organizations = DatabaseManagement.getUserOrganizations((int)Session["user_id"]);

                        foreach (Organization o in organizations)
                        {
                            ListItem l = new ListItem(o.getName(), o.getOrganizationID().ToString());
                            ddOrganizations.Items.Add(l);
                        }
                    }
                    else
                    {
                        ddOrganizations.SelectedValue = ((int)Session["organization_id"]).ToString(); 
                    }

                    List<ActivityType> activity_types = DatabaseManagement.getActivityTypes();
                    ddActivityTypes.Items.Add(new ListItem("сите", "0"));
                    foreach (ActivityType at in activity_types)
                    {
                        ListItem l = new ListItem(at.getActivityTypeName(), at.getActivityTypeID().ToString());
                        ddActivityTypes.Items.Add(l);
                    }
                }
                
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("AddActivity.aspx");
        }
    }
}