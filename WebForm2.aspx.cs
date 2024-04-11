using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElectionMgt
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        string pibtconnect = @"Data Source=localhost\sqlexpress;Initial Catalog=Election;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            if (IsNICAlreadyRegistered(txtNIC.Text))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "NICExistsAlert", "alert('NIC already Existed.\\nPlease go to sign in page');", true);
                ClearFields();
                return;
            }

            // Register the user
            RegisterUser(txtNIC.Text, txtName.Text, txtMobile.Text, txtPassword.Text);

            // Redirect to the login page
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Your Request has been sent for approval.\\nPlease check after while'); window.location.href = 'WebForm1.aspx';", true);
        }

        private bool IsNICAlreadyRegistered(string nicNo)
        {
            using (SqlConnection conn = new SqlConnection(pibtconnect))
            {
                conn.Open();

                // Check if NIC is already registered in the Users table
                string query = "SELECT COUNT(*) FROM Otherusers WHERE nicNo = @nicNo";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@nicNo", nicNo);
                    int count = (int)cmd.ExecuteScalar();

                    // If count is greater than 0, NIC is already registered
                    return count > 0;
                }
            }
        }

        private void RegisterUser(string nicNo, string userName, string mobileNo, string password)
        {
            using (SqlConnection conn = new SqlConnection(pibtconnect))
            {
                conn.Open();

                // Insert user information into the Users table
                string insertQuery = "INSERT INTO Otherusers (nicNo, userName, mobileNo, userPassword) VALUES (@nicNo, @userName, @mobileNo, @password)";
                using (SqlCommand cmd = new SqlCommand(insertQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@nicNo", nicNo);
                    cmd.Parameters.AddWithValue("@userName", userName);
                    cmd.Parameters.AddWithValue("@mobileNo", mobileNo);
                    cmd.Parameters.AddWithValue("@password", password);

                    // Execute the query
                    cmd.ExecuteNonQuery();
                }
            }
        }

        private void ClearFields()
        {
            txtNIC.Text = string.Empty;
            txtName.Text = string.Empty;
            txtMobile.Text = string.Empty;
            txtPassword.Text = string.Empty;
        }

    }
}