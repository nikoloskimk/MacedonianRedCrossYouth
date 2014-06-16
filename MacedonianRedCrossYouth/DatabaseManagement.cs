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

        public static List<Nationality> getNationalities()
        {
            List<Nationality> nationalities = new List<Nationality>();
            SqlConnection konekcija = getConnection();
            string sqlString = "SELECT * FROM Nationalities";
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            try
            {
                konekcija.Open();
                SqlDataReader citac = komanda.ExecuteReader();
                while (citac.Read())
                {

                    Nationality o = new Nationality(int.Parse(citac[0].ToString()), citac[1].ToString());
                    nationalities.Add(o);

                }
            }
            catch (Exception err)
            {

            }
            finally
            {
                konekcija.Close();
            }

            return nationalities;
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

                    User u = new User();
                    u.user_id = int.Parse(citac["user_id"].ToString());
                    u.first_name = citac["first_name"].ToString();
                    u.last_name = citac["last_name"].ToString();

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

        public static User getUserByID(int id) {
            SqlConnection konekcija = getConnection();
            string sqlString = "SELECT u.*, o.organization_name FROM Users u, Organizations o WHERE u.user_id=@user_id AND u.organization_id=o.organization_id";
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            komanda.Parameters.AddWithValue("@user_id", id);

            try
            {
                konekcija.Open();
                SqlDataReader citac = komanda.ExecuteReader();
                if (citac.Read())
                {

                    User u = new User();
                    u.user_id = int.Parse(citac["user_id"].ToString());
                    u.first_name = citac["first_name"].ToString();
                    u.last_name = citac["last_name"].ToString();
                    u.username = citac["username"].ToString();
                    u.gender = Convert.ToBoolean(citac["gender"].ToString());
                    u.birth_date = Convert.ToDateTime(citac["birth_date"].ToString());
                    u.organization_name = citac["organization_name"].ToString();
                    u.join_date = Convert.ToDateTime(citac["join_date"].ToString());
                    u.location = citac["location"].ToString();
                    u.address = citac["address"].ToString();
                    u.phone = citac["phone"].ToString();
                    u.email = citac["email"].ToString();
                    u.image_path = citac["image_path"].ToString();
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

        public static Boolean CheckPassword(int id, string password)
        {
            SqlConnection konekcija = getConnection();
            string sqlString = "SELECT * FROM Users WHERE user_id=@user_id AND password=@password";
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            komanda.Parameters.AddWithValue("@user_id", id);
            komanda.Parameters.AddWithValue("@password", password);

            try
            {
                konekcija.Open();
                SqlDataReader citac = komanda.ExecuteReader();
                if (citac.Read())
                {
                    return true;
                }
                else
                    return false;
            }
            catch (Exception err)
            {

            }
            finally
            {
                konekcija.Close();
            }
            return false;
        }

        public static Boolean ChangePassword(int id, string password)
        {
            SqlConnection konekcija = getConnection();
            string sqlString = "UPDATE Users SET password=@password WHERE user_id=@user_id";
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            komanda.Parameters.AddWithValue("@user_id", id);
            komanda.Parameters.AddWithValue("@password", password);

            try
            {
                konekcija.Open();
                int count = komanda.ExecuteNonQuery();
                return count == 1;
            }
            catch (Exception err)
            {

            }
            finally
            {
                konekcija.Close();
            }
            return false;
        }

        public static Boolean InsertUser(int user_id, string username, string password, string first_name, string last_name, Boolean gender, DateTime birth_date, DateTime join_date, string image_path, string address, string phone, string email, Boolean is_active, Boolean is_member, int occupation_id, string location, int nationality_id, int faculty_id, int organization_id)
        {
            SqlConnection konekcija = getConnection();
            string sqlString = "INSERT INTO Users (user_id, username, password, first_name, last_name, gender, birth_date, join_date," +
                " image_path, address, phone, email, is_active, is_member, occupation_id, location, nationality_id, faculty_id, organization_id)" +
                "VALUES (@user_id, @username, @password, @first_name, @last_name, @gender, @birth_date, @join_date, @image_path, @address," +
                " @phone, @email, @is_active, @is_member, @occupation_id, @location, @nationality_id, @faculty_id, @organization_id)";
 
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            komanda.Parameters.AddWithValue("@user_id", user_id);
            komanda.Parameters.AddWithValue("@username", username);
            komanda.Parameters.AddWithValue("@password", password);
            komanda.Parameters.AddWithValue("@first_name", first_name);
            komanda.Parameters.AddWithValue("@last_name", last_name);
            komanda.Parameters.AddWithValue("@gender", gender);
            komanda.Parameters.AddWithValue("@birth_date", birth_date);
            komanda.Parameters.AddWithValue("@join_date", join_date);
            komanda.Parameters.AddWithValue("@image_path", image_path);
            komanda.Parameters.AddWithValue("@address", address);
            komanda.Parameters.AddWithValue("@phone", phone);
            komanda.Parameters.AddWithValue("@email", email);
            komanda.Parameters.AddWithValue("@is_active", is_active);
            komanda.Parameters.AddWithValue("@is_member", is_member);
            komanda.Parameters.AddWithValue("@occupation_id", occupation_id);
            komanda.Parameters.AddWithValue("@location", location);
            komanda.Parameters.AddWithValue("@nationality_id", nationality_id);
            komanda.Parameters.AddWithValue("@faculty_id", faculty_id);
            komanda.Parameters.AddWithValue("@organization_id", organization_id);
            try
            {
                konekcija.Open();
                int count = komanda.ExecuteNonQuery();
                return count == 1;
            }
            catch (Exception err)
            {

            }
            finally
            {
                konekcija.Close();
            }
            return false;
        }

    }
}