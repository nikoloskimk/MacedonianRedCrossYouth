using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MacedonianRedCrossYouth
{
    public partial class AddDocument : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                int user_id = int.Parse(Session["user_id"].ToString());

                if (!DatabaseManagement.isUserAdmin(user_id))
                {
                    Response.Redirect("Restricted.aspx");
                }
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            String b = UploadFile(sender, e);
            if (b != null)
            {
                int user_id = int.Parse(Session["user_id"].ToString());
                Boolean c = DatabaseManagement.InsertDocument(b, tbPolisa.Text, tbIme.Text, DateTime.Now, user_id);
                if (c)
                {
                    lblInfo.Text = "Фајлот е успешно зачуван.";
                    tbIme.Text = "";
                    tbPolisa.Text = "";
                    lblInfo.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblInfo.Text = "Настана грешка при зачувување на фајлот.";
                    lblInfo.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                lblInfo.Text = "Настана грешка при зачувување на фајлот.";
                lblInfo.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected String UploadFile(Object s, EventArgs e)
        {
            // First we check to see if the user has selected a file
            if (FileUpload1.HasFile)
            {
                // Find the fileUpload control
                string filename = FileUpload1.FileName;

                string extension = System.IO.Path.GetExtension(FileUpload1.FileName);

                // Check if the directory we want the image uploaded to actually exists or not
                if (!Directory.Exists(MapPath(@"UploadedFiles")))
                {
                    // If it doesn't then we just create it before going any further
                    Directory.CreateDirectory(MapPath(@"UploadedFiles"));
                }

                if (!Directory.Exists(MapPath(@"UploadedFiles/documents")))
                {
                    // If it doesn't then we just create it before going any further
                    Directory.CreateDirectory(MapPath(@"UploadedFiles/documents"));
                }

                // Specify the upload directory
                string directory = Server.MapPath(@"UploadedFiles/documents/");

                string fileName = FileUpload1.FileName;
                // Create the path and file name to check for duplicates.
                string pathToCheck = directory + fileName;

                // Create a temporary file name to use for checking duplicates.
                string tempfileName = "";

                // Check to see if a file already exists with the
                // same name as the file to upload.        
                if (System.IO.File.Exists(pathToCheck))
                {
                    int counter = 2;
                    while (System.IO.File.Exists(pathToCheck))
                    {
                        // if a file with this name already exists,
                        // prefix the filename with a number.
                        tempfileName = counter.ToString() + fileName;
                        pathToCheck = directory + tempfileName;
                        counter++;
                    }

                    fileName = tempfileName;
                }

                FileUpload1.SaveAs(directory + fileName);

                return fileName;
            }
            else
            {
                return null;
            }
        }

    }
}