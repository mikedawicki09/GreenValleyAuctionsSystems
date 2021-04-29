using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;


namespace GreenValleyAuctionsSystem
{
    public partial class CustomerLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            string username = HttpUtility.HtmlEncode(txtUsername.Text);
            string password = HttpUtility.HtmlEncode(txtPassword.Text);

            System.Data.SqlClient.SqlCommand findPassword = new System.Data.SqlClient.SqlCommand();
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString);

            con.Open();
            findPassword.Connection = con;

            // SELECT statement to find hashed password
            findPassword.CommandText = "SELECT PASSWORD_HASH FROM CPASSWORD WHERE USERNAME = @Username";

            // Parameter
            findPassword.Parameters.Add(new SqlParameter("@Username", username));

            // Create a Reader
            SqlDataReader reader = findPassword.ExecuteReader();

            // if statement - see if your username exists
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    // while statement - will read single record that matches username from TextBox
                    string storedHash = reader["PASSWORD_HASH"].ToString();
                    // if statement - check if password patches
                    if (PasswordHash.ValidatePassword(password, storedHash))
                    {
                        Session["CustomerUsername"] = username;
                        //Session["CustomerName"] = username;
                        System.Data.SqlClient.SqlCommand getName = new System.Data.SqlClient.SqlCommand();
                        SqlConnection con2 = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString);

                        con2.Open();
                        getName.Connection = con2;

                        // SELECT statement to find hashed password
                        getName.CommandText = "SELECT FIRST_NAME, LAST_NAME FROM [USERS] WHERE USERNAME = @Username";
                        // Parameter
                        getName.Parameters.Add(new SqlParameter("@Username", username));
                        // Create a Reader
                        SqlDataReader da = getName.ExecuteReader();
                        da.Read();

                        Session["CFirstName"] = da["FIRST_NAME"].ToString();
                        Session["CLastName"] = da["LAST_NAME"].ToString();
                        Session["CustomerName"] = da["FIRST_NAME"].ToString() + " " + da["LAST_NAME"].ToString();
                        con2.Close();
                        Response.Redirect("CustomerPortal.aspx");
                    }
                    else
                    {
                        lblStatus.Text = "ERROR: Username and/or password is incorrect.";
                        lblStatus.CssClass = "alert alert-danger arrow-left quick";
                    }
                }
            }
            // else - if the username does not exist, show error message
            else
            {
                lblStatus.Text = "ERROR: Username does not exist.";
                lblStatus.CssClass = "alert alert-danger arrow-left quick";
            }
        }
    }
}


