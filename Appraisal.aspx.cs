



using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GreenValleyAuctionsSystems
{
    public partial class Appraisal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblValid.Visible = false;
            String sqlQuery = "SELECT CUSTOMER.firstName, CUSTOMER.lastName, CUSTOMER.emailAddress, CUSTOMER.phoneNumber, " +
                "CUSTOMER.streetAddress + ' ' + CUSTOMER.city + ', ' + CUSTOMER.state + ' ' + CUSTOMER.zipcode AS CustomerAddress, " +
                "CUSTOMER.initialContact FROM dbo.CUSTOMER";
            //sqlQuery += " WHERE CUSTOMER.customerID = SERVICETICKET.customerID AND SERVICETICKET.serviceID = SERVICE.serviceID AND SERVICE.serviceID = '" + Session["serviceID"].ToString() + "'";

            //calls method to connect database and returns query results
            DataSet customerDS = sqlConnection(sqlQuery);

            //puts each attribute from query into respective variable 
            String fName = customerDS.Tables[0].Rows[0][0].ToString();
            String lName = customerDS.Tables[0].Rows[0][1].ToString();
            String email = customerDS.Tables[0].Rows[0][2].ToString();
            String phone = customerDS.Tables[0].Rows[0][3].ToString();
            String address = customerDS.Tables[0].Rows[0][4].ToString();
            String contact = customerDS.Tables[0].Rows[0][5].ToString();

            ////displays customer information 
            //lblFirstName.Text = "First Name: " + fName;
            //lblLastName.Text = "Last Name: " + lName;
            //lblEmail.Text = "Email: " + email;
            //lblPhone.Text = "Phone Number: " + phone;
            //lblAddress.Text = "Address: " + address;
            //lblInitalContact.Text = "Initial Contact: " + contact;

            Session["CustEmail"] = email;

        }
        protected DataSet sqlConnection(String sqlQuery)
        {
            //creates connection object with the database 
            SqlConnection sqlConnect = new SqlConnection("Server=greenvalleyauctions.cn5mwe8nhtvg.us-east-1.rds.amazonaws.com;Database=Lab4;uid=DukeDevs;password=Capstone1!;Trusted_Connection=Yes;Integrated Security=false;");

            //create sql command object and send query 
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;

            sqlConnect.Open();
            //data set to hold the max id  
            DataSet inventoryDS = new DataSet();
            sqlAdapter.Fill(inventoryDS);

            return inventoryDS;

        }

        protected int getCustomerID()
        {


            String customerIDQuery = "Select customerID from CUSTOMER WHERE emailAddress = '" + Session["CustEmail"].ToString() + "'";
            string custID = "";
            int customerID;
            SqlConnection sqlConnect1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString);
            SqlCommand getCustomerIDCommand = new SqlCommand();
            getCustomerIDCommand.CommandType = CommandType.Text;
            getCustomerIDCommand.CommandText = customerIDQuery;
            getCustomerIDCommand.Connection = sqlConnect1;


            sqlConnect1.Open();
            SqlDataReader getCustomerIDReader = getCustomerIDCommand.ExecuteReader();
            while (getCustomerIDReader.Read())
            {
                custID = getCustomerIDReader["customerID"].ToString();
            }
            customerID = Int32.Parse(custID);
            //txtbxMoveDeadlineDate.Text = deadlineDate;
            sqlConnect1.Close();
            sqlConnect1.Dispose();
            return customerID;

        }
        protected void CreateService()
        {
            int customerID = getCustomerID();

            System.Data.SqlClient.SqlCommand cServ = new System.Data.SqlClient.SqlCommand();
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString);
            con.Open();

            cServ.Connection = con;

            cServ.CommandText = "INSERT INTO SERVICE(serviceName, serviceStatus, customerID) VALUES (@ServiceName, @ServiceStatus, @CustomerID)";

            cServ.Parameters.Add(new SqlParameter("@ServiceName", "Appraisal"));
            cServ.Parameters.Add(new SqlParameter("@ServiceStatus", "New Service"));
            cServ.Parameters.Add(new SqlParameter("@CustomerID", customerID));
            cServ.ExecuteNonQuery();
            con.Close();


        }
        protected int getServiceID()
        {



            String customerIDQuery = "Select MAX(serviceID) from Service";
            string servID = "";
            int serviceID;
            SqlConnection sqlConnect1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString);
            SqlCommand getCustomerIDCommand = new SqlCommand();
            getCustomerIDCommand.CommandType = CommandType.Text;
            getCustomerIDCommand.CommandText = customerIDQuery;
            getCustomerIDCommand.Connection = sqlConnect1;


            sqlConnect1.Open();
            SqlDataReader getServiceIDReader = getCustomerIDCommand.ExecuteReader();
            while (getServiceIDReader.Read())
            {
                servID = getServiceIDReader[""].ToString();
            }
            serviceID = Int32.Parse(servID);
            sqlConnect1.Close();
            sqlConnect1.Dispose();
            return serviceID;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            if (textSize.Text != "" & textInv.Text != "" & typeList.Text != "" & date.Text != "")
            {
                CreateService();
                int serviceID = getServiceID();

                string size = HttpUtility.HtmlEncode(textSize.Text);
                string inv = HttpUtility.HtmlEncode(textInv.Text);
                System.Data.SqlClient.SqlCommand subApp = new System.Data.SqlClient.SqlCommand();
                SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString);
                con.Open();

                subApp.Connection = con;
                subApp.CommandText = "INSERT INTO [dbo].[APPRAISAL] (purpose, deadline, size, inventory, serviceID) VALUES (@Purpose, @Deadline, @Size, @Inventory, @ServiceID)";

                subApp.Parameters.Add(new SqlParameter("@Purpose", typeList.Text));
                subApp.Parameters.Add(new SqlParameter("@Deadline", date.Text));
                subApp.Parameters.Add(new SqlParameter("@Size", size));
                subApp.Parameters.Add(new SqlParameter("@Inventory", inv));
                subApp.Parameters.Add(new SqlParameter("@ServiceID", serviceID));
                subApp.ExecuteNonQuery();
                con.Close();
                lblValid.ForeColor = System.Drawing.Color.Green;
                lblValid.Font.Bold = true;
                lblValid.Visible = true;
                lblValid.Text = "Appraisal Submitted!";

            }
            else
            {
                lblValid.ForeColor = System.Drawing.Color.Red;
                lblValid.Font.Bold = true;
                lblValid.Visible = true;
                lblValid.Text = "Please fill out all information.";

            }

        }

        protected void EstateBut_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void FamilyBut_CheckedChanged(object sender, EventArgs e)
        {

        }
        protected void btnInitialContactForm_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewCustomer.aspx");
        }

        protected void btnAuctionServiceOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("AuctionSchedulingForm.aspx");
        }

        protected void btnAuctionAssessmentForm_Click(object sender, EventArgs e)
        {
            //Change this when form is created
            Response.Redirect("EmployeeDashboard.aspx");
        }

        protected void btnAppraisalServiceOrderForm_Click(object sender, EventArgs e)
        {
            //change this when form is created
            Response.Redirect("Appraisal.aspx");
        }

        protected void btnMoveAssessmentForm_Click(object sender, EventArgs e)
        {
            Response.Redirect("MoveForm.aspx");
        }

        protected void btnMoveServiceOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("MoveSchedulingScreen.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerFile.aspx");
        }

        protected void btnSubmitNote_Click(object sender, EventArgs e)
        {
            String employeeID = GetEmployeeID();

            System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString.ToString());
            sc.Open();

            System.Data.SqlClient.SqlCommand addNote = new System.Data.SqlClient.SqlCommand();
            addNote.Connection = sc;
            // INSERT INTO Note TABLE
            addNote.CommandText = "INSERT INTO dbo.EMPLOYEENOTE (noteTitle, noteBody, employeeID, serviceID) VALUES(@noteTitle, @noteBody, @employeeID, @serviceID)";
            addNote.Parameters.Add(new SqlParameter("@noteTitle", HttpUtility.HtmlEncode(txtTitle.Text)));
            addNote.Parameters.Add(new SqlParameter("@noteBody", HttpUtility.HtmlEncode(txtBody.Text)));
            addNote.Parameters.Add(new SqlParameter("@employeeID", employeeID));
            addNote.Parameters.Add(new SqlParameter("@serviceID", Session["serviceID"]));
            addNote.ExecuteNonQuery();
            sc.Close();
            Response.Redirect("Appraisal.aspx");


        }
        //method to find the employee id 
        protected String GetEmployeeID()
        {
            try
            {
                String sqlQuery = "SELECT EMPLOYEE.employeeID FROM dbo.EMPLOYEE WHERE EMPLOYEE.emailAddress = '" + Session["Username"].ToString() + "'";

                //will hold the ID from query
                String employeeID = "";


                DataTable employeeDS = sqlConnection2(sqlQuery);
                employeeID = employeeDS.Rows[0][0].ToString();

                int newIDNum = int.Parse(employeeID);
                string newID = newIDNum.ToString();

                return newID;
            }
            catch
            {
                return null;
            }

        }
        protected DataTable sqlConnection2(String sqlQuery)
        {
            try
            {
                //creates connection object with the database 
                SqlConnection sqlConnect = new SqlConnection("Server=greenvalleyauctions.cn5mwe8nhtvg.us-east-1.rds.amazonaws.com;Database=Lab4;uid=DukeDevs;password=Capstone1!;Trusted_Connection=Yes;Integrated Security=false;");

                //create sql command object and send query 
                SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = sqlQuery;

                sqlConnect.Open();
                //data set to hold the max id  
                DataTable inventoryDS = new DataTable();
                sqlAdapter.Fill(inventoryDS);

                return inventoryDS;
            }
            catch
            {
                return null;
            }

        }

        protected void btnSubmitToDo_Click(object sender, EventArgs e)
        {
            String user = GetEmployeeID();



            string taskTitle = HttpUtility.HtmlEncode(txtbxToDoItem.Text);
            string taskBody = HttpUtility.HtmlEncode(txtbxToDoDescription.Text);

            System.Data.SqlClient.SqlCommand saveNote = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlCommand getAuth = new System.Data.SqlClient.SqlCommand();
            SqlConnection con2 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString);
            SqlConnection con3 = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString);
            con3.Open();

            con2.Open();
            saveNote.Connection = con2;
            saveNote.CommandText = "INSERT INTO [dbo].[TODO] (taskTitle, taskBody, startDate, endDate, urgency, employeeID, complete) VALUES(@TaskTitle, @TaskBody, GETDATE(), @EndDate, @Urgency, @EmployeeID, @Complete)";
            saveNote.Parameters.Add(new SqlParameter("@TaskTitle", taskTitle));
            saveNote.Parameters.Add(new SqlParameter("@TaskBody", taskBody));
            //saveNote.Parameters.Add(new SqlParameter("@startDate", lblsDate.Text));
            saveNote.Parameters.Add(new SqlParameter("@EndDate", todoDeadlineDate.Text));
            saveNote.Parameters.Add(new SqlParameter("@Complete", HttpUtility.HtmlEncode('0')));

            int status = 0;
            if (rblUrgent.SelectedValue.Equals("Urgent"))
            {
                status = 0;
            }
            if (rblUrgent.SelectedValue.Equals("Very Urgent"))
            {
                status = 1;
            }

            saveNote.Parameters.Add(new SqlParameter("@Urgency", status));
            saveNote.Parameters.Add(new SqlParameter("@EmployeeID", user));
            saveNote.ExecuteNonQuery();
            con2.Close();
            Response.Redirect("EmployeeDashboard.aspx");

        }
    }
}



