using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MacedonianRedCrossYouth
{
    public class DatabaseManagement
    {

        private static SqlConnection getConnection()
        {
            SqlConnection konekcija = new SqlConnection();
            konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["mojaKonekcija"].ConnectionString;
            return konekcija;
        }

        public static List<Organization> getOrganizations()
        {
            List<Organization> organizations = new List<Organization>();
            SqlConnection konekcija = getConnection();
            string sqlString = "SELECT * FROM Organizations";
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            try
            {
                konekcija.Open();
                SqlDataReader citac = komanda.ExecuteReader();
                while (citac.Read())
                {

                    Organization o = new Organization(int.Parse(citac[0].ToString()), citac[1].ToString());
                    organizations.Add(o);
                    
                }
            }
            catch (Exception err)
            {
                
            }
            finally
            {
                konekcija.Close();
            }

            return organizations;
        }

        public static User authenticateUser(string username, string password)
        {
            SqlConnection konekcija = getConnection();
            string sqlString = "SELECT * FROM Users WHERE username=@username AND password=@password";
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            komanda.Parameters.AddWithValue("@username", username);
            komanda.Parameters.AddWithValue("@password", password);

            try
            {
                konekcija.Open();
                SqlDataReader citac = komanda.ExecuteReader();
                if (citac.Read())
                {
                   
                    User u = new User(
                        int.Parse(citac[0].ToString()), citac[1].ToString(), citac[2].ToString(), citac[3].ToString(),
                        citac[4].ToString(),
                        citac[5].ToString(), citac[6].ToString(), int.Parse(citac[7].ToString()),
                        int.Parse(citac[8].ToString())
                        );
                    return u;
                }
                else
                    return null;
            }
            catch (Exception err)
            {

            }
            finally
            {
                konekcija.Close();
            }
            return null;
        }
    }
}