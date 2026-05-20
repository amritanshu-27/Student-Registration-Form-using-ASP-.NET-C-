using System;
using System.Configuration;
using System.Data.SqlClient;

namespace reg
{
    public partial class UpdateProfile : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["RegistrationDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadUserData();
            }
        }

        void LoadUserData()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT FullName, DOB, Gender, Phone, Email, Username FROM Users WHERE Username=@Username";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Username", Session["Username"].ToString());

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    txtName.Text = dr["FullName"].ToString();
                    txtDOB.Text = Convert.ToDateTime(dr["DOB"]).ToString("yyyy-MM-dd");
                    ddlGender.SelectedValue = dr["Gender"].ToString();
                    txtPhone.Text = dr["Phone"].ToString();
                    txtEmail.Text = dr["Email"].ToString();
                    txtUsername.Text = dr["Username"].ToString();
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"UPDATE Users SET
                                FullName=@FullName,
                                DOB=@DOB,
                                Gender=@Gender,
                                Phone=@Phone,
                                Email=@Email
                                WHERE Username=@Username";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@FullName", txtName.Text);
                cmd.Parameters.AddWithValue("@DOB", txtDOB.Text);
                cmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
                cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Username", txtUsername.Text);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            Response.Redirect("Dashboard.aspx");
        }
    }
}
