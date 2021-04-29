using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace GreenValleyAuctionsSystem
{
    public partial class EmployeeLogin2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //checks to see if the user logged out 
            if (Request.QueryString.Get("LoggedOut") == "true")
            {
                lblStatus.ForeColor = Color.Green;
                lblStatus.Font.Bold = false;
                lblStatus.Text = "You have been logged out.";
            }
            if (Session["InvalidUse"] != null)
            {
                lblStatus.ForeColor = Color.Red;
                lblStatus.Font.Bold = true;
                lblStatus.Text = Session["InvalidUse"].ToString();
            }
        }
        //checks to see if the user name and login match
        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            try
            {
                //start of pass
                System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString.ToString());

                sc.Open();
                System.Data.SqlClient.SqlCommand findPass = new System.Data.SqlClient.SqlCommand();
                findPass.Connection = sc;
                // SELECT PASSWORD STRING WHERE THE ENTERED USERNAME MATCHES
                findPass.CommandText = "SELECT dbo.EPASSWORD.PASSWORD_HASH FROM dbo.EPASSWORD, dbo.USERS WHERE dbo.USERS.USERNAME = @Username AND dbo.USERS.USER_TYPE = @Type AND dbo.EPASSWORD.USER_ID = dbo.USERS.USER_ID";
                findPass.Parameters.Add(new SqlParameter("@Username", HttpUtility.HtmlEncode(txtUsername.Text)));
                findPass.Parameters.Add(new SqlParameter("@Type", "Employee"));

                SqlDataReader reader = findPass.ExecuteReader(); // create a reader

                if (reader.HasRows) // if the username exists, it will continue
                {
                    while (reader.Read()) // this will read the single record that matches the entered username
                    {
                        string storedHash = reader["PASSWORD_HASH"].ToString(); // store the database password into this variable

                        SqlConnection dbConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString.ToString());

                        SqlCommand loginCommand = new SqlCommand();

                        //properties for this login command object
                        loginCommand.Connection = dbConnection;
                        loginCommand.CommandType = System.Data.CommandType.StoredProcedure;
                        loginCommand.CommandText = "dbo.SP_EMPLOYEELOGIN";

                        loginCommand.Parameters.AddWithValue("@UserName", HttpUtility.HtmlEncode(txtUsername.Text));
                        loginCommand.Parameters.AddWithValue("@Password", storedHash);
                        loginCommand.Parameters.AddWithValue("@Type", "Employee");

                        dbConnection.Open();

                        SqlDataReader loginResults = loginCommand.ExecuteReader();

                        dbConnection.Close();

                        if (PasswordHash.ValidatePassword(HttpUtility.HtmlEncode(txtUserPass.Text), storedHash)) // if the entered password matches what is stored, it will show success
                        {

                            Session["Username"] = HttpUtility.HtmlEncode(txtUsername.Text);
                            Response.Redirect("EmployeeDashboard.aspx");

                            btnSignIn.Enabled = false;
                            txtUsername.Enabled = false;
                            txtUserPass.Enabled = false;
                        }
                        else
                            lblStatus.Text = "Error with your Username/Password combination. Please try again.";
                        lblStatus.ForeColor = Color.Red;
                        lblStatus.Font.Bold = true;
                    }
                }
                else
                {
                    // if the username doesn't exist, it will show failure
                    lblStatus.Text = "Error with your Username/Password combination. Please try again.";
                    lblStatus.ForeColor = Color.Red;
                    lblStatus.Font.Bold = true;
                }
                sc.Close();
            }
            catch
            {
                lblStatus.Text = "Database Error.";
            }
        }
    }
}
