using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_2.Dashboard
{
    public partial class app : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //GetUserID();

            note.Visible = false;

            //if (Request.Cookies["session"] == null)
            //{
            //    Response.Redirect("../Start/Login.aspx");
            //}
        }

        string connectionString = @"Data Source=LUYANDA\SQLEXPRESS;Initial Catalog=LUYANDA;Integrated Security=True";

        protected void UploadOpen(object sender, EventArgs e)
        {
            note.Visible = true;
        }

        protected void UploadFile(object sender, EventArgs e)
        {
            ChooseFile();
        }

        private void ChooseFile()
        {
            string UpPath = Server.MapPath("~/UploadedUserFiles");

            string imgName = FileUpload1.FileName;
            //string imgPath = "UploadedUserFiles/" + imgName;

            SqlConnection myConnection = new SqlConnection(connectionString);

            myConnection.Open();

            //string ArticleImg = "UploadedUserFiles/" + FileUpload1.FileName;

            HttpPostedFile postedFile = FileUpload1.PostedFile;

            Stream stream = postedFile.InputStream;
            BinaryReader binaryReader = new BinaryReader(stream);
            byte[] bytes = binaryReader.ReadBytes((int)stream.Length);

            string query = $"INSERT INTO Images(ImageData, UserID) VALUES(CONVERT(varbinary, '{bytes}'), {20})";

            SqlCommand myCommand = new SqlCommand(query, myConnection);

            myCommand.ExecuteNonQuery();

            //myinfo.Text = "connection to db is made";
            myConnection.Close();
        }
        private int GetUserID()
        {
            int uid;
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();

                string query = $"SELECT UserID FROM UserRegistration WHERE Email='{Request.Cookies["session"]}'";

                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);

                uid = Convert.ToInt32(sqlCmd.ExecuteScalar());


                Response.Write($"<script>alert('{uid}')</script>");

                if (uid == 1)
                {
                    Response.Write("<script>alert('Success')</script>");
                }
                else
                {
                    //lblMessage.Text = "";
                    Response.Write("<script>alert('Incorrect credentials!')</script>");
                    Response.Redirect("/Start/Login.aspx", false);
                }
            }

            return uid;
        }
    }
}