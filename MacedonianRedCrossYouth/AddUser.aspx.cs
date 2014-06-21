using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MacedonianRedCrossYouth
{
    public partial class AddUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //organizations
                List<Organization> organizations = DatabaseManagement.getOrganizations();
                

                foreach(Organization o in organizations) {
                    ListItem l = new ListItem(o.getName(), o.getOrganizationID().ToString());
                    ddOrganizations.Items.Add(l);
                }
                if (Session["organization_id"] != null)
                {
                    string organization_id = Session["organization_id"].ToString();
                    ddOrganizations.Items.FindByValue(organization_id).Selected = true;
                }
                    
                //nationalities
                List<Nationality> nationalities = DatabaseManagement.getNationalities();
                ddNationalities.Items.Add(new ListItem("", "0"));

                foreach (Nationality o in nationalities)
                {
                    ListItem l = new ListItem(o.getName(), o.getNationalityID().ToString());
                    ddNationalities.Items.Add(l);
                }
                List<Faculty> faculties = DatabaseManagement.getFaculties();
                ddFakulteti.Items.Add(new ListItem("", "0"));

                foreach (Faculty f in faculties)
                {
                    ListItem l = new ListItem(f.getFacultyName(), f.getFacultyId().ToString());
                    ddFakulteti.Items.Add(l);
                }
            }
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox6_TextChanged(object sender, EventArgs e)
        {

        }

        protected void ddZanimanje_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddZanimanje.SelectedIndex == 2)
            {
                ddFakulteti.Visible = true;
            }
            else
            {
                ddFakulteti.Visible = false;
            }
        }

        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            Validate();

            string username = tbUsername.Text;
            string password = tbPassword.Text;
            Boolean gender;
            if(ddlGender.SelectedIndex == 0){
                gender = true;
            }
            else{
                gender = false;
            }
            DateTime birth_date = Convert.ToDateTime(tbDatumRaganje.Text);
            DateTime join_date = Convert.ToDateTime(tbDatumPristap.Text);
            string image_path = Convert.ToString(FileUpload1.PostedFile.FileName); // zimam pateka na slikata i stavam gu u baza http://stackoverflow.com/questions/1130560/get-full-path-of-a-file-with-fileupload-control
            int zanimanje = 0;
            if(ddZanimanje.SelectedIndex!=-1){
                zanimanje = ddZanimanje.SelectedIndex;
            }
            int nationality_id = Convert.ToInt32(ddNationalities.SelectedItem.Value);
            int faculty_id = 0;
            if(ddFakulteti.SelectedIndex!=-1){
                faculty_id = Convert.ToInt32(ddFakulteti.SelectedItem.Value);
            }
            int organization_id = 0;
            if(ddOrganizations.SelectedIndex!= -1){
                organization_id = Convert.ToInt32(ddOrganizations.SelectedItem.Value);
            }

            DateTime member_since = new DateTime();
            if (Clen.Checked)
            {
                member_since = Convert.ToDateTime(tbMemberSince.Text);
            }

            //proveri ga dodavanjeto !!!!!!!
            Boolean isAdded = DatabaseManagement.InsertUser(username, password, tbFirstName.Text, tbLastName.Text, gender, birth_date, join_date,
               image_path, tbAddress.Text, tbPhone.Text, tbEmail.Text, Aktiven.Checked, Clen.Checked, member_since, zanimanje, tbCity.Text, nationality_id, faculty_id, organization_id);

            if (isAdded)
            {
                Response.Redirect("VolonterskiMenadzment.aspx?succ=1");
            }
            else
            {
                lblError.Visible = true;
            }
            /*
            if (FileUpload1.HasFile)
                // Call a helper method routine to save the file.
                SaveFile(FileUpload1.PostedFile);
            */
            UploadFile(sender, e);
        }

        string image_path = "";

        protected void UploadFile(Object s, EventArgs e)
        {
            // First we check to see if the user has selected a file
            if (FileUpload1.HasFile)
            {
                // Find the fileUpload control
                string filename = FileUpload1.FileName;

                // Check if the directory we want the image uploaded to actually exists or not
                if (!Directory.Exists(MapPath(@"Uploaded-Files")))
                {
                    // If it doesn't then we just create it before going any further
                    Directory.CreateDirectory(MapPath(@"Uploaded-Files"));
                }

                // Specify the upload directory
                string directory = Server.MapPath(@"Uploaded-Files\");

                // Create a bitmap of the content of the fileUpload control in memory
                Bitmap originalBMP = new Bitmap(FileUpload1.FileContent);

                // Calculate the new image dimensions
                /*
                int origWidth = originalBMP.Width;
                int origHeight = originalBMP.Height;
                int sngRatio = origWidth / origHeight;
                int newWidth = 100;
                int newHeight = newWidth / sngRatio;
                */

                decimal origWidth = originalBMP.Width;
                decimal origHeight = originalBMP.Height;
                decimal sngRatio = origHeight / origWidth;
                int newHeight = 240; //hight in pixels 
                decimal newWidth_temp = newHeight / sngRatio;
                int newWidth = 180; 

                // Create a new bitmap which will hold the previous resized bitmap
                Bitmap newBMP = new Bitmap(originalBMP, newWidth, newHeight);
                // Create a graphic based on the new bitmap
                Graphics oGraphics = Graphics.FromImage(newBMP);

                // Set the properties for the new graphic file
                oGraphics.SmoothingMode = SmoothingMode.AntiAlias; oGraphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
                // Draw the new graphic based on the resized bitmap
                oGraphics.DrawImage(originalBMP, 0, 0, newWidth, newHeight);

                // Save the new graphic file to the server
                newBMP.Save(directory + "tn_" + filename);

                // Once finished with the bitmap objects, we deallocate them.
                originalBMP.Dispose();
                newBMP.Dispose();
                oGraphics.Dispose();

                
                // Display the image to the user
               // img1.Visible = true;
               // img1.ImageUrl = @"/Uploaded-Files/tn_" + filename;
                
              //  UploadStatusLabel.Text = "Successfull";
            }
            else
            {
             //   UploadStatusLabel.Text = "No file uploaded!";
            }
        }

        void SaveFile(HttpPostedFile file)
        {

            // Specify the path to save the uploaded file to.
            string appPath = HttpContext.Current.Request.ApplicationPath;
            string physicalPath = HttpContext.Current.Request.MapPath(appPath);

            string savePath = physicalPath + "uploads/images/";

            // Get the name of the file to upload.
            string fileName = file.FileName;


            string extension = System.IO.Path.GetExtension(file.FileName);

            if (extension != ".jpg" && extension != ".png")
            {

              //  UploadStatusLabel.Text = extension + "Must be image.";
                return;
            }

            // Create the path and file name to check for duplicates.
            string pathToCheck = savePath + fileName;

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
                    pathToCheck = savePath + tempfileName;
                    counter++;
                }

                fileName = tempfileName;

                // Notify the user that the file name was changed.
              //  UploadStatusLabel.Text = "A file with the same name already exists." +
               //     "<br />Your file was saved as " + fileName;
            }
            else
            {
                // Notify the user that the file was saved successfully.
              //  UploadStatusLabel.Text = "Your file was uploaded successfully.";
            }

            // Append the name of the file to upload to the path.
            savePath += fileName;

            // Call the SaveAs method to save the uploaded
            // file to the specified directory.
            FileUpload1.SaveAs(savePath);
            image_path = savePath;
        }

        protected void Clen_CheckedChanged(object sender, EventArgs e)
        {
            if (Clen.Checked)
            {
                tbMemberSince.Enabled = true;
            }
            else
            {
                tbMemberSince.Enabled = false;
            }
        }
    }
}