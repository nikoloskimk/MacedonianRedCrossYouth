using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MacedonianRedCrossYouth
{
    public partial class Default : System.Web.UI.Page
    {
        public static DateTime firstDay = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
        public static DateTime lastDay = firstDay.AddMonths(1).AddDays(-1);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            
            string proba = firstDay.ToShortDateString();
            tbFromDate.Text = firstDay.ToLocalTime().ToString("yyyy-MM-dd");
            tbToDate.Text = lastDay.ToLocalTime().ToString("yyyy-MM-dd");
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
                IspolniAktivnosti();
                //tbFromDate.Text = now.DataDespesa.ToShortDateString();
                //tbEndTime.Text = DateTime.Now.ToLocalTime().ToString("dd-MM-yyyy");
            }
            
        }

        public void IspolniAktivnosti()
        {
            int organization_id = int.Parse(ddOrganizations.SelectedValue.ToString());
            int activity_type_id = int.Parse(ddActivityTypes.SelectedValue.ToString());
            DateTime from_date = Convert.ToDateTime(tbFromDate.Text);
            DateTime to_date = Convert.ToDateTime(tbToDate.Text);
            DataSet ds = DatabaseManagement.getActivities(organization_id, activity_type_id, from_date, to_date);
            if (!IsEmpty(ds))
            {
                gvActivnosti.DataSource = ds;
                gvActivnosti.DataBind();
                ViewState["aktivnosti"] = ds;
            }
            else
            {
                lblError.Text = "Naprajte nekoja aktivnost ne se zaebavajte :P";
            }
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
        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("AddActivity.aspx");
        }
    }
}