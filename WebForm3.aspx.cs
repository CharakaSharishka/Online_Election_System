using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElectionMgt
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        string pibtconnect = @"Data Source=localhost\sqlexpress;Initial Catalog=Election;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(pibtconnect);
            SqlCommand cmd = new SqlCommand("Select * from Otherusers where nicNo=@username and userPassword=@password", conn);

            cmd.Parameters.AddWithValue("@username", txtNIC.Text);
            cmd.Parameters.AddWithValue("@password", txtPassword.Text);

            conn.Open();

            SqlDataAdapter adapt = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adapt.Fill(ds);

            conn.Close();

            int count = ds.Tables[0].Rows.Count;

            bool loginSuccess = count == 1;

            if (count == 1)
            {
                if (loginSuccess)
                {
                    bool isApproved = YourDataAccess.IsUserApproved(txtNIC.Text, pibtconnect);
                    if (isApproved)
                    {
                        // Redirect to the user page
                        Response.Redirect("WebForm4.aspx");
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "LoginFailAlert", "alert('Your account is not approved yet.');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "LoginFailAlert", "alert('Login failed');", true);
                }
            }
        }
    }

    public class YourDataAccess
    {
        public static bool IsUserApproved(string nicNo, string connectionStr)
        {
            using (SqlConnection conn = new SqlConnection(connectionStr))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("SELECT IsApproved FROM Otherusers WHERE nicNo=@nicNo", conn))
                {
                    cmd.Parameters.AddWithValue("@nicNo", nicNo);

                    // Execute the query
                    object result = cmd.ExecuteScalar();

                    // Check if the result is not null and convert it to a boolean
                    return result != null && Convert.ToBoolean(result);
                }
            }
        }
    }
}
