using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MacedonianRedCrossYouth
{
    public class User
    {
        int user_id {set; get;}
        string username {set; get; }
        string password { set; get; }
        string first_name { set; get; }
        string last_name { set; get; }
        string email { set; get; }
        string phone { set; get; }
        int organization_id { set; get; }
        int role_id { set; get; }

        public User(int user_id, string username, string passwrod, string first_name, string last_name, string email,
            string phone, int organization_id, int role_id)
        {
            this.user_id = user_id;
            this.username = username;
            this.password = password;
            this.first_name = first_name;
            this.last_name = last_name;
            this.email = email;
            this.phone = phone;
            this.organization_id = organization_id;
            this.role_id = role_id;
        }
    }
}