using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MacedonianRedCrossYouth
{
    public partial class VolonterskiMenadzment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                IspolniVolonteri();
                IspolniClenovi();
            }
        }

        public void IspolniVolonteri()
        {
            DataSet ds = DatabaseManagement.getVolonteri();
            gvVolonteri.DataSource = ds;
            gvVolonteri.DataBind();
            ViewState["volonteri"] = ds;
        }

        public void IspolniClenovi()
        {
            DataSet ds = DatabaseManagement.getClenovi();
            gvClenovi.DataSource = ds;
            gvClenovi.DataBind();
            ViewState["clenovi"] = ds;
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("AddUser.aspx");
        }

        protected void gvVolonteri_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            Label1.Visible = true;  
        }
    }
}