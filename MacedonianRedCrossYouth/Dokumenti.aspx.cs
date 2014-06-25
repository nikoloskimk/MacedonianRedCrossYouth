using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MacedonianRedCrossYouth
{
    public partial class Dokumenti : System.Web.UI.Page
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
                if(DatabaseManagement.isUserAdmin(user_id)) {
                    lblAddDocument.Visible = true;
                    btnAddDocument.Visible = true;
                }

            }
        }

        protected void btnAddDocument_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("AddDocument.aspx");
        }
    }
}