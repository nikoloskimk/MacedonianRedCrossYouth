using System;
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
            
        }

        protected void btnNajaviSe_Click(object sender, EventArgs e)
        {
            if (tbUsername.Text != "" && tbPassword.Text != "")
            {
                // SELECT FROM DATABASE


                User u = DatabaseManagement.authenticateUser(tbUsername.Text, tbPassword.Text);
                if (u != null)
                {
                    Session["user_id"] = 5;
                    Response.Redirect("Default.aspx");

                }
                else
                {
                    lblError.Text = "Внесовте погрешно корисничко име или лозинка. Обидете се повторно.";
                }
            }
            else
            {
                lblError.Text = "Внесовте погрешно корисничко име или лозинка. Обидете се повторно.";
            }
        }
    }
}