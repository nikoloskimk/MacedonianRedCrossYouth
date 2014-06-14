using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MacedonianRedCrossYouth
{
    public partial class AddUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Organization> organizations = DatabaseManagement.getOrganizations();

                foreach(Organization o in organizations) {
                    ListItem l = new ListItem(o.getName(), o.getOrganizationID().ToString());
                    ddOrganizations.Items.Add(l);
                }

            }
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox6_TextChanged(object sender, EventArgs e)
        {

        }

        protected void ddZanimanje_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddZanimanje.SelectedIndex == 2)
            {
                ddFakulteti.Visible = true;
            }
            else
            {
                ddFakulteti.Visible = false;
            }
        }
    }
}