using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GreenValleyAuctionsSystem
{
    public partial class AuctionSchedulingForm : System.Web.UI.Page
    {
        protected static Boolean buttonClicked = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SetInitialRow();
            }

            //moreInvTable.Visible = false;
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
            txtComp.Text = "2021-02-02";
            txtAddress.Text = "200 South Main Street";
            txtCity.Text = "Harrisonburg";
            txtState.Text = "VA";
            txtZipCode.Text = "22801";
            txtTitle.Text = "Need to call back";
            txtNote.Text = "Customer asked for more details regarding prices.";
            txtTruck.Text = "Very Accessible";
            txtTrucks.Text = "3";
            txtSupplies.Text = "Dolly";
            txtBoxes.Text = "10";
            txtBoxType.Text = "Fragile";
            txtTime.Text = "7:00:00 AM";
            txtDate.Text = "2021-02-01";
            txtTotalCost.Text = "4300";
            txtPaymentType.Text = "Visa";

        }
        //method to clear all data from text boxes
        protected void BtnClear_Click(object sender, EventArgs e)
        {
            txtComp.Text = "";
            txtAddress.Text = "";
            txtTitle.Text = "";
            txtNote.Text = "";
            txtTruck.Text = "";
            txtTrucks.Text = "";
            txtSupplies.Text = "";
            txtBoxes.Text = "";
            txtBoxType.Text = "";
            txtTime.Text = "";
            txtTotalCost.Text = "";
            txtPaymentType.Text = "";
        }



        //method to insert all the user data into the database 
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            String serviceID = GenerateID("SELECT MAX(dbo.SERVICE.serviceID) FROM dbo.SERVICE");
            String auctionServiceID = getAuctionServiceID();
            String noteID = GenerateID("SELECT MAX(dbo.EMPLOYEENOTE.noteID) FROM dbo.EMPLOYEENOTE");
            String equipmentServiceID = GenerateID("SELECT MAX(dbo.EQUIPMENTSERVICE.equipmentServiceID) FROM dbo.EQUIPMENTSERVICE");
            DateTime timeDate = DateTime.Parse(HttpUtility.HtmlEncode(txtDate.Text + " " + txtTime.Text));
            String equipmentID = ddlVehicle.SelectedValue;
            String truckAccessibility = HttpUtility.HtmlEncode(txtTruck.Text);
            String neededSupplies = HttpUtility.HtmlEncode(txtSupplies.Text);
            int numBoxes = int.Parse(HttpUtility.HtmlEncode(txtBoxes.Text));
            String boxType = HttpUtility.HtmlEncode(txtBoxType.Text);
            int numOfTrucks = int.Parse(HttpUtility.HtmlEncode(txtTrucks.Text));

            try
            {
                System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString.ToString());
                sc.Open();

                System.Data.SqlClient.SqlCommand addServ = new System.Data.SqlClient.SqlCommand();

                System.Data.SqlClient.SqlCommand addAucServ = new System.Data.SqlClient.SqlCommand();
                addAucServ.Connection = sc;
                // INSERT MovingService RECORD
                addAucServ.CommandText = "UPDATE dbo.AUCTIONSERVICE SET pickupStreetAddress=@pickupStreetAddress, pickupCity= @pickupCity, pickupState=@pickupState, pickupZipcode=@pickupZipCode, truckAccessibility=@truckAccessibility," +
                    " neededSupplies=@neededSupplies, numBoxes=@numBoxes, boxType=@boxType, numOfTrucks= @numOfTrucks, serviceID=@serviceID, dateOfService=@dateOfService, totalCost=@totalCost, paymentType=@paymentType " +
                    " WHERE auctionServiceID = @auctionServiceID";
                ;
                addAucServ.Parameters.Add(new SqlParameter("@auctionServiceID", auctionServiceID));
                addAucServ.Parameters.Add(new SqlParameter("@pickupStreetAddress", HttpUtility.HtmlEncode(txtAddress.Text)));
                addAucServ.Parameters.Add(new SqlParameter("@pickupCity", HttpUtility.HtmlEncode(txtCity.Text)));
                addAucServ.Parameters.Add(new SqlParameter("@pickupState", HttpUtility.HtmlEncode(txtState.Text)));
                addAucServ.Parameters.Add(new SqlParameter("@pickupZipCode", HttpUtility.HtmlEncode(txtZipCode.Text)));
                addAucServ.Parameters.Add(new SqlParameter("@truckAccessibility", truckAccessibility));
                addAucServ.Parameters.Add(new SqlParameter("@neededSupplies", neededSupplies));
                addAucServ.Parameters.Add(new SqlParameter("@numBoxes", numBoxes));
                addAucServ.Parameters.Add(new SqlParameter("@boxType", boxType));
                addAucServ.Parameters.Add(new SqlParameter("@numOfTrucks", numOfTrucks));
                addAucServ.Parameters.Add(new SqlParameter("@serviceID", Session["serviceID"].ToString()));
                addAucServ.Parameters.Add(new SqlParameter("@dateOfService", timeDate));
                addAucServ.Parameters.Add(new SqlParameter("@totalCost", HttpUtility.HtmlEncode(txtTotalCost.Text)));
                addAucServ.Parameters.Add(new SqlParameter("@paymentType", HttpUtility.HtmlEncode(txtPaymentType.Text)));
                addAucServ.ExecuteNonQuery();

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

                System.Data.SqlClient.SqlCommand addEqipServ = new System.Data.SqlClient.SqlCommand();
                addEqipServ.Connection = sc;
                // INSERT Service RECORD
                addEqipServ.CommandText = "SET IDENTITY_INSERT dbo.EQUIPMENTSERVICE ON;" +
                    " INSERT INTO dbo.EQUIPMENTSERVICE (equipmentServiceID, serviceID, equipmentID) VALUES(@equipmentServiceID, @serviceID, @equipmentID)" +
                    " SET IDENTITY_INSERT dbo.EQUIPMENTSERVICE OFF;";
                addEqipServ.Parameters.Add(new SqlParameter("@equipmentServiceID", equipmentServiceID));
                addEqipServ.Parameters.Add(new SqlParameter("@serviceID", Session["serviceID"].ToString()));
                addEqipServ.Parameters.Add(new SqlParameter("@equipmentID", equipmentID));
                addEqipServ.ExecuteNonQuery();

                lblNotify.Text = "Auction Service Ticket has been added!";
                BtnCompletion.Visible = true;
            }

            catch
            {
                lblNotify.Text = "Error - Please try again.";
            }

        }
        //generate id 
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

        protected String getAuctionServiceID()
        {
            String sqlQuery = "SELECT auctionServiceID FROM dbo.AUCTIONSERVICE  WHERE AUCTIONSERVICE.serviceID = '" + Session["serviceID"] + "'";


            //will hold the ID from query
            String auctionServiceID = "";

            //connect to database
            SqlConnection sqlConnect = new SqlConnection("Server=greenvalleyauctions.cn5mwe8nhtvg.us-east-1.rds.amazonaws.com;Database=Lab4;uid=DukeDevs;password=Capstone1!;Trusted_Connection=Yes;Integrated Security=false;");

            //create sql command object and send query 
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;
            sqlConnect.Open();

            DataSet auction = new DataSet();
            sqlAdapter.Fill(auction);
            auctionServiceID = auction.Tables[0].Rows[0][0].ToString();

            int aucID = int.Parse(auctionServiceID);
            string ID = aucID.ToString();

            sqlConnect.Close();
            return ID;
        }
        //protected void btnInitialContactForm_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("NewCustomer.aspx");
        //}

        //protected void btnAuctionServiceOrder_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("AuctionSchedulingForm.aspx");
        //}

        //protected void btnAuctionAssessmentForm_Click(object sender, EventArgs e)
        //{
        //    //Change this when form is created
        //    Response.Redirect("EmployeeDashboard.aspx");
        //}

        //protected void btnAppraisalServiceOrderForm_Click(object sender, EventArgs e)
        //{
        //    //change this when form is created
        //    Response.Redirect("Appraisal.aspx");
        //}

        //protected void btnMoveAssessmentForm_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("MoveForm.aspx");
        //}

        //protected void btnMoveServiceOrder_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("MoveSchedulingScreen.aspx");
        //}

        protected void BtnCompletion_Click(object sender, EventArgs e)
        {
            Response.Redirect("ServiceCompletionForm.aspx");
        }
        private void SetInitialRow()
        {

            DataTable dt = new DataTable();
            DataRow dr = null;

            dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));
            dt.Columns.Add(new DataColumn("Description", typeof(string)));
            dt.Columns.Add(new DataColumn("Cost", typeof(string)));
            dr = dt.NewRow();
            dr["RowNumber"] = 1;
            dr["Description"] = string.Empty;
            dr["Cost"] = string.Empty;
            dt.Rows.Add(dr);


            //Store the DataTable in ViewState for future reference   
            ViewState["CurrentTable"] = dt;

            //Bind the Gridview   
            grdvwInventory.DataSource = dt;
            grdvwInventory.DataBind();
        }

        private void AddNewRowToGrid()
        {

            if (ViewState["CurrentTable"] != null)
            {

                DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];
                DataRow drCurrentRow = null;

                if (dtCurrentTable.Rows.Count > 0)
                {
                    drCurrentRow = dtCurrentTable.NewRow();
                    drCurrentRow["RowNumber"] = dtCurrentTable.Rows.Count + 1;

                    //add new row to DataTable   
                    dtCurrentTable.Rows.Add(drCurrentRow);
                    //Store the current data to ViewState for future reference   

                    ViewState["CurrentTable"] = dtCurrentTable;


                    for (int i = 0; i < dtCurrentTable.Rows.Count - 1; i++)
                    {

                        //extract the TextBox values   

                        TextBox txtbx1 = (TextBox)grdvwInventory.Rows[i].Cells[2].FindControl("txtInvDesc");
                        TextBox txtbx2 = (TextBox)grdvwInventory.Rows[i].Cells[3].FindControl("txtCost");

                        dtCurrentTable.Rows[i]["Description"] = txtbx1.Text;
                        dtCurrentTable.Rows[i]["Cost"] = txtbx2.Text;

                    }

                    //Rebind the Grid with the current data to reflect changes   
                    grdvwInventory.DataSource = dtCurrentTable;
                    grdvwInventory.DataBind();
                }
            }
            else
            {
                Response.Write("ViewState is null");

            }
            //Set Previous Data on Postbacks   
            SetPreviousData();
        }

        private void SetPreviousData()
        {

            int rowIndex = 0;
            if (ViewState["CurrentTable"] != null)
            {

                DataTable dt = (DataTable)ViewState["CurrentTable"];
                if (dt.Rows.Count > 0)
                {

                    for (int i = 0; i < dt.Rows.Count; i++)
                    {

                        TextBox txtbx1 = (TextBox)grdvwInventory.Rows[i].Cells[2].FindControl("txtInvDesc");
                        TextBox txtbx2 = (TextBox)grdvwInventory.Rows[i].Cells[3].FindControl("txtCost");


                        if (i < dt.Rows.Count - 1)
                        {

                            //Assign the value from DataTable to the TextBox   
                            txtbx1.Text = dt.Rows[i]["Description"].ToString();
                            txtbx2.Text = dt.Rows[i]["Cost"].ToString();

                        }

                        rowIndex++;
                    }
                }
            }
        }
        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            AddNewRowToGrid();
        }

        protected void grdvwRooms_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataTable dt = (DataTable)ViewState["CurrentTable"];
                LinkButton lb = (LinkButton)e.Row.FindControl("btnRemove");
                if (lb != null)
                {
                    if (dt.Rows.Count > 1)
                    {
                        if (e.Row.RowIndex == dt.Rows.Count - 1)
                        {
                            lb.Visible = false;
                        }
                    }
                    else
                    {
                        lb.Visible = false;
                    }
                }
            }
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            LinkButton lb = (LinkButton)sender;
            GridViewRow gvRow = (GridViewRow)lb.NamingContainer;
            int rowID = gvRow.RowIndex;
            if (ViewState["CurrentTable"] != null)
            {

                DataTable dt = (DataTable)ViewState["CurrentTable"];
                if (dt.Rows.Count > 1)
                {
                    if (gvRow.RowIndex < dt.Rows.Count - 1)
                    {
                        //Remove the Selected Row data and reset row number  
                        dt.Rows.Remove(dt.Rows[rowID]);
                        ResetRowID(dt);
                    }
                }

                //Store the current data in ViewState for future reference  
                ViewState["CurrentTable"] = dt;

                //Re bind the GridView for the updated data  
                grdvwInventory.DataSource = dt;
                grdvwInventory.DataBind();
            }

            //Set Previous Data on Postbacks  
            SetPreviousData();
        }

        private void ResetRowID(DataTable dt)
        {
            int rowNumber = 1;
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    row[0] = rowNumber;
                    rowNumber++;
                }
            }
        }

        protected void btnSaveInv_Click(object sender, EventArgs e)
        {
            //loops through each row in the gridview and inserts the room 
            foreach (GridViewRow row in grdvwInventory.Rows)
            {
                //holds the values  
                TextBox txtDesc = (TextBox)row.FindControl("txtInvDesc");
                TextBox txtCost = (TextBox)row.FindControl("txtCost");

                //get furniture serviceID
                System.Data.SqlClient.SqlConnection sc2 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString.ToString());
                sc2.Open();

                System.Data.SqlClient.SqlCommand addInv = new System.Data.SqlClient.SqlCommand();
                addInv.Connection = sc2;

                String inventoryID = GenerateID("SELECT MAX(dbo.INVENTORY.inventoryID) FROM dbo.INVENTORY");
                addInv.CommandText = "SET IDENTITY_INSERT dbo.INVENTORY ON;" +
                    " INSERT INTO dbo.INVENTORY (inventoryID, inventoryDescription, inventoryCost, serviceID) VALUES(@inventoryID, @inventoryDescription, @inventoryCost, @serviceID)" +
                    " SET IDENTITY_INSERT dbo.INVENTORY OFF;";
                addInv.Parameters.Add(new SqlParameter("@inventoryID", inventoryID));
                addInv.Parameters.Add(new SqlParameter("@inventoryDescription", HttpUtility.HtmlEncode(txtDesc.Text)));
                addInv.Parameters.Add(new SqlParameter("@inventoryCost", HttpUtility.HtmlEncode(txtCost.Text)));
                addInv.Parameters.Add(new SqlParameter("@serviceID", Session["serviceID"].ToString()));
                addInv.ExecuteNonQuery();

                lblAdded.Text = "Inventory has been added to service!";
                lblAdded.ForeColor = Color.Green;
            }

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
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
            Response.Redirect("AuctionSchedulingForm.aspx");

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
        protected void btnInitialContactForm_Click(object sender, EventArgs e)
        {
            Response.Redirect("ServiceOrderForm.aspx");
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

        protected void lbtnToCustomerFile_Click(object sender, EventArgs e)
        {
            Response.Redirect("AuctionDetails.aspx");
        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Attributes.CssStyle.Add("display", "block");
            Button2.Visible = true;
            Button3.Visible = true;
            Button4.Visible = true;
            forms.Visible = true;
            ImageButton1.Visible = false;
        }
        protected void btnCollapse_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Attributes.CssStyle.Add("display", "none");
            Button2.Visible = false;
            Button3.Visible = false;
            Button4.Visible = false;
            forms.Visible = false;
            ImageButton1.Visible = true;
        }



    }
}





