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
                IspolniVolonteri();

                int user_id = int.Parse(Session["user_id"].ToString());
                if(!DatabaseManagement.canAddVolonteri(user_id))
                    btnAddVolonter.Visible = false;
            }
            else
            {
                lblMessage.Visible = false;
            }
        }

        public void IspolniVolonteri()
        {
            DataSet ds = DatabaseManagement.getVolonteri();
            gvVolonteri.DataSource = ds;
            gvVolonteri.DataBind();
            ViewState["volonteri"] = ds;
        }

        protected void gvVolonteri_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            lblMessage.Visible = true;
        }

        protected void btnAddVolonter_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("AddUser.aspx");
        }
    }
}