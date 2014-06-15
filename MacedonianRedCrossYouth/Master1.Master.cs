using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CrvenKrst
{
    public partial class Master1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string path = HttpContext.Current.Request.Url.AbsolutePath;

            switch (path)
            {
                case "/Volonteri.aspx":
                    liVolonteri.Attributes.Add("class", "active");
                    break;
                case "/AddUser.aspx":
                    liVolonteri.Attributes.Add("class", "active");
                    break;
                case "/Default.aspx":
                    liAktivnosti.Attributes.Add("class", "active");
                    break;
                case "/Korisnik.aspx":
                    liKorisnik.Attributes.Add("class", "active");
                    break;
                default:
                    liAktivnosti.Attributes.Add("class", "active");
                    break;
            }

            if (Session["user_id"] != null)
            {
                lblUser.Text = (string) Session["full_name"];
            }
            else
            {
            }

        }
    }
}