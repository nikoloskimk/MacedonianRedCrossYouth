using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MacedonianRedCrossYouth
{
    public class Nationality
    {
        int nationality_id { set; get; }
        string name { set; get; }

        public Nationality(int p1, string p2)
        {
            this.nationality_id = p1;
            this.name = p2;
        }

        public int getNationalityID()
        {
            return this.nationality_id;
        }

        public string getName()
        {
            return this.name;
        }
    }
}