using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Xml.Linq;
using System.Data;
using System.Configuration;

namespace ElectionMgt
{

    public partial class WebForm6 : System.Web.UI.Page
    {
        string pibtconnect = @"Data Source=localhost\sqlexpress;Initial Catalog=Election;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load data into ddlParty on initial page load
                LoadPartyData();
            }
        }

        protected void BtnCheckNIC_Click1(object sender, EventArgs e)
        {
            string nic = txtNIC.Text.Trim();
            string name = GetNameFromDatabase(nic);
            lblName.Text = name;
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
                }
            }

            return name;
        }

        protected void LoadPartyData()
        {
            using (SqlConnection conn = new SqlConnection(pibtconnect))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT DISTINCT [candiParty] FROM [Candidates]", conn))
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    ddlParty.DataSource = reader;
                    ddlParty.DataTextField = "candiParty";
                    ddlParty.DataBind();
                    ddlParty.Items.Insert(0, new ListItem("--Select Party--", "0"));
                }
            }
        }

        protected void ddlParty_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Load data into ddlCandi based on the selected party
            LoadCandidateData();
        }

        protected void LoadCandidateData()
        {
            string selectedParty = ddlParty.SelectedValue;

            using (SqlConnection conn = new SqlConnection(pibtconnect))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT [candidateID], [userName] FROM [Candidates] WHERE [candiParty] = @Party", conn))
                {
                    cmd.Parameters.AddWithValue("@Party", selectedParty);
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    ddlCandi.DataSource = reader;
                    ddlCandi.DataTextField = "candidateID";
                    ddlCandi.DataValueField = "candidateID";
                    ddlCandi.DataBind();
                    ddlCandi.Items.Insert(0, new ListItem("--Select Candidate--", "0"));
                }
            }
        }

        protected void ddlCandi_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Display candidate name in txtCandidateName based on the selected candidate
            int selectedCandidateID = Convert.ToInt32(ddlCandi.SelectedValue);
            string userName = GetUserNameByCandidateID(selectedCandidateID);
            txtCandidateName.Text = userName;
        }

        private string GetUserNameByCandidateID(int candidateID)
        {
            string userName = string.Empty;

            using (SqlConnection conn = new SqlConnection(pibtconnect))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT [userName] FROM [Candidates] WHERE [candidateID] = @CandidateID", conn))
                {
                    cmd.Parameters.AddWithValue("@CandidateID", candidateID);
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        userName = reader["userName"].ToString();
                    }
                }
            }

            return userName;
        }

        protected void BtnVote_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(pibtconnect))
                {
                    conn.Open();

                    // Check if the user with the specified NIC has already voted for this candidate
                    if (!HasUserAlreadyVoted(txtNIC.Text, conn))
                    {
                        // Get selected candidate ID
                        int candidateID = Convert.ToInt32(ddlCandi.SelectedValue);

                        // Save data into Otherusers table
                        using (SqlCommand cmdUpdatecandi = new SqlCommand("UPDATE Otherusers SET candidateID = @CandidateID WHERE nicNo = @NIC AND candidateID IS NULL", conn))
                        {
                            cmdUpdatecandi.Parameters.AddWithValue("@NIC", txtNIC.Text);
                            cmdUpdatecandi.Parameters.AddWithValue("@CandidateID", candidateID);
                            int rowsAffected = cmdUpdatecandi.ExecuteNonQuery();

                            // Check if the update was successful (rowsAffected > 0) or not
                            if (rowsAffected > 0)
                            {
                                // Update VoteCount in Candidates table
                                using (SqlCommand cmdUpdate = new SqlCommand("UPDATE Candidates SET VoteCount = VoteCount + 1 WHERE candidateID = @CandidateID", conn))
                                {
                                    cmdUpdate.Parameters.AddWithValue("@CandidateID", candidateID);
                                    cmdUpdate.ExecuteNonQuery();
                                }

                                // Clear controls or perform any other post-vote actions
                                ddlParty.SelectedIndex = 0;
                                ddlCandi.Items.Clear();
                                txtCandidateName.Text = "";
                                txtNIC.Text = "";
                                lblName.Text = "";
                                lblError.Text = "Vote successfully casted!";
                            }
                            else
                            {
                                lblError.Text = "You have already voted for this candidate or the NIC is not registered.";
                            }
                        }
                    }
                    else
                    {
                        lblError.Text = "You have already voted for this candidate or the NIC is not registered.";
                    }
                }
            }
            catch (Exception ex)
            {
                lblError.Text = "Error: " + ex.Message;
            }
        }

        // Function to check if the user with the specified NIC has already voted
        private bool HasUserAlreadyVoted(string nic, SqlConnection conn)
        {
            using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Otherusers WHERE nicNo = @nic AND candidateID IS NOT NULL", conn))
            {
                cmd.Parameters.AddWithValue("@nic", nic);
                int count = (int)cmd.ExecuteScalar();
                return count > 0;
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/WebForm1.aspx");
        }
    }
}