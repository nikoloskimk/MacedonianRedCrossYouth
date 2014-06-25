using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MacedonianRedCrossYouth
{
    public class Document
    {
        int document_id { set; get; }
        string document_path { set; get; }
        string title { set; get; }

        public Document(int p1, string p2, string p3)
        {
            this.document_id = p1;
            this.document_path = p2;
            this.title = p3;
        }

        public int getDocumentID()
        {
            return this.document_id;
        }

        public string getTitle()
        {
            return this.title;
        }

        public string getPath()
        {
            return this.document_path;
        }
    }
}