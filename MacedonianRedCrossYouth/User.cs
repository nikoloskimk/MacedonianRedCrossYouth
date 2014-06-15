using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MacedonianRedCrossYouth
{
    public class User
    {
        public int user_id {set; get;}
        public String username {set; get; }
        public String password { set; get; }
        public String first_name { set; get; }
        public String last_name { set; get; }
        public Boolean gender {set; get; }
        public DateTime birth_date {set; get; }
        public DateTime join_date {set; get;}
        public String image_path {set; get; }
        public String address {set; get; }
        public String phone { set; get; }
        public String email { set; get; }
        public Boolean is_active {set; get; }
        public Boolean is_member {set; get; }
        public int occupation_id {set; get; }
        public String location {set; get; }
        public int nationality_id {set; get; }
        public int faculty_id { set; get; }
        public int organization_id { set; get; }
        public string organization_name { set; get; }

        public User()
        {}

        public string getFullName()
        {
            return this.first_name + " " + this.last_name;
        }


    }
}