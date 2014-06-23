using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MacedonianRedCrossYouth
{
    public class ActivityType
    {
        private int activity_type_id { get; set; }
        private string activity_type_name { get; set; }

        public ActivityType(int id, string name)
        {
            this.activity_type_id = id;
            this.activity_type_name = name;
        }

        public int getActivityTypeID()
        {
            return activity_type_id;
        }
        public string getActivityTypeName()
        {
            return activity_type_name;
        }
    }
}