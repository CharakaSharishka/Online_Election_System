using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ElectionMgt
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        string pibtconnect = @"Data Source=localhost\sqlexpress;Initial Catalog=Election;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUsersForApproval();
            }

        }

        private void LoadUsersForApproval()
        {
            using (SqlConnection conn = new SqlConnection(pibtconnect))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT nicNo, userName, mobileNo FROM Otherusers WHERE IsApproved = 0", conn);
                SqlDataReader reader = cmd.ExecuteReader();

                GridViewUsers.DataSource = reader;
                GridViewUsers.DataBind();
            }
        }

        protected void GridViewUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);

            if (rowIndex >= 0 && rowIndex < GridViewUsers.Rows.Count)
            {
                string nicNo = GridViewUsers.DataKeys[rowIndex]["nicNo"].ToString();

                switch (e.CommandName)
                {
                    case "Approve":
                        ApproveUser(nicNo);
                        break;

                    case "Decline":
                        DeclineUser(nicNo);
                        break;
                }

                // Reload the GridView to reflect the changes
                LoadUsersForApproval();

            }


        }

        private void ApproveUser(string nicNo)
        {
            using (SqlConnection conn = new SqlConnection(pibtconnect))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("UPDATE Otherusers SET IsApproved = 1 WHERE nicNo = @nicNo", conn);
                cmd.Parameters.AddWithValue("@nicNo", nicNo);
                cmd.ExecuteNonQuery();
            }

        }

        private void DeclineUser(string nicNo)
        {
            using (SqlConnection conn = new SqlConnection(pibtconnect))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM Otherusers WHERE nicNo = @nicNo", conn);
                cmd.Parameters.AddWithValue("@nicNo", nicNo);
                cmd.ExecuteNonQuery();
            }
        }





    }

        


    

}