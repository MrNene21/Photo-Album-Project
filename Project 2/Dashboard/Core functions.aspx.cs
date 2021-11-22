using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace Project_2.Dashboard
{
    public partial class Edit : System.Web.UI.Page
    {
        string sql;
        SqlDataAdapter adapter;
        DataSet ds;
        string connectionString = @"Data Source=LUYANDA\SQLEXPRESS;Initial Catalog=LUYANDA;Integrated Security=True";


        SqlCommand command;

        protected void Page_Load(object sender, EventArgs e)
        {
            app app_ = new app();
            //GetUserID();

            if (Request.Cookies["session"] == null)
            {
                Response.Redirect("../Start/Login.aspx");
            }

            //view datagrid
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

        //binary conversion
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

        //userid
        public int GetUserID()
        {
            int returnValue = 0;

            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();

                string query = $"SELECT UserID FROM UserRegistration WHERE Email='{Request.Cookies["session"].Value}'";

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

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            sql = "SELECT * FROM Images WHERE Name LIKE '%" + txtSearch.Text + "%' OR Tags LIKE '%" + txtSearch.Text + "%'";
            adapter = new SqlDataAdapter(sql, connectionString);
            ds = new DataSet();
            adapter.Fill(ds, "Images");

            gvImages.DataSource = ds;
            gvImages.DataMember = "Images";
            gvImages.DataBind();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
           using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                
                adapter = new SqlDataAdapter();
                sql = @"DELETE FROM Images WHERE ImageID = '" + txtImgID.Text + "'";
                command = new SqlCommand(sql, con);

                ds = new DataSet();

                adapter.DeleteCommand = command;
                adapter.DeleteCommand.ExecuteNonQuery();

                con.Close();

            }

            //view new datagrid
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

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            int ID;
            ID = int.Parse(txtEdit.Text);
            string name = txtName.Text;
            string geolocation = txtGeolocation.Text;
            string tags = txtTags.Text;
            string capturedDate = txtCapturedDate.Text;
            string capturedBy = txtCapturedBy.Text;

            sql = "UPDATE Images SET Name=@Name, Geolocation=@Geolocation, Tags=@Tags, CapturedDate=@CapturedDate, CapturedBy=@CapturedBy WHERE UserID=@UserID";


            adapter = new SqlDataAdapter();
            command = new SqlCommand(sql, con);

            command.Parameters.AddWithValue("@UserID", ID);
            command.Parameters.AddWithValue("@Name", name);
            command.Parameters.AddWithValue("@Geolocation", geolocation);
            command.Parameters.AddWithValue("@Tags", tags);
            command.Parameters.AddWithValue("@CapturedDate", capturedDate);
            command.Parameters.AddWithValue("@CapturedBy", capturedBy);

            command.ExecuteNonQuery();
            con.Close();

            Response.Write("<script>alert('Properties added and updated')</script>");

            //view new datagrid
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

        protected void btnRemove_Click1(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                adapter = new SqlDataAdapter();
                sql = @"DELETE FROM Images WHERE ImageID = '" + TextBox1.Text + "'";
                command = new SqlCommand(sql, con);

                ds = new DataSet();

                adapter.DeleteCommand = command;
                adapter.DeleteCommand.ExecuteNonQuery();

                con.Close();

            }

            //view new datagrid
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
    }
}