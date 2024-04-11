using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;
using System.Data;

namespace ElectionMgt
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        string pibtconnect = @"Data Source=localhost\sqlexpress;Initial Catalog=Election;Integrated Security=True";

        protected void Button1_Click(object sender, EventArgs e)
        {

            SqlConnection conn = new SqlConnection(pibtconnect);
            SqlCommand cmd = new SqlCommand("Select * from admUsers where admName=@username and admpassword=@password", conn);

            cmd.Parameters.AddWithValue("@username", txtNIC.Text);
            cmd.Parameters.AddWithValue("@password", txtPassword.Text);

            conn.Open();

            SqlDataAdapter adapt = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adapt.Fill(ds);

            conn.Close();

            int count = ds.Tables[0].Rows.Count;

            if (count == 1)
            {
                Response.Redirect("WebForm8.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "LoginFailAlert", "alert('Login failed');", true);
            }


        }
    }
}