using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ElectionMgt
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        string pibtconnect = @"Data Source=localhost\sqlexpress;Initial Catalog=Election;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPendingCandidates();
            }


        }

        private void LoadPendingCandidates()
        {
            using (SqlConnection conn = new SqlConnection(pibtconnect))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT Candidates.candidateID, Candidates.candiParty, Candidates.nicNo, Otherusers.userName FROM Candidates INNER JOIN Otherusers ON Candidates.nicNo = Otherusers.nicNo WHERE Candidates.IsApproved = 0", conn);
                SqlDataReader reader = cmd.ExecuteReader();

                GridViewPendingCandidates.DataSource = reader;
                GridViewPendingCandidates.DataBind();
            }
        }

        protected void GridViewPendingCandidates_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Approve")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                string candidateID = GridViewPendingCandidates.DataKeys[rowIndex]["candidateID"].ToString();

                ApproveCandidate(candidateID);

                // Reload the GridView to reflect the changes
                LoadPendingCandidates();
            }
            else if (e.CommandName == "Decline")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                string candidateID = GridViewPendingCandidates.DataKeys[rowIndex]["candidateID"].ToString();

                DeclineCandidate(candidateID);

                // Reload the GridView to reflect the changes
                LoadPendingCandidates();
            }
        }

        private void ApproveCandidate(string candidateID)
        {
            using (SqlConnection conn = new SqlConnection(pibtconnect))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("UPDATE Candidates SET IsApproved = 1 WHERE candidateID = @candidateID", conn);
                cmd.Parameters.AddWithValue("@candidateID", candidateID);
                cmd.ExecuteNonQuery();
            }
        }
        private void DeclineCandidate(string candidateID)
        {
            using (SqlConnection conn = new SqlConnection(pibtconnect))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM Candidates WHERE candidateID = @candidateID", conn);
                cmd.Parameters.AddWithValue("@candidateID", candidateID);
                cmd.ExecuteNonQuery();
            }
        }
    }
}