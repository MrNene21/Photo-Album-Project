using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Project_2.Dashboard
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            note.Visible = false;

            if (Request.Cookies["session"] == null)
            {
                Response.Redirect("../Start/Login.aspx");
            }
        }

        protected void Upload(object sender, EventArgs e)
        {

            note.Visible = true;

            string UpPath = Server.MapPath("~/UploadedUserFiles");

            string imgName = FileUpload1.FileName;
            string imgPath = "UploadedUserFiles/" + imgName;

            string connectionString = @"Data Source=LUYANDA\SQLEXPRESS;Initial Catalog=LUYANDA;Integrated Security=True";

            SqlConnection myConnection = new SqlConnection(connectionString);

            myConnection.Open();

            string ArticleImg = "UploadedUserFiles/" + FileUpload1.FileName;

            HttpPostedFile postedFile = FileUpload1.PostedFile;

            Stream stream = postedFile.InputStream;
            BinaryReader binaryReader = new BinaryReader(stream);
            Byte[] bytes = binaryReader.ReadBytes((int)stream.Length);

            string ArticleDateTime = DateTime.Now.ToShortTimeString();

            string query = $"INSERT INTO tblImages VALUES('',{bytes},'',)";

            SqlCommand myCommand = new SqlCommand(query, myConnection);

            myCommand.ExecuteNonQuery();

            //myinfo.Text = "connection to db is made";
            myConnection.Close();
        }
    }
}