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
    public partial class CustomerSignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            // Prevent Cross-Site Scripting
            string firstName = HttpUtility.HtmlEncode(txtFirstName.Text);
            string lastName = HttpUtility.HtmlEncode(txtLastName.Text);
            string username = HttpUtility.HtmlEncode(txtEmailAddress.Text);
            string password1 = HttpUtility.HtmlEncode(txtPassword1.Text);
            string password2 = HttpUtility.HtmlEncode(txtPassword2.Text);
            string phoneNumber = HttpUtility.HtmlEncode(txtPhoneNumber.Text);
            string streetAddress = HttpUtility.HtmlEncode(txtAddress.Text);
            string city = HttpUtility.HtmlEncode(txtCity.Text);
            string state = HttpUtility.HtmlEncode(txtState.Text);
            string zipCode = HttpUtility.HtmlEncode(txtZipCode.Text);
            string userType = HttpUtility.HtmlEncode("Customer");

            if (password1 == password2)
            {

                // Store Customer Username in Session Variable
                Session["CustomerUsername"] = username;
                // Store Customer Full Name in Session Variable
                Session["CustomerName"] = firstName + " " + lastName;


                // Code Chunk to Insert into AUTH (USERS)
                System.Data.SqlClient.SqlCommand createUser = new System.Data.SqlClient.SqlCommand();
                SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString);
                try
                {
                    con.Open();
                    createUser.Connection = con;

                    createUser.CommandText = "INSERT INTO [dbo].[USERS] VALUES(@FirstName, @LastName, @UserName, @UserType)";

                    createUser.Parameters.Add(new SqlParameter("@FirstName", firstName));
                    createUser.Parameters.Add(new SqlParameter("@LastName", lastName));
                    createUser.Parameters.Add(new SqlParameter("@UserName", username));
                    createUser.Parameters.Add(new SqlParameter("@UserType", userType));

                    createUser.ExecuteNonQuery();
                    con.Close();

                    // Code Chunk to Insert into AUTH (CPASSWORD)
                    System.Data.SqlClient.SqlCommand setPass = new System.Data.SqlClient.SqlCommand();

                    con.Open();
                    setPass.Connection = con;

                    setPass.CommandText = "INSERT INTO [dbo].[CPASSWORD] VALUES((select max([USER_ID]) from [USERS]), @Username, @Password)";

                    setPass.Parameters.Add(new SqlParameter("@Username", username));
                    setPass.Parameters.Add(new SqlParameter("@Password", PasswordHash.HashPassword(password1)));

                    setPass.ExecuteNonQuery();
                    con.Close();

                    //// Code Chunk to Insert into Lab4 (CUSTOMER)
                    //System.Data.SqlClient.SqlCommand addCustomer = new System.Data.SqlClient.SqlCommand();
                    //SqlConnection con2 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString);

                    //con2.Open();
                    //addCustomer.Connection = con2;

                    //addCustomer.CommandText = "INSERT INTO [dbo].[CUSTOMER] (firstName, lastName, emailAddress, streetAddress, city, state, zipcode, phoneNumber, phoneType) VALUES(@FirstName, @LastName, @EmailAddress, @Address, @City, @State, @Zipcode, @PhoneNumber, @PhoneType)";

                    //addCustomer.Parameters.Add(new SqlParameter("@FirstName", firstName));
                    //addCustomer.Parameters.Add(new SqlParameter("@LastName", lastName));
                    //addCustomer.Parameters.Add(new SqlParameter("@EmailAddress", username));
                    //// CHANGE TO FULL PASSWORD
                    //addCustomer.Parameters.Add(new SqlParameter("@Address", streetAddress));
                    //addCustomer.Parameters.Add(new SqlParameter("@City", city));
                    //addCustomer.Parameters.Add(new SqlParameter("@State", state));
                    //addCustomer.Parameters.Add(new SqlParameter("@Zipcode", zipCode));
                    //addCustomer.Parameters.Add(new SqlParameter("@PhoneNumber", phoneNumber));
                    //addCustomer.Parameters.Add(new SqlParameter("@PhoneType", "Cell"));
                    //addCustomer.ExecuteNonQuery();

                    //con2.Close();

                    //lblStatus.Text = "Account successfully created!";
                    //lblStatus.CssClass = "alert alert-success arrow-left quick";

                }
                catch (Exception ex)
                {
                    lblStatus.Text = "Database Error.";
                    lblStatus.CssClass = "alert alert-danger arrow-left quick";
                    throw ex;
                }
                finally
                {

                }

                Response.Redirect("CustomerLogin.aspx");

            }
            else
            {
                lblStatus.Text = "ERROR: Passwords do not match.";
                lblStatus.CssClass = "alert alert-danger arrow-left quick";
            }


        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtEmailAddress.Text = "";
            txtPassword1.Text = "";
            txtPassword2.Text = "";
            txtPhoneNumber.Text = "";
            txtAddress.Text = "";
            txtCity.Text = "";
            txtState.Text = "";
            txtZipCode.Text = "";
        }
    }
}



