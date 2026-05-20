using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace myreq
{
    public partial class Search : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;

                string query = @"SELECT RegNo, FullName, Gender, Phone, Email, Username 
                                 FROM Users WHERE 1=1";

                if (!string.IsNullOrWhiteSpace(txtName.Text))
                {
                    query += " AND FullName LIKE @FullName";
                    cmd.Parameters.AddWithValue("@FullName", "%" + txtName.Text.Trim() + "%");
                }

                if (!string.IsNullOrWhiteSpace(txtDOB.Text))
                {
                    query += " AND DOB = @DOB";
                    cmd.Parameters.AddWithValue("@DOB", DateTime.Parse(txtDOB.Text));
                }

                if (!string.IsNullOrWhiteSpace(txtEmail.Text))
                {
                    query += " AND Email = @Email";
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                }

                if (!string.IsNullOrWhiteSpace(txtPhone.Text))
                {
                    query += " AND Phone = @Phone";
                    cmd.Parameters.AddWithValue("@Phone", txtPhone.Text.Trim());
                }

                cmd.CommandText = query;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvUsers.DataSource = dt;
                gvUsers.DataBind();
            }
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Start.aspx");
        }
    }
}
