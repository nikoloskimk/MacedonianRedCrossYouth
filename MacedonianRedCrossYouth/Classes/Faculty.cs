using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MacedonianRedCrossYouth
{
    public class Faculty
    {
        int faculty_id { get; set; }
        string faculty_name { get; set; }

        public Faculty(int id, string name)
        {
            this.faculty_id = id;
            this.faculty_name = name;
        }

        public int getFacultyId()
        {
            return faculty_id;
        }

        public string getFacultyName()
        {
            return faculty_name;
        }
    }
}