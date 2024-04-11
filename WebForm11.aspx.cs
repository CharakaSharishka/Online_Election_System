using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;


namespace ElectionMgt
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        string pibtconnect = @"Data Source=localhost\sqlexpress;Initial Catalog=Election;Integrated Security=True";

        public class CandidateData
        {
            public int Position { get; set; }
            public string UserName { get; set; }
            public int VoteCount { get; set; }
            public double VotePercentage { get; set; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load data into the GridView and Chart on initial page load
                CalculateVoteResults();
            }
        }

        protected void CalculateVoteResults()
        {
            List<CandidateData> chartData = new List<CandidateData>();
            int totalVotes = 0;  // Declare totalVotes here

            using (SqlConnection conn = new SqlConnection(pibtconnect))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("SELECT userName, VoteCount FROM Candidates", conn))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        int Position = 1;

                        while (reader.Read())
                        {
                            string userName = reader["userName"].ToString();
                            int voteCount = Convert.ToInt32(reader["VoteCount"]);
                            totalVotes += voteCount;

                            chartData.Add(new CandidateData { Position = Position++, UserName = userName, VoteCount = voteCount });
                        }
                    }
                }
            }

            // Calculate percentages
            foreach (var candidate in chartData)
            {
                if (totalVotes > 0)
                {
                    candidate.VotePercentage = Math.Ceiling(((double)candidate.VoteCount / totalVotes) * 100);
                }
                else
                {
                    candidate.VotePercentage = 0;
                }
            }

            // Sort chartData in descending order by VoteCount
            chartData = chartData.OrderByDescending(x => x.VoteCount).ToList();

            // Assign serial numbers after sorting
            for (int i = 0; i < chartData.Count; i++)
            {
                chartData[i].Position = i + 1;
            }

            // Bind the sorted data to the GridView for tabular representation
            GridView1.DataSource = chartData;
            GridView1.DataBind();

            // Bind the data to the Pie Chart for visualization
            Chart1.DataSource = chartData;
            Chart1.Series["VoteSeries"].XValueMember = "UserName";
            Chart1.Series["VoteSeries"].YValueMembers = "VoteCount";
            Chart1.DataBind();

            // Determine the winner and display the result
            DetermineWinner(chartData);
        }

        protected void DetermineWinner(List<CandidateData> chartData)
        {
            if (chartData.Count > 0)
            {
                CandidateData winner = chartData.First();
                lblWinner.Text = $"Winner: {winner.UserName} with {winner.VoteCount} votes";
            }
            else
            {
                lblWinner.Text = "No votes recorded yet.";
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/WebForm1.aspx");
        }
    }

}