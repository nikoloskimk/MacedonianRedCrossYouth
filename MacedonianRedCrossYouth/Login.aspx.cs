﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MacedonianRedCrossYouth
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] != null)
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void btnNajaviSe_Click(object sender, EventArgs e)
        {
            User u = DatabaseManagement.authenticateUser(tbUsername.Text, tbPassword.Text);
            if (u != null)
            {
                Session["user_id"] = u.getUserID();
                Session["full_name"] = u.getFullName();
                Response.Redirect("Default.aspx");

            }
            else
            {
                lblError.Text = "Неуспешна најава. Обидете се повторно.";
            }
        }
    }
}