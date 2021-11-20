using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_2.Start
{
    public partial class Login : System.Web.UI.Page
    {
        string connectionString = @"Data Source=LUYANDA\SQLEXPRESS;Initial Catalog=LUYANDA;Integrated Security=True";


        private void CreateSession(string Email)
        {
            HttpCookie cookie = new HttpCookie("session");

            cookie.Value = Email;
            cookie.Secure = true;

            //Set Expiration to auto log out user after some time
            cookie.Expires = DateTime.Now.AddMinutes(30000);

            Response.Cookies.Add(cookie);
        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                string query = "SELECT Email FROM UserRegistration WHERE Email=@Email AND Password=@Password";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                //int count = Convert.ToInt32(sqlCmd.ExecuteScalar());

                SqlDataReader reader = sqlCmd.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        Response.Write($"<script>alert('User: {reader.GetString(0)}')</script>");
                        //Create session to keep user logged in

                        Session["Email"] = reader.GetString(0);

                        CreateSession(Session["Email"].ToString());

                        Response.Redirect("../Dashboard/app.aspx", false);
                    }
                }
                else
                {
                    //lblMessage.Text = "";
                    Response.Write("<script>alert('Incorrect credentials!')</script>");
                }
                
            }
        }

    }
}