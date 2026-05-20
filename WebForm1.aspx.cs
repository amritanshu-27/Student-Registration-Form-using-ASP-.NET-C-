using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI;

namespace reg
{
    public partial class WebForm1 : Page
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsValid)
                    return;

                string regNo = GenerateRegistrationNumber();

                using (SqlConnection con = new SqlConnection(cs))
                {
                    string query = @"INSERT INTO dbo.Users
                                    (RegNo, FullName, DOB, Gender, Phone, Email, Username, Password)
                                    VALUES
                                    (@RegNo, @FullName, @DOB, @Gender, @Phone, @Email, @Username, @Password)";

                    SqlCommand cmd = new SqlCommand(query, con);

                    cmd.Parameters.Add("@RegNo", System.Data.SqlDbType.VarChar).Value = regNo;
                    cmd.Parameters.Add("@FullName", System.Data.SqlDbType.VarChar).Value = txtName.Text.Trim();
                    cmd.Parameters.Add("@DOB", System.Data.SqlDbType.Date).Value = DateTime.Parse(txtDOB.Text);
                    cmd.Parameters.Add("@Gender", System.Data.SqlDbType.VarChar).Value = rblGender.SelectedValue;
                    cmd.Parameters.Add("@Phone", System.Data.SqlDbType.VarChar).Value = txtPhone.Text.Trim();
                    cmd.Parameters.Add("@Email", System.Data.SqlDbType.VarChar).Value = txtEmail.Text.Trim();
                    cmd.Parameters.Add("@Username", System.Data.SqlDbType.VarChar).Value = txtUsername.Text.Trim();

                    // 🔐 HASHED PASSWORD
                    cmd.Parameters.Add("@Password", System.Data.SqlDbType.VarChar)
                        .Value = HashPassword(txtPassword.Text.Trim());

                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                lblMsg.Text = "Registration Successful! Your Registration No: " + regNo;
                lblMsg.ForeColor = System.Drawing.Color.LimeGreen;
                lblMsg.Font.Bold = true;
            }
            catch (Exception ex)
            {
                lblMsg.Text = "Registration Failed: " + ex.Message;
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Font.Bold = true;
            }
        }

        // 🔐 PASSWORD HASHING (SHA256)
        private string HashPassword(string password)
        {
            using (SHA256 sha = SHA256.Create())
            {
                byte[] bytes = sha.ComputeHash(Encoding.UTF8.GetBytes(password));
                StringBuilder sb = new StringBuilder();

                foreach (byte b in bytes)
                    sb.Append(b.ToString("x2"));

                return sb.ToString();
            }
        }

        private string GenerateRegistrationNumber()
        {
            int nextNumber = 1;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT MAX(RegNo) FROM dbo.Users WHERE RegNo LIKE 'AM%KD'";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();

                object result = cmd.ExecuteScalar();

                if (result != null && result != DBNull.Value)
                {
                    string lastRegNo = result.ToString(); // AM0001KD
                    string numericPart = lastRegNo.Substring(2, 4);
                    nextNumber = int.Parse(numericPart) + 1;
                }
            }

            return "AM" + nextNumber.ToString("D4") + "KD";
        }
    }
}
