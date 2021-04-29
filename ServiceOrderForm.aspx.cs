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

namespace GreenValleyAuctionsSystem
{
    public partial class ServiceOrderForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                    SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString);
                    String sqlQuery = "SELECT customerID, firstName +' ' + lastName as FullName FROM dbo.CUSTOMER";
                    DataSet customerList = sqlConnection(sqlQuery);
                    ddlCustomers.DataSource = customerList;
                    ddlCustomers.DataTextField = "FullName";
                    ddlCustomers.DataValueField = "customerID";
                    ddlCustomers.DataBind();

            }

        }
        protected DataSet sqlConnection(String sqlQuery)
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
                DataSet inventoryDS = new DataSet();
                sqlAdapter.Fill(inventoryDS);

                return inventoryDS;
            }
            catch
            {
                return null;
            }

        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            int customerID = int.Parse(ddlCustomers.SelectedValue); //getCustomerID();

            if (cbxAuction.Checked)
            {
                saveService(customerID, "Auction");
                int serviceID = getServiceID();
                if (serviceID == 0)
                {
                    lblConfirmation.Text = "Something Went Wrong. Please Try Again";
                }
                else
                {
                    saveAuctionRequest(serviceID);
                }
            }
            if (cbxMove.Checked)
            {
                saveService(customerID, "Move");
                int serviceID = getServiceID();
                if (serviceID == 0)
                {
                    lblConfirmation.Text = "Something Went Wrong. Please Try Again";
                }
                else
                {
                    saveMoveRequest(serviceID);
                }
            }

            lblConfirmation.Visible = true;
            lblConfirmation.Text = "Service Request(s) Saved!";
            lblConfirmation.ForeColor = Color.Green;
        }
        protected void saveService(int customerID, String serviceType)
        {
            try
            {
                SqlConnection sqlConnect2 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString);
                SqlCommand insertService = new SqlCommand();
                insertService.CommandType = CommandType.Text;
                insertService.CommandText = "INSERT into SERVICE(serviceName, serviceStatus, deadlineDate, dateAdded, customerID) VALUES(@ServiceName, @ServiceStatus, @DeadlineDate, @DateAdded, @CustomerID)";

                insertService.Connection = sqlConnect2;

                insertService.Parameters.Add(new SqlParameter("@ServiceName", HttpUtility.HtmlEncode(serviceType)));
                insertService.Parameters.Add(new SqlParameter("@ServiceStatus", HttpUtility.HtmlEncode("New Service")));
                insertService.Parameters.Add(new SqlParameter("@DeadlineDate", HttpUtility.HtmlEncode(txtbxDeadlineDate.Text)));
                insertService.Parameters.Add(new SqlParameter("@DateAdded", HttpUtility.HtmlEncode(DateTime.Now)));
                insertService.Parameters.Add(new SqlParameter("@CustomerID", HttpUtility.HtmlEncode(customerID)));

                //open connection
                sqlConnect2.Open();

                //send query
                SqlDataReader queryResults = insertService.ExecuteReader();
                //close connections
                queryResults.Close();
                sqlConnect2.Close();
                btnGoToCustomerFile.Visible = true;
            }
            catch
            {
                lblConfirmation.Text= "Something Went Wrong. Please Try Again";
            }
        }
        protected int getServiceID()
        {
            string ID = "";
            int serviceID = 0;
            try
            {

                SqlConnection sqlConnect3 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString);
                SqlCommand maxServiceID = new SqlCommand();
                maxServiceID.CommandType = CommandType.Text;
                maxServiceID.CommandText = "Select max(serviceID) 'serviceID' from SERVICE";

                maxServiceID.Connection = sqlConnect3;
                //open connection
                sqlConnect3.Open();

                //send query
                SqlDataReader queryResults = maxServiceID.ExecuteReader();
                while (queryResults.Read())
                {
                    ID = queryResults["serviceID"].ToString();

                }
                serviceID = Int32.Parse(ID);
                sqlConnect3.Close();
                sqlConnect3.Dispose();
                return serviceID;
            }
            catch
            {
                return 0;
            }
        }

        protected void cbxMove_CheckedChanged(object sender, EventArgs e)
        {
            if (cbxMove.Checked)
            {
                moveCard.Attributes.CssStyle.Add("display", "block");
                moveCardHeader.Attributes.CssStyle.Add("display", "block");
                Table3.Visible = true;
                getMovingCustomerAddress();


            }
            else
            {
                Table3.Visible = false;
                
            }
        }

        protected void cbxAuction_CheckedChanged(object sender, EventArgs e)
        {
            if (cbxAuction.Checked)
            {
                auctionCard.Attributes.CssStyle.Add("display", "block");
                auctionCardHeader.Attributes.CssStyle.Add("display", "block");
                Table2.Visible = true;
                getAuctioningCustomerAddress();
            }
            else
            {
                Table2.Visible = false;

            }
        }
        protected int getCustomerID()
        {
            try
            {
                String customerIDQuery = "Select customerID from CUSTOMER WHERE (firstName + ' ' + lastName) = '" + ddlCustomers.SelectedValue.ToString() + "';";
                String customerID = "";
                int custIdNumber;
                SqlConnection sqlConnect1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString);
                SqlCommand getCustomerIDCommand = new SqlCommand();
                getCustomerIDCommand.CommandType = CommandType.Text;
                getCustomerIDCommand.CommandText = customerIDQuery;
                getCustomerIDCommand.Connection = sqlConnect1;


                sqlConnect1.Open();
                SqlDataReader getCustomerIDReader = getCustomerIDCommand.ExecuteReader();
                while (getCustomerIDReader.Read())
                {
                    customerID = getCustomerIDReader["customerID"].ToString();

                }
                custIdNumber = Int32.Parse(customerID);
                sqlConnect1.Close();
                sqlConnect1.Dispose();
                return custIdNumber;
            }
            catch
            {
                return 0;
            }

        }
        protected void saveAuctionRequest(int serviceID)
        {
            try
            {
                SqlConnection sqlConnect2 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString);
                SqlCommand insertAuctionRequest = new SqlCommand();
                insertAuctionRequest.CommandType = CommandType.Text;
                insertAuctionRequest.CommandText = "INSERT into AUCTIONSERVICE(pickupStreetAddress, pickupCity, pickupState, pickupZipCode," +
                    "serviceID) VALUES(@PickupStreet, @PickupCity, @PickupState, @PickupZipcode, @ServiceID)";

                insertAuctionRequest.Connection = sqlConnect2;

                insertAuctionRequest.Parameters.Add(new SqlParameter("@PickupStreet", HttpUtility.HtmlEncode(txtbxPickupStreet.Text)));
                insertAuctionRequest.Parameters.Add(new SqlParameter("@PickupCity", HttpUtility.HtmlEncode(txtbxPickupCity.Text)));
                insertAuctionRequest.Parameters.Add(new SqlParameter("@PickupState", HttpUtility.HtmlEncode(txtbxPickupState.Text)));
                insertAuctionRequest.Parameters.Add(new SqlParameter("@PickupZipcode", HttpUtility.HtmlEncode(txtbxPickupZipCode.Text)));
                insertAuctionRequest.Parameters.Add(new SqlParameter("@ServiceID", HttpUtility.HtmlEncode(serviceID)));

                //open connection
                sqlConnect2.Open();

                //send query
                SqlDataReader queryResults = insertAuctionRequest.ExecuteReader();
                //close connections
                queryResults.Close();
                sqlConnect2.Close();
            }
            catch
            {
                lblConfirmation.Text = "Auction Could Not be Saved. Please Try Again";
            }

        }
        protected void saveMoveRequest(int serviceID)
        {

            try
            {
                SqlConnection sqlConnect3 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString);
                SqlCommand insertMoveRequest = new SqlCommand();
                insertMoveRequest.CommandType = CommandType.Text;
                insertMoveRequest.CommandText = "INSERT into MOVINGSERVICE(originStreetAddress, originCity, originState, originZipcode," +
                    "destinationStreetAddress, destinationCity, destinationState, destinationZipcode, serviceID) " +
                    "VALUES(@MoveOriginStreet, @MoveOriginCity, @MoveOriginState, @MoveOriginZipcode, @DestinationStreet, @DestinationCity, @DestinationState, @DestinationZipcode, " +
                    "@ServiceID)";
                insertMoveRequest.Connection = sqlConnect3;

                insertMoveRequest.Parameters.Add(new SqlParameter("@MoveOriginStreet", HttpUtility.HtmlEncode(txtbxCurrentStreet.Text)));
                insertMoveRequest.Parameters.Add(new SqlParameter("@MoveOriginCity", HttpUtility.HtmlEncode(txtbxCurrentCity.Text)));
                insertMoveRequest.Parameters.Add(new SqlParameter("@MoveOriginState", HttpUtility.HtmlEncode(txtbxCurrentState.Text)));
                insertMoveRequest.Parameters.Add(new SqlParameter("@MoveOriginZipcode", HttpUtility.HtmlEncode(txtbxCurrentZipCode.Text)));
                insertMoveRequest.Parameters.Add(new SqlParameter("@DestinationStreet", HttpUtility.HtmlEncode(txtbxDestinationStreet.Text)));
                insertMoveRequest.Parameters.Add(new SqlParameter("@DestinationCity", HttpUtility.HtmlEncode(txtbxDestinationCity.Text)));
                insertMoveRequest.Parameters.Add(new SqlParameter("@DestinationState", HttpUtility.HtmlEncode(txtbxDestinationState.Text)));
                insertMoveRequest.Parameters.Add(new SqlParameter("@DestinationZipcode", HttpUtility.HtmlEncode(txtbxDestinationZipCode.Text)));
                insertMoveRequest.Parameters.Add(new SqlParameter("@ServiceID", HttpUtility.HtmlEncode(serviceID)));
                //open connection
                sqlConnect3.Open();

                //send query
                SqlDataReader queryResults = insertMoveRequest.ExecuteReader();
                //close connections
                queryResults.Close();
                sqlConnect3.Close();
            }
            catch
            {
                lblConfirmation.Text = "Move Could Not be Saved. Please Try Again";
            }
        }
        protected void getMovingCustomerAddress()
        {
            try
            {
                String customerIDQuery = "Select deadlineDate, streetAddress, city, state, zipcode from CUSTOMER WHERE customerID = '" + ddlCustomers.SelectedValue.ToString() + "';";
                String custStreet = "";
                String custCity = "";
                String custState = "";
                String custZip = "";
                // String deadlineDate="";
                SqlConnection sqlConnect1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString);
                SqlCommand getCustomerIDCommand = new SqlCommand();
                getCustomerIDCommand.CommandType = CommandType.Text;
                getCustomerIDCommand.CommandText = customerIDQuery;
                getCustomerIDCommand.Connection = sqlConnect1;


                sqlConnect1.Open();
                SqlDataReader getCustomerIDReader = getCustomerIDCommand.ExecuteReader();
                while (getCustomerIDReader.Read())
                {
                    custStreet = getCustomerIDReader["streetAddress"].ToString();
                    custCity = getCustomerIDReader["city"].ToString();
                    custState = getCustomerIDReader["state"].ToString();
                    custZip = getCustomerIDReader["zipcode"].ToString();
                    //deadlineDate = getCustomerIDReader["deadlineDate"].ToString();
                }
                txtbxCurrentStreet.Text = custStreet;
                txtbxCurrentCity.Text = custCity;
                txtbxCurrentState.Text = custState;
                txtbxCurrentZipCode.Text = custZip;
                //txtbxMoveDeadlineDate.Text = deadlineDate;
                sqlConnect1.Close();
                sqlConnect1.Dispose();
            }
            catch
            {
                
            }
        }
        protected void getAuctioningCustomerAddress()
        {
            try
            {
                String customerIDQuery = "Select deadlineDate, streetAddress, city, state, zipcode from CUSTOMER WHERE customerID = '" + ddlCustomers.SelectedValue.ToString() + "';";
                String custStreet = "";
                String custCity = "";
                String custState = "";
                String custZip = "";
                //String deadlineDate = "";
                SqlConnection sqlConnect1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString);
                SqlCommand getCustomerIDCommand = new SqlCommand();
                getCustomerIDCommand.CommandType = CommandType.Text;
                getCustomerIDCommand.CommandText = customerIDQuery;
                getCustomerIDCommand.Connection = sqlConnect1;


                sqlConnect1.Open();
                SqlDataReader getCustomerIDReader = getCustomerIDCommand.ExecuteReader();
                while (getCustomerIDReader.Read())
                {
                    //  deadlineDate = getCustomerIDReader["deadlineDate"].ToString();
                    custStreet = getCustomerIDReader["streetAddress"].ToString();
                    custCity = getCustomerIDReader["city"].ToString();
                    custState = getCustomerIDReader["state"].ToString();
                    custZip = getCustomerIDReader["zipcode"].ToString();
                }
                // txtbxDeadlineDate.Text = deadlineDate;
                txtbxPickupStreet.Text = custStreet;
                txtbxPickupCity.Text = custCity;
                txtbxPickupState.Text = custState;
                txtbxPickupZipCode.Text = custZip;
                sqlConnect1.Close();
                sqlConnect1.Dispose();
            }
            catch
            {

            }

        }

        protected void btnExistingCustomer_Click(object sender, EventArgs e)
        {
            Response.Redirect("ServiceOrderForm.aspx");
        }

        protected void btnNewCustomer_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewCustomer.aspx");
        }

        protected void btnSubmitNote_Click(object sender, EventArgs e)
        {
            try
            {
                //Define connection to database 
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString);


                //create sql command object which will send the query
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = "INSERT INTO CUSTOMERNOTE(noteTitle, noteBody, customerID) VALUES(@NoteTitle, @NoteBody, @CustomerID)";

                sqlCommand.Parameters.Add(new SqlParameter("@NoteTitle", HttpUtility.HtmlEncode(txtTitle.Text)));
                sqlCommand.Parameters.Add(new SqlParameter("@NoteBody", HttpUtility.HtmlEncode(txtBody.Text)));
                sqlCommand.Parameters.Add(new SqlParameter("@CustomerID", HttpUtility.HtmlEncode(int.Parse(ddlCustomers.SelectedValue.ToString()))));


                //open connection
                sqlConnect.Open();

                //send query
                SqlDataReader queryResults = sqlCommand.ExecuteReader();
                //close connections
                queryResults.Close();
                sqlConnect.Close();
            }
            catch
            {
                lblConfirmation.Text = "Note Could Not Be Saved. Please Try Again";
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            String user = GetEmployeeID();
            try
            {


                string taskTitle = HttpUtility.HtmlEncode(txtbxToDoItem.Text);
                string taskBody = HttpUtility.HtmlEncode(txtbxToDoDescription.Text);

                System.Data.SqlClient.SqlCommand saveNote = new System.Data.SqlClient.SqlCommand();
                System.Data.SqlClient.SqlCommand getAuth = new System.Data.SqlClient.SqlCommand();
                SqlConnection con2 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString);
                SqlConnection con3 = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString);
                con3.Open();

                con2.Open();
                saveNote.Connection = con2;
                saveNote.CommandText = "INSERT INTO [dbo].[TODO] (taskTitle, taskBody, startDate, endDate, urgency, complete, employeeID) VALUES(@TaskTitle, @TaskBody, GETDATE(), @EndDate, @Urgency,@Complete, @EmployeeID)";
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
                //Response.Redirect("ServiceOrderForm.aspx");
            }
            catch
            {
                lblConfirmation.Text = "To Do Item Could Not be Saved. Please Try Again";
            }

        }
        protected String GetEmployeeID()
        {
            try
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
            catch
            {
                return null;
            }


        }

        protected void btnGoToCustomerFile_Click(object sender, EventArgs e)
        {
            Session["customerID"] = ddlCustomers.SelectedValue.ToString();
            Response.Redirect("CustomerFile.aspx");
        }
    }
}


