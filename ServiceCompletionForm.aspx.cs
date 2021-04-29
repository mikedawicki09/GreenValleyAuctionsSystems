using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using Microsoft.Exchange.WebServices.Data;

namespace GreenValleyAuctionsSystems
{
    public partial class ServiceCompletionForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["customerID"] == null)
            {
                Response.Redirect("EmployeeDashboard.aspx");
            }
            else
            {
                //if (!Page.IsPostBack)
                //{
                //    SetInitialRow();
                //}

                //connect to database
                SqlConnection sqlConnect = new SqlConnection("Server=greenvalleyauctions.cn5mwe8nhtvg.us-east-1.rds.amazonaws.com;Database=Lab4;uid=DukeDevs;password=Capstone1!;Trusted_Connection=Yes;Integrated Security=false;");

                String sqlQuery = "SELECT CUSTOMER.firstName, CUSTOMER.lastName, CUSTOMER.emailAddress, CUSTOMER.phoneNumber, " +
                    "CUSTOMER.streetAddress + ' ' + CUSTOMER.city + ', ' + CUSTOMER.state + ' ' + CUSTOMER.zipcode AS 'Customer Address', AUCTIONSERVICE.dateOfService, SERVICE.serviceName, AUCTIONSERVICE.totalCost, AUCTIONSERVICE.paymentType" +
                    " FROM dbo.CUSTOMER, dbo.AUCTIONSERVICE, dbo.SERVICE";
                sqlQuery += " WHERE CUSTOMER.customerID = '" + Session["customerID"].ToString() + "' AND SERVICE.serviceID = AUCTIONSERVICE.serviceID";


                //create sql command object and send query 
                SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = sqlQuery;

                sqlConnect.Open();
                //data set to hold the max id  
                DataSet customerDS = new DataSet();
                sqlAdapter.Fill(customerDS);

                String fName = customerDS.Tables[0].Rows[0][0].ToString();
                String lName = customerDS.Tables[0].Rows[0][1].ToString();
                String email = customerDS.Tables[0].Rows[0][2].ToString();
                String phone = customerDS.Tables[0].Rows[0][3].ToString();
                String address = customerDS.Tables[0].Rows[0][4].ToString();
                String date = customerDS.Tables[0].Rows[0][5].ToString();
                String serviceType = customerDS.Tables[0].Rows[0][6].ToString();
                String totalCost = customerDS.Tables[0].Rows[0][7].ToString();
                String paymentType = customerDS.Tables[0].Rows[0][8].ToString();

                lblFName.Text = fName;
                lblLName.Text = lName;
                lblPhone.Text = phone;
                lblCustEmail.Text = email;
                lblAddy.Text = address;
                lblServiceDate.Text = date;
                lblServiceType.Text = serviceType;
                lblTotalCost.Text = totalCost;
                lblPaymentType.Text = paymentType;
            }
        }
        private static bool RedirectionUrlValidationCallback(string redirectionUrl)
        {
            // The default for the validation callback is to reject the URL.
            bool result = false;
            Uri redirectionUri = new Uri(redirectionUrl);
            // Validate the contents of the redirection URL. In this simple validation
            // callback, the redirection URL is considered valid if it is using HTTPS
            // to encrypt the authentication credentials. 
            if (redirectionUri.Scheme == "https")
            {
                result = true;
            }
            return result;
        }

        protected void butSend_Click(object sender, EventArgs e)
        {
            ExchangeService service = new ExchangeService(ExchangeVersion.Exchange2013_SP1);
            service.Credentials = new WebCredentials("duke.devs@outlook.com", "Greenvalley1!");
            service.TraceEnabled = true;
            service.TraceFlags = TraceFlags.All;
            service.AutodiscoverUrl("duke.devs@outlook.com", RedirectionUrlValidationCallback);
            EmailMessage email = new EmailMessage(service);
            email.ToRecipients.Add(txtRec.Text);
            email.Subject = txtSub.Text;
            email.Body = new MessageBody(txtBody.Text);
            email.Send();
            lblSent.Visible = true;
            lblSent.Text = "Your email has been sent!";
            lblSent.ForeColor = Color.Green;
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {

        }

        protected void btnPositive_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnect = new SqlConnection("Server=greenvalleyauctions.cn5mwe8nhtvg.us-east-1.rds.amazonaws.com;Database=Lab4;uid=DukeDevs;password=Capstone1!;Trusted_Connection=Yes;Integrated Security=false;");
            String sqlQuery = "SELECT CUSTOMER.firstName, CUSTOMER.lastName, CUSTOMER.emailAddress FROM dbo.CUSTOMER";
            sqlQuery += " WHERE CUSTOMER.customerID = '" + Session["customerID"].ToString() + "'";


            //create sql command object and send query 
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;

            sqlConnect.Open();
            //data set to hold the max id  
            DataSet customerDS = new DataSet();
            sqlAdapter.Fill(customerDS);

            String fName = customerDS.Tables[0].Rows[0][0].ToString();
            String lName = customerDS.Tables[0].Rows[0][1].ToString();
            String email = customerDS.Tables[0].Rows[0][2].ToString();

            lblBody.Visible = true;
            lblRec.Visible = true;
            lblSub.Visible = true;
            txtRec.Visible = true;
            txtBody.Visible = true;
            txtSub.Visible = true;
            btnSend.Visible = true;

            txtRec.Text = email;
            txtSub.Text = "Service Follow Up for " + fName + " " + lName;
            txtBody.Text = "Hi " + fName + " " + lName + " we greatly appreciated your service and would love it if you left us a review!";
        }

        protected void btnNegative_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnect = new SqlConnection("Server=greenvalleyauctions.cn5mwe8nhtvg.us-east-1.rds.amazonaws.com;Database=Lab4;uid=DukeDevs;password=Capstone1!;Trusted_Connection=Yes;Integrated Security=false;");
            String sqlQuery = "SELECT CUSTOMER.firstName, CUSTOMER.lastName, CUSTOMER.emailAddress FROM dbo.CUSTOMER";
            sqlQuery += " WHERE CUSTOMER.customerID = '" + Session["customerID"].ToString() + "'";


            //create sql command object and send query 
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;

            sqlConnect.Open();
            //data set to hold the max id  
            DataSet customerDS = new DataSet();
            sqlAdapter.Fill(customerDS);

            lblBody.Visible = true;
            lblRec.Visible = true;
            lblSub.Visible = true;
            txtRec.Visible = true;
            txtBody.Visible = true;
            txtSub.Visible = true;
            btnSend.Visible = true;

            String fName = customerDS.Tables[0].Rows[0][0].ToString();
            String lName = customerDS.Tables[0].Rows[0][1].ToString();
            String email = customerDS.Tables[0].Rows[0][2].ToString();

            txtRec.Text = "greg@greenvalley.com";
            txtSub.Text = "Service Follow Up for " + fName + " " + lName;
            txtBody.Text = "Hi Greg, This service with " + fName + " " + lName + " was relatively negative. They were very hard to work with and I think we need to follow up with them. ";
        }

        protected void btnComment_Click(object sender, EventArgs e)
        {
            System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString.ToString());
            sc.Open();

            System.Data.SqlClient.SqlCommand addNote = new System.Data.SqlClient.SqlCommand();
            addNote.Connection = sc;
            // INSERT INTO Customer Note
            String noteID = GenerateID("SELECT MAX(dbo.CUSTOMERNOTE.customerNoteID) FROM dbo.CUSTOMERNOTE");
            addNote.CommandText = "SET IDENTITY_INSERT dbo.CUSTOMERNOTE ON;" +
                " INSERT INTO dbo.CUSTOMERNOTE (customerNoteID, noteTitle, noteBody, customerID) VALUES(@customerNoteID, @noteTitle, @noteBody, @customerID)" +
                " SET IDENTITY_INSERT dbo.CUSTOMERNOTE OFF;";
            addNote.Parameters.Add(new SqlParameter("@customerNoteID", noteID));
            addNote.Parameters.Add(new SqlParameter("@noteTitle", "Service Comment"));
            addNote.Parameters.Add(new SqlParameter("@noteBody", HttpUtility.HtmlEncode(txtComments.Text)));
            addNote.Parameters.Add(new SqlParameter("@customerID", Session["customerID"].ToString()));
            addNote.ExecuteNonQuery();
            lblNotify.Text = "Your service comment has been saved!";
            lblNotify.ForeColor = Color.Green;
        }
        protected String GenerateID(String sqlQuery)
        {
            //holds the max id 
            String maxID = "";

            //connect to database
            SqlConnection sqlConnect = new SqlConnection("Server=greenvalleyauctions.cn5mwe8nhtvg.us-east-1.rds.amazonaws.com;Database=Lab4;uid=DukeDevs;password=Capstone1!;Trusted_Connection=Yes;Integrated Security=false;");

            //create sql command object and send query 
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;

            sqlConnect.Open();
            //data set to hold the max id  
            DataSet maxDS = new DataSet();
            sqlAdapter.Fill(maxDS);

            //place the result into a string
            maxID = maxDS.Tables[0].Rows[0][0].ToString();

            int newIDNum = int.Parse(maxID);
            //increment the max id by 1
            newIDNum++;

            string newID = newIDNum.ToString();
            sqlConnect.Close();

            return newID;

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
            saveNote.CommandText = "INSERT INTO [dbo].[TODO] (taskTitle, taskBody, startDate, endDate, urgency, complete, employeeID) VALUES(@TaskTitle, @TaskBody, GETDATE(), @EndDate, @Urgency, @complete, @EmployeeID)";
            saveNote.Parameters.Add(new SqlParameter("@TaskTitle", taskTitle));
            saveNote.Parameters.Add(new SqlParameter("@TaskBody", taskBody));
            saveNote.Parameters.Add(new SqlParameter("@complete", HttpUtility.HtmlEncode('0')));
            saveNote.Parameters.Add(new SqlParameter("@EndDate", todoDeadlineDate.Text));


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
        protected String GetEmployeeID()
        {
            String sqlQuery = "select EMPLOYEE.employeeID from dbo.EMPLOYEE WHERE dbo.EMPLOYEE.emailAddress = '" + Session["Username"] + "'";

            //will hold the username from query
            String employeeID = "";

            //connect to database
            SqlConnection sqlConnect = new SqlConnection("Server=greenvalleyauctions.cn5mwe8nhtvg.us-east-1.rds.amazonaws.com;Database=Lab4;uid=DukeDevs;password=Capstone1!;Trusted_Connection=Yes;Integrated Security=false;");

            //create sql command object and send query 
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;
            sqlConnect.Open();

            DataSet user = new DataSet();
            sqlAdapter.Fill(user);
            employeeID = user.Tables[0].Rows[0][0].ToString();

            sqlConnect.Close();

            int newEmpID = int.Parse(employeeID);
            string newID = newEmpID.ToString();

            sqlConnect.Close();
            return newID;


        }

    }
}

