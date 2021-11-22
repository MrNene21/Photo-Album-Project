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
            sql = "SELECT * FROM Images WHERE Name or Tags '%" + txtSearch.Text + "%'";
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
    }
}