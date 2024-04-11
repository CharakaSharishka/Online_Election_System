using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ElectionMgt
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        string pibtconnect = @"Data Source=localhost\sqlexpress;Initial Catalog=Election;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            // Retrieve Name from Database based on NIC
            string nic = txtNIC.Text.Trim();
            string name = GetNameFromDatabase(nic);

            // Display the retrieved name in txtName
            txtName.Text = name;
        }

        private string GetNameFromDatabase(string nic)
        {
            string name = string.Empty;

            using (SqlConnection conn = new SqlConnection(pibtconnect))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT userName FROM Otherusers WHERE nicNo = @nic", conn);
                cmd.Parameters.AddWithValue("@nic", nic);

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        name = reader["userName"].ToString();
                    }
                    // Close the reader here if necessary
                }

            }

            return name;
        }

        private int RecordDataInCandidatesTable(string party, string nic, string username)
        {
            int candidateID = 0;

            if (!IsCandidateAlreadyRegistered(nic))
            {
                using (SqlConnection conn = new SqlConnection(pibtconnect))
                {
                    conn.Open();

                    // Adjust the SQL query based on your schema and auto-increment settings
                    SqlCommand cmd = new SqlCommand("INSERT INTO Candidates (candiParty, nicNo, userName) VALUES (@party, @nic, @userName); SELECT SCOPE_IDENTITY();", conn);
                    cmd.Parameters.AddWithValue("@party", party);
                    cmd.Parameters.AddWithValue("@nic", nic);
                    cmd.Parameters.AddWithValue("@userName", username);

                    // ExecuteScalar retrieves the newly inserted CandidateID
                    candidateID = Convert.ToInt32(cmd.ExecuteScalar());
                }
            }

            return candidateID;
        }

        private bool IsCandidateAlreadyRegistered(string nic)
        {
            using (SqlConnection conn = new SqlConnection(pibtconnect))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Candidates WHERE nicNo = @nic", conn);
                cmd.Parameters.AddWithValue("@nic", nic);

                int count = Convert.ToInt32(cmd.ExecuteScalar());

                // If count is greater than 0, the candidate is already registered
                return count > 0;
            }
        }

        protected void btnRegister_Click1(object sender, EventArgs e)
        {
            // Record data in the Candidates table and show CandidateID
            string party = ddlParty.SelectedValue;
            string nic = txtNIC.Text.Trim();
            string username = txtName.Text.Trim();  // Added this line to get the username from the TextBox

            // Perform the database insert operation (adjust the SQL query based on your schema)
            int candidateID = RecordDataInCandidatesTable(party, nic, username);

            // Display the CandidateID in lblCandiNo
            lblCandiNo.Text = candidateID > 0 ? $"Your request has been sent for approval. Your Election Candidate ID is: {candidateID}" : "Candidate with the same NIC is already registered.";
        }
    }
}