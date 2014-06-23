using MacedonianRedCrossYouth;
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
            string path = HttpContext.Current.Request.Url.LocalPath;
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
                case "/Clenovi.aspx":
                    liClenovi.Attributes.Add("class", "active");
                    break;
                case "/Dokumenti.aspx":
                    liDokumenti.Attributes.Add("class", "active");
                    break;
                default:
                    liAktivnosti.Attributes.Add("class", "active");
                    break;
            }

            if (Session["user_id"] != null)
            {
                lblUser.Text = Session["full_name"].ToString();
                int user_id = int.Parse(Session["user_id"].ToString());
                //display menu items
                if (!DatabaseManagement.canViewMenuItems(user_id))
                {
                    liVolonteri.Visible = false;
                    liClenovi.Visible = false;
                    liUlogi.Visible = false;
                }

                if (DatabaseManagement.isUserAdmin(user_id))
                {
                    liUlogi.Visible = true;
                }
                else
                {
                    liUlogi.Visible = false;
                }
            }
            else
            {
            }

        }

    }
}