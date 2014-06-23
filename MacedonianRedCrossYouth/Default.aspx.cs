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
            
            
            MultiView1.ActiveViewIndex = 0;
            if (!IsPostBack)
            {
                tbFromDate.Text = firstDay.ToLocalTime().ToString("yyyy-MM-dd");
                tbToDate.Text = lastDay.ToLocalTime().ToString("yyyy-MM-dd");
                if (Session["organization_id"] != null)
                {
                    List<Organization> organizations = DatabaseManagement.getChildOrganizations((int)Session["organization_id"]);

                    foreach (Organization o in organizations)
                    {
                        ListItem l = new ListItem(o.getName(), o.getOrganizationID().ToString());
                        ddOrganizations.Items.Add(l);
                    }
                    if (organizations.Count == 0)
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

                IspolniAktivnosti(false);
                //tbFromDate.Text = now.DataDespesa.ToShortDateString();
                //tbEndTime.Text = DateTime.Now.ToLocalTime().ToString("dd-MM-yyyy");
            }
            else
            {
                IspolniAktivnosti(true);
            }
        }

        public void IspolniAktivnosti(bool flag)
        {
            int organization_id = (int)Session["organization_id"];
            int activity_type_id = 0;
            if (flag)
            {
                organization_id = int.Parse(ddOrganizations.SelectedValue.ToString());
                activity_type_id = int.Parse(ddActivityTypes.SelectedValue.ToString());
            }
            DateTime from_date = Convert.ToDateTime(tbFromDate.Text);
            DateTime to_date = Convert.ToDateTime(tbToDate.Text);
            DataSet ds = DatabaseManagement.getActivities(organization_id, activity_type_id, from_date, to_date);
            if (!IsEmpty(ds))
            {
                gvActivnosti.DataSource = ds;
                gvActivnosti.DataBind();
                ViewState["aktivnosti"] = ds;
                lblError.Text = "";
                lblError.Visible = false;
                gvActivnosti.Visible = true;

            }
            else
            {
                lblError.Text = "Naprajte nekoja aktivnost ne se zaebavajte :P";
                lblError.Visible = true;
                gvActivnosti.Visible = false;
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

        protected void gvActivnosti_SelectedIndexChanged(object sender, EventArgs e)
        {
            ShowDetails();
        }

        private void ShowDetails()
        {
            int activity_id = int.Parse(gvActivnosti.DataKeys[gvActivnosti.SelectedIndex].Value.ToString());
            int count = DatabaseManagement.getActivityUsersCount(activity_id);
            tbDetalis.Text = "На активноста со наслов \"" + gvActivnosti.SelectedRow.Cells[0].Text + "\" присуствуваа " + count.ToString() + " волонтери.";
            tbDetalis.Visible = true;
            pnlDetalis.Visible = true;
         }
        protected void btnRefresh_Click(object sender, ImageClickEventArgs e)
        {
           // Response.Redirect("Default.aspx");            
            int activity_id = 2;
            string query = "AddUsersActivity.aspx?ID=" + activity_id;
            Response.Redirect(query);

        }
    }
}