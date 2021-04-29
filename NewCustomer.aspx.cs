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
    public partial class NewCustomer : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["CustomerCreated"] = null;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (customerAlreadyExists(txtbxEmail.Text))
            {
                lblConfirmation.Visible = true;
                lblConfirmation.Text = "Customer Already Exists!";
                lblConfirmation.Font.Bold = true;
                lblConfirmation.CssClass = "alert alert-danger arrow-left";
            }
            else
            {
                Session["CustomerCreated"] = "Yes";


                //Define connection to database 
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString);


                //create sql command object which will send the query
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = "INSERT INTO CUSTOMER(firstName, lastName, initialContact, preferredContactMethod, discoveredFrom, emailAddress, streetAddress, city, state, zipcode, phoneNumber, phoneType, " +
                    "serviceOfInterest, deadlineDate) VALUES(@FirstName, @LastName, @InitialContact, @PreferredContact, @DiscoveredFrom, @Email, @Street, @City, @State, @ZipCode, @PhoneNumber, " +
                    "@PhoneType, @ServiceOfInterest, @DeadlineDate)";

                sqlCommand.Parameters.Add(new SqlParameter("@FirstName", HttpUtility.HtmlEncode(txtbxFName.Text)));
                sqlCommand.Parameters.Add(new SqlParameter("@LastName", HttpUtility.HtmlEncode(txtbxLName.Text)));
                sqlCommand.Parameters.Add(new SqlParameter("@InitialContact", HttpUtility.HtmlEncode(txtbxMethodOfContact.Text)));
                sqlCommand.Parameters.Add(new SqlParameter("@PreferredContact", HttpUtility.HtmlEncode(ddlPrefferedContact.SelectedValue.ToString())));
                sqlCommand.Parameters.Add(new SqlParameter("@DiscoveredFrom", HttpUtility.HtmlEncode(ddlHowTheyHeard.SelectedValue.ToString())));
                sqlCommand.Parameters.Add(new SqlParameter("@Email", HttpUtility.HtmlEncode(txtbxEmail.Text)));
                sqlCommand.Parameters.Add(new SqlParameter("@Street", HttpUtility.HtmlEncode(txtbxCustomerStreet.Text)));
                sqlCommand.Parameters.Add(new SqlParameter("@City", HttpUtility.HtmlEncode(txtbxCustomerCity.Text)));
                sqlCommand.Parameters.Add(new SqlParameter("@State", HttpUtility.HtmlEncode(txtbxCustomerState.Text)));
                sqlCommand.Parameters.Add(new SqlParameter("@ZipCode", HttpUtility.HtmlEncode(txtbxCustomerZipCode.Text)));
                sqlCommand.Parameters.Add(new SqlParameter("@PhoneNumber", HttpUtility.HtmlEncode(txtbxPhoneNumber.Text)));
                sqlCommand.Parameters.Add(new SqlParameter("@PhoneType", HttpUtility.HtmlEncode(ddlPhoneType.SelectedValue.ToString())));
                sqlCommand.Parameters.Add(new SqlParameter("@ServiceOfInterest", HttpUtility.HtmlEncode(ddlServiceOfInterest.SelectedValue.ToString())));
                sqlCommand.Parameters.Add(new SqlParameter("@DeadlineDate", HttpUtility.HtmlEncode(txtbxDeadlineDate.Text)));

                //open connection
                sqlConnect.Open();

                //send query
                SqlDataReader queryResults = sqlCommand.ExecuteReader();
                //close connections
                queryResults.Close();
                sqlConnect.Close();

                lblConfirmation.Visible = true;
                lblConfirmation.Text = "New Customer Successfully Saved!";
                lblConfirmation.ForeColor = Color.Green;
                lblConfirmation.CssClass = "alert alert-success arrow-left";
                lblConfirmation.Font.Bold = false;
                associateNoteWithCustomer();
                btnGoToCustomerFile.Visible = true;

                if (ddlServiceOfInterest.SelectedValue.ToString().Equals("Auction"))
                {
                    Table3.Visible = true;
                    Table5.Visible = true;
                    btnSaveService.Visible = true;
                    serviceRequest.Attributes.CssStyle.Add("display", "block");
                    auctionRequest.Attributes.CssStyle.Add("display", "block");
                    auctionCard.Attributes.CssStyle.Add("display", "block");
                    auctionCardHeader.Attributes.CssStyle.Add("display", "block");

                }
                if (ddlServiceOfInterest.SelectedValue.ToString().Equals("Move"))
                {
                    Table4.Visible = true;
                    Table5.Visible = true;
                    btnSaveService.Visible = true;
                    serviceRequest.Attributes.CssStyle.Add("display", "block");
                    moveRequest.Attributes.CssStyle.Add("display", "block");
                    moveCard.Attributes.CssStyle.Add("display", "block");
                    moveCardHeader.Attributes.CssStyle.Add("display", "block");
                }
                if (ddlServiceOfInterest.SelectedValue.ToString().Equals("Combination"))
                {
                    Table3.Visible = true;
                    Table4.Visible = true;
                    Table5.Visible = true;
                    btnSaveService.Visible = true;
                    serviceRequest.Attributes.CssStyle.Add("display", "block");
                    auctionRequest.Attributes.CssStyle.Add("display", "block");
                    moveRequest.Attributes.CssStyle.Add("display", "block");
                    auctionCard.Attributes.CssStyle.Add("display", "block");
                    auctionCardHeader.Attributes.CssStyle.Add("display", "block");
                    moveCard.Attributes.CssStyle.Add("display", "block");
                    moveCardHeader.Attributes.CssStyle.Add("display", "block");
                }
            }
        }
        protected bool customerAlreadyExists(string email)
        {

                bool alreadyExists = false;
                //Define connection to database 
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString);


                //create sql command object which will send the query
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = "select customerID from customer where emailAddress=@Email";

                sqlCommand.Parameters.Add(new SqlParameter("@Email", HttpUtility.HtmlEncode(txtbxEmail.Text)));

                //open connection
                sqlConnect.Open();

                //send query
                SqlDataReader queryResults = sqlCommand.ExecuteReader();

                while (queryResults.Read())
                {
                    if (queryResults["customerID"].ToString() != null)
                    {
                        alreadyExists = true;
                    }
                }
                //close connections
                queryResults.Close();
                sqlConnect.Close();
                return alreadyExists;
        }
        

        

        protected void submitNote_Click(object sender, EventArgs e)
        {
            if (Session["CustomerCreated"] == null)
            {
                try
                {
                    //Define connection to database 
                    SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString);


                    //create sql command object which will send the query
                    SqlCommand sqlCommand = new SqlCommand();
                    sqlCommand.Connection = sqlConnect;
                    sqlCommand.CommandType = CommandType.Text;
                    sqlCommand.CommandText = "INSERT INTO CUSTOMERNOTE(noteTitle, noteBody) VALUES(@NoteTitle, @NoteBody)";

                    sqlCommand.Parameters.Add(new SqlParameter("@NoteTitle", HttpUtility.HtmlEncode(txtTitle.Text)));
                    sqlCommand.Parameters.Add(new SqlParameter("@NoteBody", HttpUtility.HtmlEncode(txtBody.Text)));


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
                    lblConfirmation.Text = "Could Not Save Note. Please Try Again";
                }
            }
            else
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
                    sqlCommand.Parameters.Add(new SqlParameter("@CustomerID", HttpUtility.HtmlEncode(getCustomerID())));


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
                    lblConfirmation.Text = "Could Not Save Note. Please Try Again";
                }
            }
        }
        protected void associateNoteWithCustomer()
        {
            try
            {
                int customerID = getCustomerID();
                Session["CustomerID"] = customerID;
                //Define connection to database 
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString);
                //create sql command object which will send the query
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = "UPDATE customernote set customerID= @CustomerID WHERE customerID IS NULL;";
                sqlCommand.Parameters.Add(new SqlParameter("@CustomerID", HttpUtility.HtmlEncode(customerID)));

                //open connection
                sqlConnect.Open();

                SqlDataReader queryResults = sqlCommand.ExecuteReader();

                sqlConnect.Close();
                sqlConnect.Dispose();
            }
            catch
            {
                lblConfirmation.Text = "Something Went Wrong. Please Try Again";
            }

        }
        protected int getCustomerID()
        {
            try
            {
                string ID = "";
                int customerID = 0;
                //Define connection to database 
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString);
                //create sql command object which will send the query
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = "select customerID from Customer where emailAddress = @Email;";
                sqlCommand.Parameters.Add(new SqlParameter("@Email", HttpUtility.HtmlEncode(txtbxEmail.Text)));

                //open connection
                sqlConnect.Open();

                //send query
                SqlDataReader queryResults = sqlCommand.ExecuteReader();
                while (queryResults.Read())
                {
                    ID = queryResults["customerID"].ToString();

                }
                customerID = Int32.Parse(ID);
                sqlConnect.Close();
                sqlConnect.Dispose();
                return customerID;
            }
            catch
            {
                return 0;
            }
        }

        protected void btnPopulate_Click(object sender, EventArgs e)
        {
            txtbxFName.Text = "Lenny";
            txtbxLName.Text = "Harris";
            txtbxPhoneNumber.Text = "123-456-7890";
            txtbxEmail.Text = "LHarris@gmail.com";
            txtbxMethodOfContact.Text = "Phone";
            ddlPrefferedContact.SelectedValue = "Phone Call";
            //txtbxHowTheyHeard.Text = "friend";
            txtbxCustomerStreet.Text = "123 N Main St";
            txtbxCustomerCity.Text = "Harrisonburg";
            txtbxCustomerState.Text = "VA";
            txtbxCustomerZipCode.Text = "22801";
            txtbxDeadlineDate.Text = "2021-05-10";
            ddlServiceOfInterest.SelectedValue = "Auction";

        }

        protected void btnGoToCustomerFile_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerFile.aspx");
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
            Response.Redirect("AuctionAssessment.aspx");
        }

        protected void btnAppraisalServiceOrderForm_Click(object sender, EventArgs e)
        {
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

        protected void btnNewCustomer_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewCustomer.aspx");
        }

        protected void btnExistingCustomer_Click(object sender, EventArgs e)
        {
            Response.Redirect("ServiceOrderForm.aspx");
        }

        protected void btnSaveService_Click(object sender, EventArgs e)
        {
            int customerID = getCustomerID();
            if (customerID == 0)
            {
                lblConfirmation.Text = "Service Could Not be Saved. Please Try Again";
            }
            else
            {


                if (ddlServiceOfInterest.SelectedValue.ToString().Equals("Auction"))
                {
                    saveService(customerID, "Auction");
                    int serviceID = getServiceID();
                    if (serviceID == 0)
                    {
                        lblConfirmation.Text = "Service Could Not be Saved. Please Try Again";
                    }
                    else
                    {
                        saveAuctionRequest(serviceID);
                    }
                }
                if (ddlServiceOfInterest.SelectedValue.ToString().Equals("Move"))
                {
                    saveService(customerID, "Move");
                    int serviceID = getServiceID();
                    if (serviceID == 0)
                    {
                        lblConfirmation.Text = "Service Could Not be Saved. Please Try Again";
                    }
                    else
                    {
                        saveMoveRequest(serviceID);
                    }
                    
                }
                if (ddlServiceOfInterest.SelectedValue.ToString().Equals("Combination"))
                {
                    //creates the auction service
                    saveService(customerID, "Auction");
                    int serviceID = getServiceID();
                    if (serviceID == 0)
                    {
                        lblConfirmation.Text = "Service Could Not be Saved. Please Try Again";
                    }
                    else
                    {
                        saveAuctionRequest(serviceID);
                    }

                    //creates the move service next
                    saveService(customerID, "Move");
                    serviceID = getServiceID(); //gets new serviceID value after creating the move service
                    if (serviceID == 0)
                    {
                        lblConfirmation.Text = "Service Could Not be Saved. Please Try Again";
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
            }
            catch
            {
                lblConfirmation.Text = "Service Could Not be Saved. Please Try Again";
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
                lblConfirmation.Text = "Service Could Not be Saved. Please Try Again";
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
                lblConfirmation.Text = "Service Could Not be Saved. Please Try Again";
            }
        }
        protected int getServiceID()
        {
            try
            {
                string ID = "";
                int serviceID = 0;

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
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            String user = GetEmployeeID();
            if (user.Equals("Something Went Wrong. Please Try Again"))
            {
                lblConfirmation.Text = user;
            }
            else
            {

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
                    saveNote.CommandText = "INSERT INTO [dbo].[TODO] (taskTitle, taskBody, startDate, endDate, urgency, complete, employeeID) VALUES(@TaskTitle, @TaskBody, GETDATE(), @EndDate, @Urgency, @Complete, @EmployeeID)";
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
                    //Response.Redirect("NewCustomer.aspx");
                }
                catch
                {
                    lblConfirmation.Text = "Could Not Add to To-Do List. Please Try Again";
                }
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
                return "Something Went Wrong. Please Try Again";
            }


        }

    }
}


