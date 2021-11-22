using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace Project_2.Dashboard
{
    public partial class app : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetUserID();

            note.Visible = false;


            if (Request.Cookies["session"] == null)
            {
                Response.Redirect("../Start/Login.aspx");
            }
        }

        public string connectionString = @"Data Source=LUYANDA\SQLEXPRESS;Initial Catalog=LUYANDA;Integrated Security=True";

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
            if(FileUpload1.PostedFile != null)
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

                string query = $"INSERT INTO Images(ImageData, UserID) VALUES(CONVERT(varbinary, '{bytes}'), {GetUserID()})";

                SqlCommand myCommand = new SqlCommand(query, myConnection);

                myCommand.ExecuteNonQuery();

                //myinfo.Text = "connection to db is made";
                myConnection.Close();
            }
            else
            {
                //no file selected
                Response.Write("<script>alert('No file selected')</script>");
            }
        }
        public int GetUserID()
        {
            var value = Request.Cookies["session"].Value;
            int returnValue = 0;

            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();

                string query = $"SELECT UserID FROM UserRegistration WHERE Email='{value}'";

                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);

                SqlDataReader reader = sqlCmd.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        returnValue = reader.GetInt32(0);
                    }
                }
                else
                {
                    //lblMessage.Text = "";
                    //Response.Write("<script>alert('Empty data')</script>");
                }

            }

            return returnValue;
        }

        protected void ViewPhotos(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter($"SELECT * FROM Images WHERE UserID = {GetUserID()}", conn))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    gvImages.DataSource = dt;
                    gvImages.DataBind();
                }
            }
        }

        protected void EditProperies(object sender, EventArgs e)
        {
            Response.Redirect("Core functions.aspx");
        }

        protected void grd_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                System.Web.UI.HtmlControls.HtmlImage imageControl = (System.Web.UI.HtmlControls.HtmlImage)e.Row.FindControl("imageControl");
                if (((DataRowView)e.Row.DataItem)["imagedata"] != DBNull.Value)
                {
                    imageControl.Src = "data:image/png;base64," + Convert.ToBase64String((byte[])(((DataRowView)e.Row.DataItem))["ImageData"]);
                }
            }
        }

    }
}