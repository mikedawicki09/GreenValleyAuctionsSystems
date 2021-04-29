using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GreenValleyAuctionsSystem
{
    public partial class MoveSchedulingScreen : System.Web.UI.Page
    {
        public string serviceID = GenerateID("SELECT MAX(dbo.SERVICE.serviceID) FROM dbo.SERVICE");

        protected static Boolean buttonClicked = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["customerID"] == null)
            {
                Response.Redirect("EmployeeDashboard.aspx");
            }
            else
            {
                //connect to database
                SqlConnection sqlConnect = new SqlConnection("Server=greenvalleyauctions.cn5mwe8nhtvg.us-east-1.rds.amazonaws.com;Database=Lab4;uid=DukeDevs;password=Capstone1!;Trusted_Connection=Yes;Integrated Security=false;");

                String sqlQuery = "SELECT CUSTOMER.firstName, CUSTOMER.lastName FROM dbo.CUSTOMER";
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

                //lblHeader.Text = "Auction Assessment Form for " + fName + " " + lName;
                lblCustomerName.Text = fName + " " + lName;
            }
            if (Session["customerID"] == null)
            {
                Response.Redirect("EmployeeDashboard.aspx");
            }
            
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }
        //method to populate sample data in text boxes
        protected void BtnPopulate_Click(object sender, EventArgs e)
        {
            ddlPricing.SelectedValue = "MLS Listing";
            txtComp.Text = "2021-02-02";
            txtTitle.Text = "Need to call back";
            txtNote.Text = "Customer asked for more details regarding prices.";
            txtIns.Text = "JK Moving";
            txtEstimatedHours.Text = "5";
            txtFuel.Text = "36";
            txtMen.Text = "2";
            txtOriginAddress.Text = "200 South Main Street";
            txtOriginCity.Text = "Harrisonburg";
            txtOriginState.Text = "VA";
            txtOriginZipCode.Text = "22801";
            txtDestinationAddress.Text = "4382 Duke Dog Avenue";
            txtDestinationCity.Text = "Harrisonburg";
            txtDestinationState.Text = "VA";
            txtDestinationZipCode.Text = "22801";
            txtSupplyCost.Text = "200";
            txtMiles.Text = "73";
            txtEstimate.Text = "4300";
            txtFoodHotel.Text = "400";
            txtFinal.Text = "5";
            txtMoveDate.Text = "2021-02-01";
            txtMoveTime.Text = "07:30:00 AM";
            txtTrash.Text = "Two Dumpsters Full";
            txtTotalCost.Text = "4300";
            txtPaymentType.Text = "Visa";
        }
        //method to clear all data from text boxes
        protected void BtnClear_Click(object sender, EventArgs e)
        {
            ddlPricing.SelectedValue = "Select";
            txtComp.Text = "";
            txtTitle.Text = "";
            txtNote.Text = "";
            txtIns.Text = "";
            txtEstimatedHours.Text = "";
            txtFuel.Text = "";
            txtMen.Text = "";
            txtSupplyCost.Text = "";
            txtMiles.Text = "";
            txtEstimate.Text = "";
            txtFoodHotel.Text = "";
            txtOriginAddress.Text = "";
            txtOriginCity.Text = "";
            txtOriginState.Text = "";
            txtOriginZipCode.Text = "";
            txtDestinationAddress.Text = "";
            txtDestinationCity.Text = "";
            txtDestinationState.Text = "";
            txtDestinationZipCode.Text = "";
            txtMoveDate.Text = "";
            txtMoveTime.Text = "";
            txtTrash.Text = "";
            txtTotalCost.Text = "";
            txtPaymentType.Text = "";
            txtFinal.Text = "";
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {



                try
                {
                    String movingServiceID = getMovingServiceID();
                    String noteID = GenerateID("SELECT MAX(dbo.EMPLOYEENOTE.noteID) FROM dbo.EMPLOYEENOTE");
                    String equipmentServiceID = GenerateID("SELECT MAX(dbo.EQUIPMENTSERVICE.equipmentServiceID) FROM dbo.EQUIPMENTSERVICE");
                    String crewID = GenerateID("SELECT MAX(dbo.CREW.crewID) FROM dbo.CREW");
                    string datePart = txtMoveDate.Text.ToString().Trim();
                    string timePart = txtMoveTime.Text.ToString().Trim();
                    string timeAndDate = string.Format("{0} {1}", datePart, timePart);
                    DateTime timeDate = DateTime.Parse(timeAndDate);
                    String estimatePrice = HttpUtility.HtmlEncode(txtEstimate.Text);
                    int men = int.Parse(HttpUtility.HtmlEncode(txtMen.Text));
                    int hourEstimate = int.Parse(HttpUtility.HtmlEncode(txtEstimatedHours.Text));
                    String supplyCost = HttpUtility.HtmlEncode(txtSupplyCost.Text);
                    int mileage = int.Parse(HttpUtility.HtmlEncode(txtMiles.Text));
                    int hourFinal = int.Parse(HttpUtility.HtmlEncode(txtFinal.Text));
                    String fuel = HttpUtility.HtmlEncode(txtFuel.Text);
                    String insurance = HttpUtility.HtmlEncode(txtIns.Text);
                    String foodAndHotel = HttpUtility.HtmlEncode(txtFoodHotel.Text);



                    System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString.ToString());
                    sc.Open();



                    System.Data.SqlClient.SqlCommand addMovServ = new System.Data.SqlClient.SqlCommand();
                    addMovServ.Connection = sc;
                    // INSERT MovingService RECORD
                    addMovServ.CommandText = "UPDATE dbo.MOVINGSERVICE SET originStreetAddress =@originStreetAddress, originCity=@originCity, originState=@originState, originZipCode=@originZipCode, destinationStreetAddress=@destinationStreetAddress, destinationCity=@destinationCity," +
                        " destinationState=@destinationState, destinationZipCode=@destinationZipCode, pricingRetrieved=@pricingRetrieved, estimatePrice=@estimatePrice, men= @men, hourEstimate=@hourEstimate, supplyCost= @supplyCost," +
                        " mileage=@mileage, hourFinal=@hourFinal, fuel=@fuel, insurance= @insurance, foodAndHotel=@foodAndHotel, serviceID=@serviceID, dateOfService=@dateOfService, trashDescription = @trashDescription, totalCost=@totalCost, paymentType=@paymentType WHERE movingServiceID = @movingServiceID";

                    addMovServ.Parameters.Add(new SqlParameter("@movingServiceID", movingServiceID));
                    addMovServ.Parameters.Add(new SqlParameter("@originStreetAddress", HttpUtility.HtmlEncode(txtOriginAddress.Text)));
                    addMovServ.Parameters.Add(new SqlParameter("@originCity", HttpUtility.HtmlEncode(txtOriginCity.Text)));
                    addMovServ.Parameters.Add(new SqlParameter("@originState", HttpUtility.HtmlEncode(txtOriginState.Text)));
                    addMovServ.Parameters.Add(new SqlParameter("@originZipCode", HttpUtility.HtmlEncode(txtOriginZipCode.Text)));
                    addMovServ.Parameters.Add(new SqlParameter("@destinationStreetAddress", HttpUtility.HtmlEncode(txtDestinationAddress.Text)));
                    addMovServ.Parameters.Add(new SqlParameter("@destinationCity", HttpUtility.HtmlEncode(txtDestinationCity.Text)));
                    addMovServ.Parameters.Add(new SqlParameter("@destinationState", HttpUtility.HtmlEncode(txtDestinationState.Text)));
                    addMovServ.Parameters.Add(new SqlParameter("@destinationZipCode", HttpUtility.HtmlEncode(txtDestinationZipCode.Text)));
                    addMovServ.Parameters.Add(new SqlParameter("@pricingRetrieved", ddlPricing.SelectedValue));
                    addMovServ.Parameters.Add(new SqlParameter("@estimatePrice", estimatePrice));
                    addMovServ.Parameters.Add(new SqlParameter("@men", men));
                    addMovServ.Parameters.Add(new SqlParameter("@hourEstimate", hourEstimate));
                    addMovServ.Parameters.Add(new SqlParameter("@supplyCost", supplyCost));
                    addMovServ.Parameters.Add(new SqlParameter("@mileage", mileage));
                    addMovServ.Parameters.Add(new SqlParameter("@hourFinal", hourFinal));
                    addMovServ.Parameters.Add(new SqlParameter("@fuel", fuel));
                    addMovServ.Parameters.Add(new SqlParameter("@insurance", insurance));
                    addMovServ.Parameters.Add(new SqlParameter("@foodAndHotel", foodAndHotel));
                    addMovServ.Parameters.Add(new SqlParameter("@serviceID", Session["serviceID"].ToString()));
                    addMovServ.Parameters.Add(new SqlParameter("@dateOfService", timeDate));
                    addMovServ.Parameters.Add(new SqlParameter("@trashDescription", HttpUtility.HtmlEncode(txtTrash.Text)));
                    addMovServ.Parameters.Add(new SqlParameter("@totalCost", HttpUtility.HtmlEncode(txtTotalCost.Text)));
                    addMovServ.Parameters.Add(new SqlParameter("@paymentType", HttpUtility.HtmlEncode(txtPaymentType.Text)));
                    addMovServ.ExecuteNonQuery();

                    System.Data.SqlClient.SqlCommand addNote = new System.Data.SqlClient.SqlCommand();
                    addNote.Connection = sc;
                    // INSERT INTO Workflow TABLE
                    String employee = getEmployee();
                    addNote.CommandText = "SET IDENTITY_INSERT dbo.EMPLOYEENOTE ON;" +
                        " INSERT INTO dbo.EMPLOYEENOTE (noteID, noteTitle, noteBody, employeeID, serviceID) VALUES(@noteID, @noteTitle, @noteBody, @employeeID, @serviceID)" +
                        " SET IDENTITY_INSERT dbo.EMPLOYEENOTE OFF;";
                    addNote.Parameters.Add(new SqlParameter("@noteID", noteID));
                    addNote.Parameters.Add(new SqlParameter("@noteTitle", HttpUtility.HtmlEncode(txtTitle.Text)));
                    addNote.Parameters.Add(new SqlParameter("@noteBody", HttpUtility.HtmlEncode(txtNote.Text)));
                    addNote.Parameters.Add(new SqlParameter("@employeeID", employee));
                    addNote.Parameters.Add(new SqlParameter("@serviceID", Session["serviceID"].ToString()));
                    addNote.ExecuteNonQuery();

                    for (int i = 0; i <= chkBoxVehicles.Items.Count - 1; i++)
                    {
                        if (chkBoxVehicles.Items[i].Selected)
                        {
                            String vehicle = chkBoxVehicles.Items[i].ToString();
                            String equipmentID = getEquipmentID(vehicle);
                            System.Data.SqlClient.SqlCommand addEqipServ = new System.Data.SqlClient.SqlCommand();
                            addEqipServ.Connection = sc;
                            // INSERT Service RECORD
                            addEqipServ.CommandText = "SET IDENTITY_INSERT dbo.EQUIPMENTSERVICE ON;" +
                                " INSERT INTO dbo.EQUIPMENTSERVICE (equipmentServiceID, serviceID, equipmentID) VALUES(@equipmentServiceID, @serviceID, @equipmentID)" +
                                " SET IDENTITY_INSERT dbo.EQUIPMENTSERVICE OFF;";
                            addEqipServ.Parameters.Add(new SqlParameter("@equipmentServiceID", GenerateID("SELECT MAX(dbo.EQUIPMENTSERVICE.equipmentServiceID) FROM dbo.EQUIPMENTSERVICE")));
                            addEqipServ.Parameters.Add(new SqlParameter("@serviceID", Session["serviceID"].ToString()));
                            addEqipServ.Parameters.Add(new SqlParameter("@equipmentID", equipmentID));
                            addEqipServ.ExecuteNonQuery();
                        }
                    }

                    for (int i = 0; i <= chkbxCrew.Items.Count - 1; i++)
                    {
                        if (chkbxCrew.Items[i].Selected)
                        {
                            String employeeName = chkbxCrew.Items[i].Text;
                            String employeeID = getEmployeeID(employeeName);
                            System.Data.SqlClient.SqlCommand addCrew = new System.Data.SqlClient.SqlCommand();
                            addCrew.Connection = sc;
                            // INSERT Service RECORD
                            addCrew.CommandText = "SET IDENTITY_INSERT dbo.CREW ON;" +
                                " INSERT INTO dbo.CREW (crewID, employeeID, serviceID) VALUES(@crewID, @employeeID, @serviceID)" +
                                " SET IDENTITY_INSERT dbo.EQUIPMENTSERVICE OFF;";
                            addCrew.Parameters.Add(new SqlParameter("@crewID", GenerateID("SELECT MAX(dbo.CREW.crewID) FROM dbo.CREW")));
                            addCrew.Parameters.Add(new SqlParameter("@employeeID", employeeID));
                            addCrew.Parameters.Add(new SqlParameter("@serviceID", Session["serviceID"].ToString()));
                            addCrew.ExecuteNonQuery();
                            lblNotify.Text = "Moving Service Ticket has been added!";
                            BtnCompletion.Visible = true;
                            associateServiceWithNote();
                        }
                    }
                }
                catch
                {
                    lblNotify.Text = "Error - Try Again!";
                }
            }
        }


        //generate id 
        public static String GenerateID(String sqlQuery)
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
        protected String getMovingServiceID()
        {
            String sqlQuery = "SELECT movingServiceID FROM dbo.MOVINGSERVICE  WHERE MOVINGSERVICE.serviceID = '" + Session["serviceID"] + "'";


            //will hold the ID from query
            String movingServiceID = "";

            //connect to database
            SqlConnection sqlConnect = new SqlConnection("Server=greenvalleyauctions.cn5mwe8nhtvg.us-east-1.rds.amazonaws.com;Database=Lab4;uid=DukeDevs;password=Capstone1!;Trusted_Connection=Yes;Integrated Security=false;");

            //create sql command object and send query 
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;
            sqlConnect.Open();

            DataSet move = new DataSet();
            sqlAdapter.Fill(move);
            movingServiceID = move.Tables[0].Rows[0][0].ToString();

            int moveID = int.Parse(movingServiceID);
            string ID = moveID.ToString();

            sqlConnect.Close();
            return ID;
        }
        protected String getCustID(String FName, String LName)
        {
            string sqlQuery = "SELECT customerID FROM dbo.CUSTOMER WHERE CUSTOMER.firstName ='" + FName + "' AND CUSTOMER.lastName = '" + LName + "'";

            //connect to database
            SqlConnection sqlConnect = new SqlConnection("Server=greenvalleyauctions.cn5mwe8nhtvg.us-east-1.rds.amazonaws.com;Database=Lab4;uid=DukeDevs;password=Capstone1!;Trusted_Connection=Yes;Integrated Security=false;");

            //create sql command object and send query 
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;


            sqlConnect.Open();
            //data set to hold id  
            DataSet custDS = new DataSet();
            sqlAdapter.Fill(custDS);

            String custID = custDS.Tables[0].Rows[0][0].ToString();
            sqlConnect.Close();

            //return the ID
            return custID;
        }

        protected String getEmployeeID(String employeeName)
        {
            string sqlQuery = "SELECT employeeID FROM dbo.EMPLOYEE WHERE EMPLOYEE.firstName + ' ' + EMPLOYEE.lastName ='" + employeeName + "'";

            //connect to database
            SqlConnection sqlConnect = new SqlConnection("Server=greenvalleyauctions.cn5mwe8nhtvg.us-east-1.rds.amazonaws.com;Database=Lab4;uid=DukeDevs;password=Capstone1!;Trusted_Connection=Yes;Integrated Security=false;");

            //create sql command object and send query 
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;


            sqlConnect.Open();
            //data set to hold id  
            DataSet empDS = new DataSet();
            sqlAdapter.Fill(empDS);

            String empID = empDS.Tables[0].Rows[0][0].ToString();
            sqlConnect.Close();

            //return the ID
            return empID;
        }

        protected String getEquipmentID(String vehicle)
        {
            string sqlQuery = "SELECT equipmentID FROM dbo.EQUIPMENT WHERE EQUIPMENT.description ='" + vehicle + "'";

            //connect to database
            SqlConnection sqlConnect = new SqlConnection("Server=greenvalleyauctions.cn5mwe8nhtvg.us-east-1.rds.amazonaws.com;Database=Lab4;uid=DukeDevs;password=Capstone1!;Trusted_Connection=Yes;Integrated Security=false;");

            //create sql command object and send query 
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;


            sqlConnect.Open();
            //data set to hold id  
            DataSet equipDS = new DataSet();
            sqlAdapter.Fill(equipDS);

            String equipID = equipDS.Tables[0].Rows[0][0].ToString();
            sqlConnect.Close();

            //return the ID
            return equipID;
        }

        protected String getEmployee()
        {
            String sqlQuery = "SELECT EMPLOYEE.employeeID FROM dbo.EMPLOYEE WHERE EMPLOYEE.emailAddress = '" + Session["Username"].ToString() + "'";

            //will hold the ID from query
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

            DataSet employee = new DataSet();
            sqlAdapter.Fill(employee);
            employeeID = employee.Tables[0].Rows[0][0].ToString();

            int newIDNum = int.Parse(employeeID);
            string newID = newIDNum.ToString();

            sqlConnect.Close();
            return newID;
        }
        protected void submitNote_Click(object sender, EventArgs e)
        {
            try
            {
                String employeeID = getEmployee();
                int ID = int.Parse(employeeID);

                System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString.ToString());
                sc.Open();

                System.Data.SqlClient.SqlCommand addNote = new System.Data.SqlClient.SqlCommand();
                addNote.Connection = sc;
                // INSERT INTO Note TABLE
                addNote.CommandText = "INSERT INTO dbo.EMPLOYEENOTE (noteTitle, noteBody, employeeID, serviceID) VALUES(@noteTitle, @noteBody, @employeeID, @serviceID)";
                addNote.Parameters.Add(new SqlParameter("@noteTitle", HttpUtility.HtmlEncode(txtTitle2.Text)));
                addNote.Parameters.Add(new SqlParameter("@noteBody", HttpUtility.HtmlEncode(txtBody.Text)));
                addNote.Parameters.Add(new SqlParameter("@employeeID", ID));
                addNote.Parameters.Add(new SqlParameter("@serviceID", Session["serviceID"].ToString()));
                addNote.ExecuteNonQuery();
                sc.Close();
                lblNotify.Text = "Note successfully added to Service Details page!";
            }
            catch
            {
                lblNotify.Text = "Note was unable to be added.";
            }
        }

        protected void associateServiceWithNote()
        {
            System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString.ToString());
            sc.Open();

            System.Data.SqlClient.SqlCommand addNote = new System.Data.SqlClient.SqlCommand();
            addNote.Connection = sc;
            // INSERT INTO Note TABLE
            addNote.CommandText = "UPDATE EMPLOYEENOTE SET serviceID = @serviceID WHERE serviceID IS NULL";
            addNote.Parameters.Add(new SqlParameter("@serviceID", HttpUtility.HtmlEncode(serviceID)));

            addNote.ExecuteNonQuery();
            sc.Close();
            sc.Dispose();
        }
        protected void btnInitialContactForm_Click(object sender, EventArgs e)
        {
            Response.Redirect("ServiceOrderForm.aspx");
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
        protected void BtnCompletion_Click(object sender, EventArgs e)
        {
            Response.Redirect("MoveServiceCompletionForm.aspx");
        }
        protected void btnSubmitToDO_Click(object sender, EventArgs e)
        {
            try
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
                saveNote.Parameters.Add(new SqlParameter("@complete", HttpUtility.HtmlEncode('0')));
                saveNote.Parameters.Add(new SqlParameter("@EmployeeID", user));
                saveNote.ExecuteNonQuery();
                con2.Close();
                Response.Redirect("MoveSchedulingScreen.aspx");
            }
            catch (Exception ex)
            {
                throw ex;
            }

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

        protected void lbtnToCustomerFile_Click(object sender, EventArgs e)
        {
            Response.Redirect("MovingDetails.aspx");
        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Attributes.CssStyle.Add("display", "block");
            btnAppraisalServiceOrderForm.Visible = true;
            forms.Visible = true;
            ImageButton1.Visible = false;
        }
        protected void btnCollapse_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Attributes.CssStyle.Add("display", "none");
            btnAppraisalServiceOrderForm.Visible = false;
            forms.Visible = false;
            ImageButton1.Visible = true;
        }
        protected void CBCrew_ServerValidate(object source, ServerValidateEventArgs args)
        {
            dynamic isValid = false;

            foreach (ListItem c in chkbxCrew.Items)
            {
                if (c.Selected)
                {
                    isValid = true;
                }
            }

            args.IsValid = isValid;
        }
        protected void CBVehicle_ServerValidate(object source, ServerValidateEventArgs args)
        {
            dynamic isValid = false;

            foreach (ListItem c in chkbxCrew.Items)
            {
                if (c.Selected)
                {
                    isValid = true;
                }
            }

            args.IsValid = isValid;
        }
        protected String GetEmployeeName(string email)
        {
            String sqlQuery = "select EMPLOYEE.firstName + ' ' + EMPLOYEE.lastName from dbo.EMPLOYEE WHERE dbo.EMPLOYEE.emailAddress = '" + email + "'";

            //will hold the username from query
            String employeeName = "";

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
            employeeName = user.Tables[0].Rows[0][0].ToString();

            sqlConnect.Close();

            //int newEmpID = int.Parse(employeeID);
            //string newID = newEmpID.ToString();

            sqlConnect.Close();
            return employeeName;


        }







    }
}






