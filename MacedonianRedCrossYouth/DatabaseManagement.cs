using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MacedonianRedCrossYouth
{
    public class DatabaseManagement
    {
        public enum Roles
        {
            Admin = 1,
            PresidentCKRM = 2,
            VicePresidentCKRM = 3,
            CoordinativeMember = 4,
            ClubManager = 5,
            ViceClubManager = 6,
            CoordinativeMemberClub = 7,
            ConcuilMember = 8,
            Volonteer = 9
        }

        private static SqlConnection getConnection()
        {
            SqlConnection konekcija = new SqlConnection();
            konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["mojaKonekcija"].ConnectionString;
            return konekcija;
        }

        public static List<Organization> getUserOrganizations(int user_id)
        {
            List<Organization> organizations = new List<Organization>();
            SqlConnection konekcija = getConnection();
            string sqlString = "SELECT o.* FROM Organizations o, URO uro WHERE uro.user_id=@user_id and o.organization_id=uro.organization_id";
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            komanda.Parameters.AddWithValue("@user_id", user_id);
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

        public static List<ActivityType> getActivityTypes()
        {
            List<ActivityType> activity_types = new List<ActivityType>();
            SqlConnection konekcija = getConnection();
            string sqlString = "SELECT * FROM ActivityTypes";
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            try
            {
                konekcija.Open();
                SqlDataReader citac = komanda.ExecuteReader();
                while (citac.Read())
                {

                    ActivityType at = new ActivityType(int.Parse(citac[0].ToString()), citac[1].ToString());
                    activity_types.Add(at);

                }
            }
            catch (Exception err)
            {

            }
            finally
            {
                konekcija.Close();
            }

            return activity_types;
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

        public static List<Faculty> getFaculties()
        {
            List<Faculty> faculties = new List<Faculty>();
            SqlConnection konekcija = getConnection();
            string sqlString = "SELECT * FROM Faculties";
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            try
            {
                konekcija.Open();
                SqlDataReader citac = komanda.ExecuteReader();
                while (citac.Read())
                {

                    Faculty f = new Faculty(int.Parse(citac[0].ToString()), citac[1].ToString());
                    faculties.Add(f);

                }
            }
            catch (Exception err)
            {

            }
            finally
            {
                konekcija.Close();
            }

            return faculties;
        }

        public static User authenticateUser(string username, string password)
        {
            SqlConnection konekcija = getConnection();
            string sqlString = "SELECT * FROM Users WHERE username=@username AND password=@password AND is_active = 1";
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
                    u.organization_id = int.Parse(citac["organization_id"].ToString());

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

        public static User getUserByID(int id)
        {
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

        public static Boolean InsertUser(string username, string password, string first_name, string last_name, Boolean gender, DateTime birth_date, DateTime join_date, string image_path, string address, string phone, string email, Boolean is_active, Boolean is_member, DateTime member_since, int occupation_id, string location, int nationality_id, int faculty_id, int organization_id)
        {
            SqlConnection konekcija = getConnection();
            string sqlString = "";
            if (is_member == false)
            {
                sqlString = "INSERT INTO Users (username, password, first_name, last_name, gender, birth_date, join_date," +
                " image_path, address, phone, email, is_active, is_member, occupation_id, location, nationality_id, faculty_id, organization_id)" +
                "VALUES (@username, @password, @first_name, @last_name, @gender, @birth_date, @join_date, @image_path, @address," +
                " @phone, @email, @is_active, @is_member, @occupation_id, @location, @nationality_id, @faculty_id, @organization_id)";
            }
            else
            {
                sqlString = "INSERT INTO Users (username, password, first_name, last_name, gender, birth_date, join_date," +
                " image_path, address, phone, email, is_active, is_member, member_since, occupation_id, location, nationality_id, faculty_id, organization_id)" +
                "VALUES (@username, @password, @first_name, @last_name, @gender, @birth_date, @join_date, @image_path, @address," +
                " @phone, @email, @is_active, @is_member, @member_since, @occupation_id, @location, @nationality_id, @faculty_id, @organization_id)";

            }

            SqlCommand komanda = new SqlCommand(sqlString, konekcija);

            if (is_member == true)
            {
                komanda.Parameters.AddWithValue("@member_since", member_since);
            }

            komanda.Parameters.AddWithValue("@username", username);
            komanda.Parameters.AddWithValue("@password", password);
            komanda.Parameters.AddWithValue("@first_name", first_name);
            komanda.Parameters.AddWithValue("@last_name", last_name);
            komanda.Parameters.AddWithValue("@gender", gender);
            komanda.Parameters.AddWithValue("@birth_date", birth_date);
            komanda.Parameters.AddWithValue("@join_date", join_date);
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

            if(image_path == null)
                komanda.Parameters.AddWithValue("@image_path", DBNull.Value);
            else
                komanda.Parameters.AddWithValue("@image_path", image_path);


            /*
            string sqlString2 = "INSERT INTO URO (user_id, role_id, organization_id, start_date)" +
                "VALUES (@user_id, @role_id, @organization_id, @start_date)";
            SqlCommand komanda2 = new SqlCommand(sqlString2, konekcija);
            komanda2.Parameters.AddWithValue("@user_id", user_id);
            komanda2.Parameters.AddWithValue("@role_id", 9);
            komanda2.Parameters.AddWithValue("@organization_id", organization_id);
            komanda2.Parameters.AddWithValue("@start_date", join_date);
            */
            try
            {
                konekcija.Open();
                int count = komanda.ExecuteNonQuery();
                //   count = komanda2.ExecuteNonQuery();
                return count == 1;
            }
            catch (Exception err)
            {
                return false;
            }
            finally
            {
                konekcija.Close();
            }
            return false;
        }

        public static Boolean InsertActivity(string title, DateTime start_time, DateTime end_time, string act_description, int costs, string summary, string place, int organization_id, int activity_type_id)
        {
            SqlConnection konekcija = getConnection();
            string sqlString = "INSERT INTO Activities (title, start_time, end_time, activity_description, summary, costs, place," +
                " organization_id, activity_type_id)" +
                " VALUES (@title, @start_time, @end_time, @activity_description, @summary, @costs, @place, @organization_id, @activity_type_id)";

            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            komanda.Parameters.AddWithValue("@title", title);
            komanda.Parameters.AddWithValue("@start_time", start_time);
            komanda.Parameters.AddWithValue("@end_time", end_time);
            komanda.Parameters.AddWithValue("@activity_description", act_description);
            komanda.Parameters.AddWithValue("@summary", summary);
            komanda.Parameters.AddWithValue("@costs", costs);
            komanda.Parameters.AddWithValue("@place", place);
            komanda.Parameters.AddWithValue("@organization_id", organization_id);
            komanda.Parameters.AddWithValue("@activity_type_id", activity_type_id);

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

        public static DataSet getVolonteri()
        {
            SqlConnection konekcija = getConnection();
            string sqlString = "SELECT u.first_name, u.last_name, o.organization_name, u.is_member, u.is_active FROM Users u, Organizations o WHERE u.organization_id = o.organization_id";
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);

            SqlDataAdapter adapter = new SqlDataAdapter(komanda);
            DataSet ds = new DataSet();

            try
            {
                konekcija.Open();
                adapter.Fill(ds, "Users");
                return ds;
            }
            catch (Exception err)
            {

            }
            finally
            {
                konekcija.Close();
            }
            return ds;
        }

        public static DataSet getClenovi()
        {
            SqlConnection konekcija = getConnection();
            string sqlString = "SELECT u.user_id, u.first_name, u.last_name, o.organization_name FROM Users u, Organizations o WHERE u.organization_id = o.organization_id AND u.is_member = 1";
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);

            SqlDataAdapter adapter = new SqlDataAdapter(komanda);
            DataSet ds = new DataSet();

            try
            {
                konekcija.Open();
                adapter.Fill(ds, "Users");
                return ds;
            }
            catch (Exception err)
            {

            }
            finally
            {
                konekcija.Close();
            }
            return ds;
        }

        public static List<Organization> getChildOrganizations(int organization_id)
        {
            List<Organization> organizations = new List<Organization>();
            SqlConnection konekcija = getConnection();
            string sqlString = "SELECT * FROM Organizations WHERE parent_id=@organization_id";
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            komanda.Parameters.AddWithValue("@organization_id", organization_id);
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

        public static Boolean canViewMenuItems(int user_id)
        {
            SqlConnection konekcija = getConnection();
            string sqlString = "SELECT COUNT(*) as numRoles FROM URO WHERE role_id != @role AND user_id=@user_id";
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            komanda.Parameters.AddWithValue("@user_id", user_id);
            komanda.Parameters.AddWithValue("@role", (int) Roles.Volonteer);

            try
            {
                konekcija.Open();
                SqlDataReader citac = komanda.ExecuteReader();
                if (citac.Read())
                {
                    int numRoles = int.Parse(citac["numRoles"].ToString());
                    return numRoles > 0;
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

        public static Boolean canAddVolonteri(int user_id)
        {
            SqlConnection konekcija = getConnection();
            string sqlString = "SELECT COUNT(*) as numRoles FROM URO WHERE (role_id = @r1 OR role_id = @r2) AND user_id=@user_id";
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            komanda.Parameters.AddWithValue("@user_id", user_id);
            komanda.Parameters.AddWithValue("@r1", (int) Roles.ClubManager);
            komanda.Parameters.AddWithValue("@r2", (int) Roles.ViceClubManager);

            try
            {
                konekcija.Open();
                SqlDataReader citac = komanda.ExecuteReader();
                if (citac.Read())
                {
                    int numRoles = int.Parse(citac["numRoles"].ToString());
                    return numRoles > 0;
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

        public static DataSet getActivities(int organization_id, int activity_type_id, DateTime from_date, DateTime to_date)
        {
            string sqlString = "";
            SqlConnection konekcija = getConnection();
            if (activity_type_id == 0)
            {
                sqlString = "SELECT * FROM Activities WHERE organization_id=@organization_id and @from_date<star_date and @to_date>end_date";
            }
            else
            {
                sqlString = "SELECT * FROM Activities WHERE organization_id=@organization_id and activity_type_id=@activity_type_id and @from_date<star_date and @to_date>end_date";
            }
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            komanda.Parameters.AddWithValue("@organization_id", organization_id);
            komanda.Parameters.AddWithValue("@activity_type_id", activity_type_id);
            komanda.Parameters.AddWithValue("@from_date", from_date);
            komanda.Parameters.AddWithValue("@to_date", to_date);
            SqlDataAdapter adapter = new SqlDataAdapter(komanda);
            DataSet ds = new DataSet();

            try
            {
                konekcija.Open();
                adapter.Fill(ds, "Activities");
                return ds;
            }
            catch (Exception err)
            {

            }
            finally
            {
                konekcija.Close();
            }
            return ds;
        }
    }
}