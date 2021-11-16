using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Project_2.Start
{
    public partial class Login : System.Web.UI.Page
    {
        string connectionString = @"Data Source=LUYANDA\SQLEXPRESS;Initial Catalog=LUYANDA;Integrated Security=True";

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                string query = "SELECT COUNT(1) FROM UserRegistration WHERE Email=@Email AND Password=@Password";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                int count = Convert.ToInt32(sqlCmd.ExecuteScalar());

                if (count == 1)
                {
                    Session["Email"] = txtEmail.Text.Trim();

                    //Create session to keep user logged in
                    CreateSession(Session["Email"].ToString());

                    Response.Redirect("../Dashboard/Dashboard.aspx");
                }
                else
                {
                    //lblMessage.Text = "";
                    Response.Write("<script>alert('Incorrect credentials!')</script>");
                }
            }
        }

        private void CreateSession(string Email)
        {
            HttpCookie cookie = new HttpCookie("session");

            cookie.Value = Email;
            cookie.Secure = true;

            //Set Expiration to auto log out user after some time
            cookie.Expires = DateTime.Now.AddMinutes(30000);

            Response.Cookies.Add(cookie);
        }
    }
}