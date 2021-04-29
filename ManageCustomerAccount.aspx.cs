using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data.SqlClient;
using System.Web.Configuration;
using GreenValleyAuctionsSystem;

namespace GreenValleyAuctionsSystems
{
    public partial class ManageCustomerAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpdatePassword_Click(object sender, EventArgs e)
        {

            string username = Session["CustomerUsername"].ToString();

            try
            {

                System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString.ToString());

                sc.Open();

                System.Data.SqlClient.SqlCommand findPass = new System.Data.SqlClient.SqlCommand();

                findPass.Connection = sc;

                // SELECT PASSWORD STRING WHERE THE SAVED USERNAME MATCHES
                findPass.CommandText = "SELECT dbo.CPASSWORD.PASSWORD_HASH FROM dbo.CPASSWORD, dbo.USERS WHERE dbo.USERS.USERNAME = @Username AND dbo.USERS.USER_TYPE = @Type AND dbo.CPASSWORD.USER_ID = dbo.USERS.USER_ID";

                // ADD PARAMETERS
                findPass.Parameters.Add(new SqlParameter("@Username", HttpUtility.HtmlEncode(username)));
                findPass.Parameters.Add(new SqlParameter("@Type", "Customer"));

                // Create a Reader
                SqlDataReader reader = findPass.ExecuteReader();

                // if the username exists, it will continue
                if (reader.HasRows)
                {
                    // this will read the single record that matches the saved username
                    while (reader.Read())
                    {
                        // store the database password into this variable
                        string storedHash = reader["PASSWORD_HASH"].ToString();

                        SqlConnection dbConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString.ToString());

                        SqlCommand loginCommand = new SqlCommand();

                        // Properties for object above
                        loginCommand.Connection = dbConnection;
                        loginCommand.CommandType = System.Data.CommandType.StoredProcedure;

                        // **THIS MIGHT CAUSE AN ERROR**
                        loginCommand.CommandText = "dbo.SP_EMPLOYEELOGIN";

                        // Parameters
                        loginCommand.Parameters.AddWithValue("@UserName", HttpUtility.HtmlEncode(username));
                        loginCommand.Parameters.AddWithValue("@Password", storedHash);
                        // **THIS MIGHT CAUSE AN ERROR**
                        loginCommand.Parameters.AddWithValue("@Type", "Customer");

                        dbConnection.Open();

                        SqlDataReader loginResults = loginCommand.ExecuteReader();

                        dbConnection.Close();

                        // if the entered passwork matches what is stored within the dB, it will pass to the next if-statement
                        if (PasswordHash.ValidatePassword(HttpUtility.HtmlEncode(txtOldPassword.Text), storedHash))
                        {
                            // if the new passwords amtch, update password in dB
                            if (txtNewPasswordOne.Text.Equals(txtNewPasswordTwo.Text))
                            {
                                try
                                {
                                    System.Data.SqlClient.SqlConnection sconnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString.ToString());

                                    sconnection.Open();

                                    System.Data.SqlClient.SqlCommand updatePass = new System.Data.SqlClient.SqlCommand();

                                    updatePass.Connection = sconnection;

                                    // store hashed password into variable
                                    string hashedPassword = PasswordHash.HashPassword(txtNewPasswordOne.Text);

                                    // UPDATE PASSWORD
                                    updatePass.CommandText = "UPDATE CPASSWORD SET PASSWORD_HASH = @hash WHERE USERNAME = @Username";
                                    updatePass.Parameters.Add(new SqlParameter("@hash", PasswordHash.HashPassword(txtNewPasswordOne.Text)));
                                    updatePass.Parameters.Add(new SqlParameter("@Username", username));

                                    updatePass.ExecuteNonQuery();

                                    lblResponse.Text = "SUCCESS: Password updated!";
                                    lblResponse.CssClass = "alert alert-success arrow-left quick";

                                    sconnection.Close();

                                }
                                catch
                                {
                                    lblResponse.Text = "Database Error.";
                                    lblResponse.CssClass = "alert alert-danger arrow-left quick";
                                }
                            }
                            else
                            {
                                lblResponse.Text = "ERROR: New passwords do not match, please try again.";
                                lblResponse.CssClass = "alert alert-danger arrow-left quick";
                            }
                        }
                        else
                        {
                            lblResponse.Text = "ERROR: Incorrect Password";
                            lblResponse.CssClass = "alert alert-danger arrow-left quick";
                        }
                    }
                }
                else
                {
                    lblResponse.Text = "ERROR: Username does not exist in this context.";
                    lblResponse.CssClass = "alert alert-danger arrow-left quick";
                }
                sc.Close();

            }
            catch
            {
                lblResponse.Text = "Database Error.";
                lblResponse.CssClass = "alert alert-danger arrow-left quick";
            }
        }
    }
}






