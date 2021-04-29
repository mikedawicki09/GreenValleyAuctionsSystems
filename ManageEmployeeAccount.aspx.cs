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
    public partial class ManageEmployeeAccount1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpdatePassword_Click(object sender, EventArgs e)
        {


            string username = Session["Username"].ToString();

            try
            {
                //start of pass
                System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString.ToString());

                sc.Open();
                System.Data.SqlClient.SqlCommand findPass = new System.Data.SqlClient.SqlCommand();
                findPass.Connection = sc;
                // SELECT PASSWORD STRING WHERE THE SAVED USERNAME MATCHES
                findPass.CommandText = "SELECT dbo.EPASSWORD.PASSWORD_HASH FROM dbo.EPASSWORD, dbo.USERS WHERE dbo.USERS.USERNAME = @Username AND dbo.USERS.USER_TYPE = @Type AND dbo.EPASSWORD.USER_ID = dbo.USERS.USER_ID";
                findPass.Parameters.Add(new SqlParameter("@Username", HttpUtility.HtmlEncode(username)));
                findPass.Parameters.Add(new SqlParameter("@Type", "Employee"));

                SqlDataReader reader = findPass.ExecuteReader(); // create a reader

                if (reader.HasRows) // if the username exists, it will continue
                {
                    while (reader.Read()) // this will read the single record that matches the saved username
                    {
                        string storedHash = reader["PASSWORD_HASH"].ToString(); // store the database password into this variable

                        SqlConnection dbConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString.ToString());

                        SqlCommand loginCommand = new SqlCommand();

                        //properties for this login command object
                        loginCommand.Connection = dbConnection;
                        loginCommand.CommandType = System.Data.CommandType.StoredProcedure;
                        loginCommand.CommandText = "dbo.SP_EMPLOYEELOGIN";

                        loginCommand.Parameters.AddWithValue("@UserName", HttpUtility.HtmlEncode(username));
                        loginCommand.Parameters.AddWithValue("@Password", storedHash);
                        loginCommand.Parameters.AddWithValue("@Type", "Employee");

                        dbConnection.Open();

                        SqlDataReader loginResults = loginCommand.ExecuteReader();

                        dbConnection.Close();

                        // WORKING PROPERLY
                        // If the entered password matches was is stored within the dB, it will pass to the next if-statement
                        if (PasswordHash.ValidatePassword(HttpUtility.HtmlEncode(txtOldPassword.Text), storedHash))
                        {

                            // if the new passwords match, update password in dB
                            if (txtNewPasswordOne.Text.Equals(txtNewPasswordTwo.Text))
                            {
                                try
                                {
                                    System.Data.SqlClient.SqlConnection sconnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString.ToString());

                                    sconnection.Open();

                                    System.Data.SqlClient.SqlCommand updatePass = new System.Data.SqlClient.SqlCommand();

                                    updatePass.Connection = sconnection;

                                    string hashedPassword = PasswordHash.HashPassword(txtNewPasswordOne.Text);


                                    // UPDATE PASSWORD
                                    updatePass.CommandText = "UPDATE EPASSWORD SET PASSWORD_HASH = @hash WHERE USERNAME = @Username";
                                    updatePass.Parameters.Add(new SqlParameter("@hash", PasswordHash.HashPassword(txtNewPasswordOne.Text)));
                                    updatePass.Parameters.Add(new SqlParameter("@Username", username));

                                    updatePass.ExecuteNonQuery();

                                    lblResponse.Text = "SUCCESS: Password updated!";

                                    sconnection.Close();
                                }
                                catch
                                {
                                    lblResponse.Text = "Database Error.";
                                }

                            }
                            // ELSE - if they do not match, lblResponse has ERROR -- WORKING PROPERLY
                            else
                            {
                                lblResponse.Text = "ERROR: New passwords do not match, please try again.";
                                lblResponse.ForeColor = Color.Red;
                            }

                        }
                        else
                            lblResponse.Text = "ERROR: Incorrect Password";
                    }
                }
                else
                {
                    // if the username doesn't exist, it will show failure
                    lblResponse.Text = "ERROR: Username does not exist in this context.";

                }
                sc.Close();
            }
            catch
            {
                lblResponse.Text = "Database Error.";
            }
        }
    }
}




