using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MacedonianRedCrossYouth
{
    public partial class Korisnik : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            int id = int.Parse(Session["user_id"].ToString());
            User u = DatabaseManagement.getUserByID(id);
            if (u != null)
            {
                lblFirstName.Text = u.first_name;
                lblLastName.Text = u.last_name;
                lblAdress.Text = u.address;
                lblLocation.Text = u.location;
                lblUsername.Text = u.username;
                lblGender.Text = u.gender == true ? "Машки" : "Женски";
                lblBirthDate.Text = u.birth_date.ToShortDateString();
                lblJoinDate.Text = u.join_date.ToShortDateString();
                lblOOCK.Text = u.organization_name;
                lblAdress.Text = u.address;
                lblLocation.Text = u.location;
                lblPhone.Text = u.phone;
                lblLocation.Text = u.location;
                lblEmail.Text = u.email;

                image.ImageUrl = "UploadedFiles/images/" + u.image_path;
            }
        }

        protected void bthChangePassword_Click(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            int id = int.Parse(Session["user_id"].ToString());
            Boolean isOldPasswordValid = DatabaseManagement.CheckPassword(id, tbCurrentPassword.Text);
            if (!isOldPasswordValid)
            {
                lblStatus.Text = "Моменталната лозинка не е валидна.";
                lblStatus.ForeColor = Color.Red;
            }
            else
            {
                Boolean isPasswordChanged = DatabaseManagement.ChangePassword(id, tbNewPassword.Text);
                if (isPasswordChanged)
                {
                    lblStatus.Text = "Успешна промена на лозинката.";
                    lblStatus.ForeColor = Color.Green;
                }
                else
                {
                    lblStatus.Text = "Настана грешка при промена на лозинката.";
                    lblStatus.ForeColor = Color.Red;
                }
            }
        }
    }
}