using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Drawing;
using GreenValleyAuctionsSystem;

namespace GreenValleyAuctionsSystems
{
    public partial class ManageEmployees : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            // if the employee that is logged in is NOT admin (Elizabeth or Greg) ... redirect to dashboard
            // need-to-know information basis

            if (Session["Username"].ToString() != "admin")
            {
                Response.Redirect("EmployeeDashboard.aspx");
            }

        }

        protected void addEmployee_Click(object sender, ImageClickEventArgs e)
        {
            //adds styling to elements 
            btnNewEmployee.Attributes.CssStyle.Add("display", "block");
            btnCancelEmployee.Visible = true;
            //txtFirstName.Attributes.CssStyle.Add("margin-left", "70px");

            txtFirstName.Visible = true;
            txtlastName.Visible = true;
            txtPhoneNumber.Visible = true;
            txtPosition.Visible = true;
            txtEmailAddress.Visible = true;
            txtHourlyWage.Visible = true;
        }

        protected void btnNewEmployee_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString.ToString());
                sc.Open();

                System.Data.SqlClient.SqlCommand addEmp = new System.Data.SqlClient.SqlCommand();
                addEmp.Connection = sc;
                // INSERT INTO Note TABLE
                addEmp.CommandText = "INSERT INTO dbo.EMPLOYEE (firstName, lastName, phoneNumber, position, emailAddress, hourlyWage) VALUES (@FirstName, @LastName, @PhoneNumber, @Position, @EmailAddress, @HourlyWage)";
                addEmp.Parameters.Add(new SqlParameter("@FirstName", HttpUtility.HtmlEncode(txtFirstName.Text)));
                addEmp.Parameters.Add(new SqlParameter("@LastName", HttpUtility.HtmlEncode(txtlastName.Text)));
                addEmp.Parameters.Add(new SqlParameter("@PhoneNumber", HttpUtility.HtmlEncode(txtPhoneNumber.Text)));
                addEmp.Parameters.Add(new SqlParameter("@Position", HttpUtility.HtmlEncode(txtPosition.Text)));
                addEmp.Parameters.Add(new SqlParameter("@EmailAddress", HttpUtility.HtmlEncode(txtEmailAddress.Text)));
                addEmp.Parameters.Add(new SqlParameter("@HourlyWage", HttpUtility.HtmlEncode(txtHourlyWage.Text)));
                addEmp.ExecuteNonQuery();
                sc.Close();
                //Response.Redirect("ManageEmployees.aspx");
                txtFirstName.Visible = false;
                txtlastName.Visible = false;
                txtPhoneNumber.Visible = false;
                txtPosition.Visible = false;
                txtEmailAddress.Visible = false;
                txtHourlyWage.Visible = false;
                btnNewEmployee.Visible = false;
                btnCancelEmployee.Visible = false;


                string firstName = HttpUtility.HtmlEncode(txtFirstName.Text);
                string lastName = HttpUtility.HtmlEncode(txtlastName.Text);
                string username = HttpUtility.HtmlEncode(txtEmailAddress.Text);
                string userType = "Employee";
                string passwordName = firstName.ToLower();
                string passwordHash = PasswordHash.HashPassword(passwordName);

                // SqlCommand Chunk to Add User to USER
                System.Data.SqlClient.SqlCommand createUser = new System.Data.SqlClient.SqlCommand();

                SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString.ToString());

                con.Open();

                createUser.Connection = con;

                createUser.CommandText = "INSERT INTO [dbo].[USERS] VALUES(@FirstName, @LastName, @UserName, @UserType)";

                createUser.Parameters.Add(new SqlParameter("@FirstName", firstName));
                createUser.Parameters.Add(new SqlParameter("@LastName", lastName));
                createUser.Parameters.Add(new SqlParameter("@UserName", username));
                createUser.Parameters.Add(new SqlParameter("@UserType", userType));

                createUser.ExecuteNonQuery();
                con.Close();

                // SqlCommand Chunk to Add User to EPASSWORD
                System.Data.SqlClient.SqlCommand setPass = new System.Data.SqlClient.SqlCommand();

                con.Open();

                setPass.Connection = con;

                setPass.CommandText = "INSERT INTO [dbo].[EPASSWORD] VALUES((select max([USER_ID]) from [USERS]), @Username, @Password)";

                setPass.Parameters.Add(new SqlParameter("@Username", username));
                setPass.Parameters.Add(new SqlParameter("@Password", passwordHash));

                setPass.ExecuteNonQuery();

                con.Close();

                Response.Redirect("ManageEmployees.aspx");

            }
            catch
            {
                Response.Redirect("ManageEmployees.aspx");
            }
        }
        protected void btnCancelEmployee_Click(object sender, ImageClickEventArgs e)
        {
            txtFirstName.Text = null;
            txtlastName.Text = null;
            txtPhoneNumber.Text = null;
            txtPosition.Text = null;
            txtEmailAddress.Text = null;
            txtHourlyWage.Text = null;

            txtFirstName.Visible = false;
            txtlastName.Visible = false;
            txtPhoneNumber.Visible = false;
            txtPosition.Visible = false;
            txtEmailAddress.Visible = false;
            txtHourlyWage.Visible = false;

            addEmployee.Attributes.CssStyle.Add("display", "block");
            btnNewEmployee.Attributes.CssStyle.Add("display", "none");
            btnCancelEmployee.Visible = false;

        }

        protected void grdvwEmployeeTable_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                Session["employeeID"] = e.CommandArgument.ToString();

            }




        }
        protected DataTable sqlConnection(String sqlQuery)
        {
            try
            {
                //creates connection object with the database 
                SqlConnection sqlConnect = new SqlConnection("Server=greenvalleyauctions.cn5mwe8nhtvg.us-east-1.rds.amazonaws.com;Database=Lab4;uid=DukeDevs;password=Capstone1!;Trusted_Connection=Yes;Integrated Security=false;");

                SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString.ToString());

                //create sql command object and send query 
                SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, connection);
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = connection;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = sqlQuery;

                connection.Open();
                //data set to hold the max id  
                DataTable inventoryDS = new DataTable();
                sqlAdapter.Fill(inventoryDS);

                connection.Close();

                return inventoryDS;
            }
            catch
            {
                lblResponse.Text = "Database Error: Please try again.";
                return null;
            }


        }

        protected void datasrcEmployee_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            try
            {
                String employeeID = Session["employeeID"].ToString();
                String sqlQuery = "SELECT emailAddress FROM dbo.EMPLOYEE WHERE employeeID = '" + employeeID + "'";
                DataTable emailAddress = sqlConnection(sqlQuery);
                String userName = emailAddress.Rows[0][0].ToString();

                // SqlCommand Chunk to DELETE EMPLOYEE from EPASSWORD
                System.Data.SqlClient.SqlCommand deleteEPASS = new System.Data.SqlClient.SqlCommand();
                SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString.ToString());


                con.Open();

                deleteEPASS.Connection = con;

                deleteEPASS.CommandText = "DELETE FROM EPASSWORD WHERE USERNAME = '" + userName + "'";

                deleteEPASS.ExecuteNonQuery();

                con.Close();

                // SqlCommand Chunk to DELETE EMPLOYEE from USER
                System.Data.SqlClient.SqlCommand deleteEmp = new System.Data.SqlClient.SqlCommand();

                con.Open();

                deleteEmp.Connection = con;

                deleteEmp.CommandText = "DELETE FROM dbo.USERS WHERE USERNAME = '" + userName + "'";

                deleteEmp.ExecuteNonQuery();

                con.Close();

                // SqlCommand Chunk to DELETE EMPLOYEE from TODO
                System.Data.SqlClient.SqlCommand deleteToDo = new System.Data.SqlClient.SqlCommand();

                SqlConnection con2 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString.ToString());

                con2.Open();

                deleteToDo.Connection = con2;

                deleteToDo.CommandText = "DELETE FROM TODO WHERE employeeID = '" + employeeID + "'";

                deleteToDo.ExecuteNonQuery();

                con2.Close();

                // SqlCommand Chunk to DELETE EMPLOYEE from EMPLOYEENOTE
                System.Data.SqlClient.SqlCommand deleteNote = new System.Data.SqlClient.SqlCommand();

                con2.Open();

                deleteNote.Connection = con2;

                deleteNote.CommandText = "DELETE FROM EMPLOYEENOTE WHERE employeeID = '" + employeeID + "'";

                deleteNote.ExecuteNonQuery();

                con2.Close();

                // SqlCOommand Chunk to DELETE EMPLOYEE from CREW
                System.Data.SqlClient.SqlCommand deleteCrew = new System.Data.SqlClient.SqlCommand();

                con2.Open();

                deleteCrew.Connection = con2;

                deleteCrew.CommandText = "DELETE FROM EMPLOYEE WHERE employeeID  = '" + employeeID + "'";

                deleteCrew.ExecuteNonQuery();

                con2.Close();

                Response.Redirect("ManageEmployees.aspx");
            }
            catch
            {
                lblResponse.Text = "Database Error: Please try again.";
            }

        }
    }
}

