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
using System.Collections.Specialized;
using System.Text;
using System.IO;

namespace GreenValleyAuctionsSystem
{
    public partial class MoveForm : System.Web.UI.Page
    {
        //private int numOfRows = 1; //current num of rows for Rooms table (set to 1 so it shows up on initial load

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["customerID"] == null)
            {
                Response.Redirect("EmployeeDashboard.aspx");
            }
            else
            {
                if (!Page.IsPostBack)
                {
                    SetInitialRow();
                }

                foreach (GridViewRow row in grdvwRooms.Rows)
                {
                    try
                    {
                        DropDownList ddlRoomType = (DropDownList)row.FindControl("ddlRoomType");
                        DropDownList ddlFurniture = (DropDownList)row.FindControl("ddlFurniture");
                        TextBox txtbxQuantity = (TextBox)row.FindControl("txtbxQuantity");
                        Label lblCU = (Label)row.FindControl("lblCU");
                        Label lblTOTCU = (Label)row.FindControl("lblTOTCU");
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }
                }

            }
        }

        protected void btnPopulate_Click(object sender, EventArgs e)
        {
            //preassessment
            txtOriginAddress.Text = "510 East Market Street";
            txtOriginCity.Text = "Harrisonburg";
            txtOriginState.Text = "VA";
            txtOriginZipCode.Text = "22801";
            txtDestinationAddress.Text = "829 Duke Dog Avenue";
            txtDestinationCity.Text = "Harrisonburg";
            txtDestinationState.Text = "VA";
            txtDestinationZipCode.Text = "22801";
            txtMoveDate.Text = "2021-02-01";
            txtMoveTime.Text = "07:30:00";
            rblMLSListing.Items.FindByValue("No").Selected = true;
            chkbxPacking.Checked = true;
            txtbxAddOnDesc.Text = "There may be some items of value, call later to schedule look-at";

        }

        protected void btnClearPre_Click(object sender, EventArgs e)
        {
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
            rblMLSListing.Items.FindByValue("No").Selected = false;
            chkbxPacking.Checked = false;
            txtbxAddOnDesc.Text = "";
            ddlTypeOfHome.SelectedItem.Text = "";
        }

        protected void btnPopulate2_Click(object sender, EventArgs e)
        {
            //assessment
            ddlTypeOfHome.SelectedValue = "House";
            txtbxNumOfFloors.Text = "3";
            txtbxDistance.Text = "50 feet";
            txtbxDriveway.Text = "Pretty clear";
            txtbxLoadingConditions.Text = "Narrow gate and steep driveway";
            txtbxOutdoor.Text = "Separate Garage";
            cblEquipment.Items.FindByValue("Appliance Cart").Selected = true;
            cblEquipment.Items.FindByValue("Extra Blankets").Selected = true;
        }

        protected void chkbxSame_CheckedChanged(object sender, EventArgs e)
        {
            if (chkbxSame.Checked)
            {
                //populate text boxes based off of info from details view
                txtOriginAddress.Text = dvCustomerInfo.Rows[7].Cells[1].Text;
                txtOriginCity.Text = dvCustomerInfo.Rows[8].Cells[1].Text;
                txtOriginState.Text = dvCustomerInfo.Rows[9].Cells[1].Text;
                txtOriginZipCode.Text = dvCustomerInfo.Rows[10].Cells[1].Text;
            }
        }

        protected void btnSavePreAssessment_Click(object sender, EventArgs e)
        {
            string datePart = txtMoveDate.Text.ToString().Trim();
            string timePart = txtMoveTime.Text.ToString().Trim();
            string timeAndDate = string.Format("{0} {1}", datePart, timePart);
            DateTime timeDate = DateTime.Parse(timeAndDate);
            System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString.ToString());

            try
            {
                sc.Open();
                //Update record in MOVINGSERVICE
                System.Data.SqlClient.SqlCommand updateMovingService1 = new System.Data.SqlClient.SqlCommand();
                updateMovingService1.Connection = sc;
                updateMovingService1.CommandText = "UPDATE MOVINGSERVICE SET originStreetAddress = @originStreetAddress, originCity = @originCity, " +
                    "originState = @originState, originZipCode = @originZipCode, destinationStreetAddress = @destinationStreetAddress, destinationCity = @destinationCity, " +
                    "destinationState = @destinationState, destinationZipCode = @destinationZipCode, dateOfService = @dateOfService WHERE movingServiceID = @movingServiceID;";
                updateMovingService1.Parameters.Add(new SqlParameter("@originStreetAddress", HttpUtility.HtmlEncode(txtOriginAddress.Text)));
                updateMovingService1.Parameters.Add(new SqlParameter("@originCity", HttpUtility.HtmlEncode(txtOriginCity.Text)));
                updateMovingService1.Parameters.Add(new SqlParameter("@originState", HttpUtility.HtmlEncode(txtOriginState.Text)));
                updateMovingService1.Parameters.Add(new SqlParameter("@originZipCode", HttpUtility.HtmlEncode(txtOriginZipCode.Text)));
                updateMovingService1.Parameters.Add(new SqlParameter("@destinationStreetAddress", HttpUtility.HtmlEncode(txtDestinationAddress.Text)));
                updateMovingService1.Parameters.Add(new SqlParameter("@destinationCity", HttpUtility.HtmlEncode(txtDestinationCity.Text)));
                updateMovingService1.Parameters.Add(new SqlParameter("@destinationState", HttpUtility.HtmlEncode(txtDestinationState.Text)));
                updateMovingService1.Parameters.Add(new SqlParameter("@destinationZipCode", HttpUtility.HtmlEncode(txtDestinationZipCode.Text)));
                updateMovingService1.Parameters.Add(new SqlParameter("@dateOfService", HttpUtility.HtmlEncode(timeDate)));
                updateMovingService1.Parameters.Add(new SqlParameter("@movingServiceID", getMovingServiceID(Session["serviceID"].ToString())));
                updateMovingService1.ExecuteNonQuery();

                lblPreNotify.Text = "Moving Service successfully updated!";
                lblPreNotify.CssClass = "alert alert-success arrow-left quick";

            }
            catch (Exception ex)
            {
                lblPreNotify.Text = "Error - Please try again.";
                lblPreNotify.CssClass = "alert alert-danger arrow-left quick";
                throw ex;
            }
            finally
            {
                sc.Close();
                sc.Dispose();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            System.Data.SqlClient.SqlConnection sc2 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString.ToString());
            try
            {
                sc2.Open();
                //Update record in MOVINGSERVICE
                System.Data.SqlClient.SqlCommand updateMovingService2 = new System.Data.SqlClient.SqlCommand();
                updateMovingService2.Connection = sc2;
                updateMovingService2.CommandText = "UPDATE MOVINGSERVICE SET numOfFloors = @numOfFloors, distanceFromTruck = @distanceFromTruck, " +
                    "drivewayAccessibility = @drivewayAccessibility, loadingConditions = @loadingConditions, outdoorSpaces = @outdoorSpaces WHERE movingServiceID = @movingServiceID;";
                updateMovingService2.Parameters.Add(new SqlParameter("@numOfFloors", HttpUtility.HtmlEncode(txtbxNumOfFloors.Text)));
                updateMovingService2.Parameters.Add(new SqlParameter("@distanceFromTruck", HttpUtility.HtmlEncode(txtbxDistance.Text)));
                updateMovingService2.Parameters.Add(new SqlParameter("@drivewayAccessibility", HttpUtility.HtmlEncode(txtbxDriveway.Text)));
                updateMovingService2.Parameters.Add(new SqlParameter("@loadingConditions", HttpUtility.HtmlEncode(txtbxLoadingConditions.Text)));
                updateMovingService2.Parameters.Add(new SqlParameter("@outdoorSpaces", HttpUtility.HtmlEncode(txtbxOutdoor.Text)));
                updateMovingService2.Parameters.Add(new SqlParameter("@movingServiceID", getMovingServiceID(Session["serviceID"].ToString())));
                updateMovingService2.ExecuteNonQuery();

                foreach (ListItem listItem in cblEquipment.Items)
                {
                    if (listItem.Selected == true)
                    {
                        String description = cblEquipment.SelectedItem.Text;
                        //INSERT into SPECIALSERVICE
                        System.Data.SqlClient.SqlCommand addSpecialService = new System.Data.SqlClient.SqlCommand();
                        addSpecialService.Connection = sc2;

                        addSpecialService.CommandText = "INSERT INTO SPECIALSERVICE(specialEquipmentID, serviceID) VALUES (@specialEquipmentID, @serviceID)";
                        addSpecialService.Parameters.Add(new SqlParameter("@specialEquipmentID", getSpecialEquipment(description)));
                        addSpecialService.Parameters.Add(new SqlParameter("@serviceID", Session["serviceID"]));
                        addSpecialService.ExecuteNonQuery();
                    }
                }
                lblNotify.Text = "Service successfully updated!";
                lblNotify.CssClass = "alert alert-success arrow-left quick";
            }
            catch (Exception ex)
            {
                lblNotify.Text = "Error - Please try again.";
                lblNotify.CssClass = "alert alert-danger arrow-left quick";
                throw ex;
            }
            finally
            {
                sc2.Close();
                sc2.Dispose();
            }
        }

        protected int getEquipmentID(String vehicle)
        {
            String sqlQuery = "SELECT EQUIPMENT.equipmentID FROM EQUIPMENT WHERE EQUIPMENT.description='" + @vehicle + "';";
            //connect to database
            System.Data.SqlClient.SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString.ToString());

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
            String equipmentIDString = maxDS.Tables[0].Rows[0][0].ToString();
            int equipmentID = int.Parse(equipmentIDString);
            return equipmentID;
        }

        protected int getMovingServiceID(String serviceID)
        {
            String sqlQuery = "SELECT MOVINGSERVICE.movingServiceID FROM MOVINGSERVICE WHERE MOVINGSERVICE.serviceID = '" + @serviceID + "'";

            //connect to database
            System.Data.SqlClient.SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString.ToString());

            //create sql command object and send query 
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;
            sqlConnect.Open();

            DataSet service = new DataSet();
            sqlAdapter.Fill(service);
            String movingServiceIDstr = service.Tables[0].Rows[0][0].ToString();

            int movingServiceID = int.Parse(movingServiceIDstr);

            sqlConnect.Close();
            return movingServiceID;
        }

        private void SetInitialRow()
        {
            DataTable dt = new DataTable();
            DataRow dr = null;

            dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));
            dt.Columns.Add(new DataColumn("Type", typeof(string)));
            dt.Columns.Add(new DataColumn("Furniture", typeof(string)));
            dt.Columns.Add(new DataColumn("Quantity", typeof(string)));
            dt.Columns.Add(new DataColumn("CU", typeof(string)));
            dt.Columns.Add(new DataColumn("TOTCU", typeof(string)));

            dr = dt.NewRow();
            dr["RowNumber"] = 1;
            dr["Type"] = string.Empty;
            dr["Furniture"] = string.Empty;
            dr["Quantity"] = string.Empty;
            dr["CU"] = "Test";
            dr["TOTCU"] = string.Empty;
            dt.Rows.Add(dr);


            //Store the DataTable in ViewState for future reference   
            ViewState["CurrentTable"] = dt;

            //Bind the Gridview   
            grdvwRooms.DataSource = dt;
            grdvwRooms.DataBind();
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

                        DropDownList ddl1 = (DropDownList)grdvwRooms.Rows[i].Cells[2].FindControl("ddlRoomType");
                        DropDownList ddl2 = (DropDownList)grdvwRooms.Rows[i].Cells[3].FindControl("ddlFurniture");
                        TextBox txtbx1 = (TextBox)grdvwRooms.Rows[i].Cells[4].FindControl("txtbxQuantity");
                        Label lbl1 = (Label)grdvwRooms.Rows[i].Cells[5].FindControl("lblCU");
                        Label lbl2 = (Label)grdvwRooms.Rows[i].Cells[6].FindControl("lblTOTCU");

                        dtCurrentTable.Rows[i]["Type"] = ddl1.Text;
                        dtCurrentTable.Rows[i]["Furniture"] = ddl2.Text;
                        dtCurrentTable.Rows[i]["Quantity"] = txtbx1.Text;
                        dtCurrentTable.Rows[i]["CU"] = lbl1.Text;
                        dtCurrentTable.Rows[i]["TOTCU"] = lbl2.Text;

                    }

                    //Rebind the Grid with the current data to reflect changes   
                    grdvwRooms.DataSource = dtCurrentTable;
                    grdvwRooms.DataBind();
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

                        DropDownList ddl1 = (DropDownList)grdvwRooms.Rows[i].Cells[2].FindControl("ddlRoomType");
                        DropDownList ddl2 = (DropDownList)grdvwRooms.Rows[i].Cells[3].FindControl("ddlFurniture");
                        TextBox txtbx1 = (TextBox)grdvwRooms.Rows[i].Cells[4].FindControl("txtbxQuantity");
                        Label lbl1 = (Label)grdvwRooms.Rows[i].Cells[5].FindControl("lblCU");
                        Label lbl2 = (Label)grdvwRooms.Rows[i].Cells[6].FindControl("lblTOTCU");


                        if (i < dt.Rows.Count - 1)
                        {

                            //Assign the value from DataTable to the TextBox   
                            ddl1.Text = dt.Rows[i]["Type"].ToString();
                            ddl2.Text = dt.Rows[i]["Furniture"].ToString();
                            txtbx1.Text = dt.Rows[i]["Quantity"].ToString();
                            lbl1.Text = dt.Rows[i]["CU"].ToString();
                            lbl2.Text = dt.Rows[i]["TOTCU"].ToString();

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
                grdvwRooms.DataSource = dt;
                grdvwRooms.DataBind();
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

        protected void BtnSave_Click(object sender, EventArgs e)
        {

        }

        protected String getEmployee()
        {
            String sqlQuery = "SELECT EMPLOYEE.employeeID FROM dbo.EMPLOYEE WHERE EMPLOYEE.emailAddress = '" + Session["Username"].ToString() + "'";

            //will hold the ID from query
            String employeeID = "";

            //connect to database
            System.Data.SqlClient.SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString.ToString());

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
                lblNotify.CssClass = "alert alert-success arrow-left quick";
            }
            catch
            {
                lblNotify.Text = "Note was unable to be added.";
                lblNotify.CssClass = "alert alert-danger arrow-left quick";
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
            addNote.Parameters.Add(new SqlParameter("@serviceID", Session["serviceID"].ToString()));

            addNote.ExecuteNonQuery();
            sc.Close();
            sc.Dispose();
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


        //protected void btnCalculate_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        int finalTotal = 0;
        //        //loops through each row in the gridview 
        //        foreach (GridViewRow row in grdvwRooms.Rows)
        //        {
        //            //holds the values
        //            //DropDownList ddlRoomType = (DropDownList)row.FindControl("ddlRoomType");
        //            DropDownList ddlFurniture = (DropDownList)row.FindControl("ddlFurniture");
        //            TextBox txtbxQuantity = (TextBox)row.FindControl("txtbxQuantity");
        //            Label lblCU = (Label)row.FindControl("lblCU");
        //            Label lblTOTCU = (Label)row.FindControl("lblTOTCU");
        //            lblCU.Text = (getCU(ddlFurniture.Text)).ToString();

        //            //convert to variables for calculations
        //            //String type = ddlRoomType.Text;
        //            //String furniture = ddlFurniture.Text;
        //            int quantity = 0;
        //            try
        //            {
        //                quantity = int.Parse(txtbxQuantity.Text);
        //            }
        //            catch
        //            {
        //                lblMessage.Text = "Error - Please enter quantity";
        //                lblMessage.CssClass = "alert alert-danger arrow-left quick";
        //            }

        //            int CU = int.Parse(lblCU.Text);
        //            int totalCU = quantity * CU;
        //            lblTOTCU.Text = totalCU.ToString();
        //            finalTotal += totalCU;
        //        }

        //        lblFinalTotal.Text = finalTotal.ToString();
        //        tblTotals.Visible = true;
        //    }
        //    catch
        //    {
        //        lblNotify.Text = "Error calculating furniture.";
        //        lblNotify.CssClass = "alert alert-danger arrow-left quick";
        //    }


        //}

        protected void btnSaveFurniture_Click(object sender, EventArgs e)
        {
            try
            {
                //loops through each row in the gridview and inserts the room 
                foreach (GridViewRow row in grdvwRooms.Rows)
                {
                    DropDownList ddlRoomType = (DropDownList)row.FindControl("ddlRoomType");
                    String roomType = ddlRoomType.Text;

                    DropDownList ddlFurniture = (DropDownList)row.FindControl("ddlFurniture");
                    String name = ddlFurniture.Text;

                    TextBox txtbxQuantity = (TextBox)row.FindControl("txtbxQuantity");
                    String quantitytxt = txtbxQuantity.Text;

                    String sqlQueryTotal = "SELECT MOVINGSERVICE.totalCU FROM dbo.MOVINGSERVICE WHERE MOVINGSERVICE.movingServiceID  = '" + Session["movingserviceID"] + "'";

                    DataTable totalDS = sqlConnection(sqlQueryTotal);
                    String CU = totalDS.Rows[0][0].ToString();
                    int currentCU = int.Parse(CU);

                    String sqlQueryCubic = "SELECT FURNITURE.cubicUnit FROM dbo.FURNITURE WHERE FURNITURE.name = '" + name + "'";
                    DataTable cubicDS = sqlConnection(sqlQueryCubic);
                    String cubicUnit = cubicDS.Rows[0][0].ToString();
                    int cube = int.Parse(cubicUnit);

                    int quantity = int.Parse(quantitytxt);

                    int newCubicUnits = currentCU + (quantity * cube);

                    lblNotify.Text = Session["serviceID"] + " + " + Session["movingserviceID"] + " + " + roomType + " + " + getFurniture(name) + name + " + " +
                    quantitytxt + " + " + CU + " + " + currentCU + " + " + cubicUnit + " + " + newCubicUnits;

                    System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString.ToString());
                    sc.Open();

                    System.Data.SqlClient.SqlCommand addItem = new System.Data.SqlClient.SqlCommand();
                    addItem.Connection = sc;
                    // INSERT INTO Note TABLE
                    addItem.CommandText = "INSERT INTO dbo.FURNITURESERVICE (quantity, serviceID, furnitureID, roomID) VALUES (@quantity, @serviceID, @furnitureID, @roomID)";
                    addItem.Parameters.Add(new SqlParameter("@quantity", HttpUtility.HtmlEncode(quantity)));
                    addItem.Parameters.Add(new SqlParameter("@serviceID", HttpUtility.HtmlEncode(Session["serviceID"])));
                    addItem.Parameters.Add(new SqlParameter("@furnitureID", getFurniture(name)));
                    addItem.Parameters.Add(new SqlParameter("@roomID", getRoom(roomType)));
                    addItem.ExecuteNonQuery();


                    System.Data.SqlClient.SqlCommand addCubicUnits = new System.Data.SqlClient.SqlCommand();
                    addCubicUnits.Connection = sc;
                    addCubicUnits.CommandText = "UPDATE dbo.MOVINGSERVICE SET totalCU = @totalCU FROM dbo.SERVICE, dbo.MOVINGSERVICE WHERE MOVINGSERVICE.serviceID = SERVICE.serviceID AND SERVICE.serviceID ='" + Session["serviceID"] + "'";
                    addCubicUnits.Parameters.Add(new SqlParameter("totalCU", HttpUtility.HtmlEncode(newCubicUnits)));
                    addCubicUnits.ExecuteNonQuery();

                    lblNotify.Text = "Furniture has been added to service!";
                    lblNotify.CssClass = "alert alert-success arrow-left quick";
                }

            }
            catch
            {
                lblNotify.Text = "Error saving furniture";
                lblNotify.CssClass = "alert alert-danger arrow-left quick";
            }
            try
            {
                int finalTotal = 0;
                //loops through each row in the gridview 
                foreach (GridViewRow row in grdvwRooms.Rows)
                {
                    //holds the values
                    //DropDownList ddlRoomType = (DropDownList)row.FindControl("ddlRoomType");
                    DropDownList ddlFurniture = (DropDownList)row.FindControl("ddlFurniture");
                    TextBox txtbxQuantity = (TextBox)row.FindControl("txtbxQuantity");
                    Label lblCU = (Label)row.FindControl("lblCU");
                    Label lblTOTCU = (Label)row.FindControl("lblTOTCU");
                    lblCU.Text = (getCU(ddlFurniture.Text)).ToString();

                    //convert to variables for calculations
                    //String type = ddlRoomType.Text;
                    //String furniture = ddlFurniture.Text;
                    int quantity = 0;
                    try
                    {
                        quantity = int.Parse(txtbxQuantity.Text);
                    }
                    catch
                    {
                        lblMessage.Text = "Error - Please enter quantity";
                        lblMessage.CssClass = "alert alert-danger arrow-left quick";
                    }

                    int CU = int.Parse(lblCU.Text);
                    int totalCU = quantity * CU;
                    lblTOTCU.Text = totalCU.ToString();
                    finalTotal += totalCU;
                }

                lblFinalTotal.Text = finalTotal.ToString();
                tblTotals.Visible = true;
            }
            catch
            {
                lblNotify.Text = "Error calculating furniture.";
                lblNotify.CssClass = "alert alert-danger arrow-left quick";
            }


        }

        protected DataTable sqlConnection(String sqlQuery)
        {

            //creates connection object with the database 
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString.ToString());

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

        protected int getFurniture(string name)
        {
            String sqlQuery = "SELECT FURNITURE.furnitureID FROM FURNITURE WHERE FURNITURE.name = '" + @name + "'";

            //connect to database
            System.Data.SqlClient.SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString.ToString());

            //create sql command object and send query 
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;
            sqlConnect.Open();

            DataSet furniture = new DataSet();
            sqlAdapter.Fill(furniture);
            String furnitureIDstr = furniture.Tables[0].Rows[0][0].ToString();

            int furnitureID = int.Parse(furnitureIDstr);

            sqlConnect.Close();
            return furnitureID;
        }

        protected int getSpecialEquipment(string description)
        {
            String sqlQuery = "SELECT SPECIALEQUIPMENT.specialEquipmentID FROM SPECIALEQUIPMENT WHERE SPECIALEQUIPMENT.description = '" + @description + "'";

            //connect to database
            System.Data.SqlClient.SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString.ToString());

            //create sql command object and send query 
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;
            sqlConnect.Open();

            DataSet specialEquipment = new DataSet();
            sqlAdapter.Fill(specialEquipment);
            String specialEquipmentIDstr = specialEquipment.Tables[0].Rows[0][0].ToString();

            int specialEquipmentID = int.Parse(specialEquipmentIDstr);

            sqlConnect.Close();
            return specialEquipmentID;
        }

        protected int getCU(string name)
        {
            String sqlQuery = "SELECT FURNITURE.cubicUnit FROM FURNITURE WHERE FURNITURE.name = '" + @name + "'";

            //connect to database
            System.Data.SqlClient.SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString.ToString());

            //create sql command object and send query 
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;
            sqlConnect.Open();

            DataSet dsCU = new DataSet();
            sqlAdapter.Fill(dsCU);
            String cuStr = dsCU.Tables[0].Rows[0][0].ToString();

            int CU = int.Parse(cuStr);

            sqlConnect.Close();
            return CU;
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
                Response.Redirect("MoveForm.aspx");
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

        protected int getRoom(string roomType)
        {
            String sqlQuery = "SELECT ROOMS.roomID FROM ROOMS WHERE ROOMS.roomType = '" + @roomType + "'";

            //connect to database
            System.Data.SqlClient.SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString.ToString());

            //create sql command object and send query 
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;
            sqlConnect.Open();

            DataSet room = new DataSet();
            sqlAdapter.Fill(room);
            String roomIDstr = room.Tables[0].Rows[0][0].ToString();

            int roomID = int.Parse(roomIDstr);

            sqlConnect.Close();
            return roomID;
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

    }
}



