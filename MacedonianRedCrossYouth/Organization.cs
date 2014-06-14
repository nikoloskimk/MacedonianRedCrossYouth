using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MacedonianRedCrossYouth
{
    public class Organization
    {
        int organization_id { set; get; }
        string name { set; get; }

        public Organization(int p1, string p2)
        {
            this.organization_id = p1;
            this.name = p2;
        }

        public int getOrganizationID()
        {
            return this.organization_id;
        }

        public string getName()
        {
            return this.name;
        }
    }
}