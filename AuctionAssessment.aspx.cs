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

namespace GreenValleyAuctionsSystems
{
    public partial class AuctionAssessment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["customerID"] == null)
            {
                Response.Redirect("EmployeeDashboard.aspx");
            }
            if (ddlHomeType.SelectedValue == "Place of Business")
            {
                lblLoadingDoor.Visible = true;
                txtLoadingDoor.Visible = true;
                lblSteps.Visible = true;
                txtSteps.Visible = true;
                RVDoor.Visible = true;
                RVSteps.Visible = true;

                lblClimateControlled.Visible = false;
                txtClimateControlled.Visible = false;
                lblOutdoor.Visible = false;
                txtOutdoor.Visible = false;
                lblFloor.Visible = false;
                txtFloor.Visible = false;
                lblElevator.Visible = false;
                txtElevator.Visible = false;
                lblDistance.Visible = false;
                txtDistance.Visible = false;
            }
            if (ddlHomeType.SelectedValue == "Storage Unit")
            {
                lblClimateControlled.Visible = true;
                txtClimateControlled.Visible = true;
                lblOutdoor.Visible = true;
                txtOutdoor.Visible = true;
                RVClimate.Visible = true;
                RVStorage.Visible = true;

                lblFloor.Visible = false;
                txtFloor.Visible = false;
                lblElevator.Visible = false;
                txtElevator.Visible = false;
                lblDistance.Visible = false;
                txtDistance.Visible = false;
                lblLoadingDoor.Visible = false;
                txtLoadingDoor.Visible = false;
                lblSteps.Visible = false;
                txtSteps.Visible = false;
            }
            if (ddlHomeType.SelectedValue == "Apartment")
            {
                lblFloor.Visible = true;
                txtFloor.Visible = true;
                lblElevator.Visible = true;
                txtElevator.Visible = true;
                lblDistance.Visible = true;
                txtDistance.Visible = true;
                RVFloor.Visible = true;
                RVElevator.Visible = true;
                RVElevatorDist.Visible = true;

                lblClimateControlled.Visible = false;
                txtClimateControlled.Visible = false;
                lblOutdoor.Visible = false;
                txtOutdoor.Visible = false;
                lblLoadingDoor.Visible = false;
                txtLoadingDoor.Visible = false;
                lblSteps.Visible = false;
                txtSteps.Visible = false;
            }
            if (ddlHomeType.SelectedValue == "House")
            {

                lblFloor.Visible = false;
                txtFloor.Visible = false;
                lblElevator.Visible = false;
                txtElevator.Visible = false;
                lblDistance.Visible = false;
                txtDistance.Visible = false;
                lblClimateControlled.Visible = false;
                txtClimateControlled.Visible = false;
                lblOutdoor.Visible = false;
                txtOutdoor.Visible = false;
                lblLoadingDoor.Visible = false;
                txtLoadingDoor.Visible = false;
                lblSteps.Visible = false;
                txtSteps.Visible = false;
            }
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {

            String typeOfHome = ddlHomeType.SelectedValue;
            String elevator = HttpUtility.HtmlEncode(txtElevator.Text);
            String distFromElevator = HttpUtility.HtmlEncode(txtDistance.Text);
            String climateControlled = HttpUtility.HtmlEncode(txtClimateControlled.Text);
            String outdoorStorage = HttpUtility.HtmlEncode(txtOutdoor.Text);
            String distToLoadingDoor = HttpUtility.HtmlEncode(txtLoadingDoor.Text);
            String stepsToHouse = HttpUtility.HtmlEncode(txtSteps.Text);
            //int floorNumber = int.Parse(HttpUtility.HtmlEncode(txtFloor.Text));
            int pickUpFee = int.Parse(HttpUtility.HtmlEncode(txtPickUpFee.Text));
            int consignmentFee = int.Parse(HttpUtility.HtmlEncode(txtConsignmentRate.Text));
            int trashRemovalFee = int.Parse(HttpUtility.HtmlEncode(txtTrashRemoval.Text));
            int additionalFee = int.Parse(HttpUtility.HtmlEncode(txtAdditionalFees.Text));
            try
            {
                System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString.ToString());
                sc.Open();

                System.Data.SqlClient.SqlCommand updateService = new System.Data.SqlClient.SqlCommand();
                updateService.Connection = sc;
                //update record in SERVICE
                updateService.CommandText = "UPDATE SERVICE SET serviceStatus = @serviceStatus WHERE serviceID = @serviceID;";
                updateService.Parameters.Add(new SqlParameter("@serviceID", Session["serviceID"].ToString()));
                updateService.Parameters.Add(new SqlParameter("@serviceStatus", "Schedule Assessment"));

                if (ddlHomeType.SelectedValue == "Place of Business")
                {

                    System.Data.SqlClient.SqlCommand addAucAssess = new System.Data.SqlClient.SqlCommand();
                    addAucAssess.Connection = sc;
                    // INSERT Service RECORD
                    addAucAssess.CommandText = " UPDATE dbo.AUCTIONSERVICE SET typeOfHome = @typeOfHome, distToLoadingDoor= @distToLoadingDoor, stepsToHouse=@stepsToHouse, pickUpFee=@pickUpFee, consignmentFee=@consignmentFee, trashRemovalFee=@trashRemovalFee," +
                        " additionalFee=@additionalFee WHERE serviceID = @serviceID";
                    addAucAssess.Parameters.Add(new SqlParameter("@typeOfHome", typeOfHome));
                    addAucAssess.Parameters.Add(new SqlParameter("@distToLoadingDoor", distToLoadingDoor));
                    addAucAssess.Parameters.Add(new SqlParameter("@stepsToHouse", stepsToHouse));
                    addAucAssess.Parameters.Add(new SqlParameter("@pickUpFee", pickUpFee));
                    addAucAssess.Parameters.Add(new SqlParameter("@consignmentFee", consignmentFee));
                    addAucAssess.Parameters.Add(new SqlParameter("@trashRemovalFee", trashRemovalFee));
                    addAucAssess.Parameters.Add(new SqlParameter("@AdditionalFee", additionalFee));
                    addAucAssess.Parameters.Add(new SqlParameter("@serviceID", Session["serviceID"].ToString()));
                    addAucAssess.ExecuteNonQuery();
                }
                if (ddlHomeType.SelectedValue == "Storage Unit")
                {
                    System.Data.SqlClient.SqlCommand addAucAssess = new System.Data.SqlClient.SqlCommand();
                    addAucAssess.Connection = sc;
                    // INSERT Service RECORD
                    addAucAssess.CommandText = " UPDATE dbo.AUCTIONSERVICE SET typeOfHome = @typeOfHome, climateControlled= @climateControlled, outdoorStorage=@outdoorStorage, " +
                        " pickUpFee=@pickUpFee, consignmentFee=@consignmentFee, trashRemovalFee=@trashRemovalFee, additionalFee=@additionalFee" +
                        " WHERE serviceID = @serviceID";
                    addAucAssess.Parameters.Add(new SqlParameter("@typeOfHome", typeOfHome));
                    addAucAssess.Parameters.Add(new SqlParameter("@climateControlled", climateControlled));
                    addAucAssess.Parameters.Add(new SqlParameter("@outdoorStorage", outdoorStorage));
                    addAucAssess.Parameters.Add(new SqlParameter("@pickUpFee", pickUpFee));
                    addAucAssess.Parameters.Add(new SqlParameter("@consignmentFee", consignmentFee));
                    addAucAssess.Parameters.Add(new SqlParameter("@trashRemovalFee", trashRemovalFee));
                    addAucAssess.Parameters.Add(new SqlParameter("@AdditionalFee", additionalFee));
                    addAucAssess.Parameters.Add(new SqlParameter("@serviceID", Session["serviceID"].ToString()));
                    addAucAssess.ExecuteNonQuery();
                }
                if (ddlHomeType.SelectedValue == "Apartment")
                {
                    System.Data.SqlClient.SqlCommand addAucAssess = new System.Data.SqlClient.SqlCommand();
                    addAucAssess.Connection = sc;
                    // INSERT Service RECORD
                    addAucAssess.CommandText = " UPDATE dbo.AUCTIONSERVICE SET typeOfHome = @typeOfHome, floorNumber= @floorNumber, elevator=@elevator, distFromElevator= @distFromElevator," +
                        " pickUpFee=@pickUpFee, consignmentFee=@consignmentFee, trashRemovalFee=@trashRemovalFee, additionalFee=@additionalFee" +
                        " WHERE serviceID = @serviceID";
                    addAucAssess.Parameters.Add(new SqlParameter("@typeOfHome", typeOfHome));
                    addAucAssess.Parameters.Add(new SqlParameter("@floorNumber", int.Parse(HttpUtility.HtmlEncode(txtFloor.Text))));
                    addAucAssess.Parameters.Add(new SqlParameter("@elevator", elevator));
                    addAucAssess.Parameters.Add(new SqlParameter("@distFromElevator", distFromElevator));
                    addAucAssess.Parameters.Add(new SqlParameter("@pickUpFee", pickUpFee));
                    addAucAssess.Parameters.Add(new SqlParameter("@consignmentFee", consignmentFee));
                    addAucAssess.Parameters.Add(new SqlParameter("@trashRemovalFee", trashRemovalFee));
                    addAucAssess.Parameters.Add(new SqlParameter("@AdditionalFee", additionalFee));
                    addAucAssess.Parameters.Add(new SqlParameter("@serviceID", Session["serviceID"].ToString()));
                    addAucAssess.ExecuteNonQuery();
                }
                for (int i = 0; i <= chkBoxMaterials.Items.Count - 1; i++)
                {
                    if (chkBoxMaterials.Items[i].Selected)
                    {
                        String material = chkBoxMaterials.Items[i].ToString();
                        String materialID = getMaterialID(material);
                        String serviceMaterialID = GenerateID("SELECT MAX(dbo.SERVICEMATERIAL.serviceMaterialID) FROM dbo.SERVICEMATERIAL");
                        System.Data.SqlClient.SqlCommand addMaterial = new System.Data.SqlClient.SqlCommand();
                        addMaterial.Connection = sc;
                        // INSERT Service RECORD
                        addMaterial.CommandText = "SET IDENTITY_INSERT dbo.SERVICEMATERIAL ON;" +
                            " INSERT INTO dbo.SERVICEMATERIAL (serviceMaterialID, serviceID, materialID) VALUES(@serviceMaterialID, @serviceID, @materialID)" +
                            " SET IDENTITY_INSERT dbo.SERVICEMATERIAL OFF;";
                        addMaterial.Parameters.Add(new SqlParameter("@serviceMaterialID", serviceMaterialID));
                        addMaterial.Parameters.Add(new SqlParameter("@serviceID", Session["serviceID"].ToString()));
                        addMaterial.Parameters.Add(new SqlParameter("@materialID", materialID));
                        addMaterial.ExecuteNonQuery();
                    }
                }

                for (int i = 0; i <= chkbxSpecialEquipment.Items.Count - 1; i++)
                {
                    if (chkbxSpecialEquipment.Items[i].Selected)
                    {
                        String special = chkbxSpecialEquipment.Items[i].ToString();
                        String specialEquipmentID = getSpecialEquipmentID(special);
                        String specialServiceID = GenerateID("SELECT MAX(dbo.SPECIALSERVICE.specialServiceID) FROM dbo.SPECIALSERVICE");
                        System.Data.SqlClient.SqlCommand addSpecEquip = new System.Data.SqlClient.SqlCommand();
                        addSpecEquip.Connection = sc;
                        // INSERT Service RECORD
                        addSpecEquip.CommandText = "SET IDENTITY_INSERT dbo.SPECIALSERVICE ON;" +
                            " INSERT INTO dbo.SPECIALSERVICE (specialServiceID, serviceID, specialEquipmentID) VALUES(@specialServiceID, @serviceID, @specialEquipmentID)" +
                            " SET IDENTITY_INSERT dbo.SPECIALSERVICE OFF;";
                        addSpecEquip.Parameters.Add(new SqlParameter("@specialServiceID", specialServiceID));
                        addSpecEquip.Parameters.Add(new SqlParameter("@serviceID", Session["serviceID"].ToString()));
                        addSpecEquip.Parameters.Add(new SqlParameter("@specialEquipmentID", specialEquipmentID));
                        addSpecEquip.ExecuteNonQuery();
                    }
                }
                lblStatus.Text = "Auction Assessment has been saved!";
                lblStatus.ForeColor = Color.Green;
            }

            catch
            {
                lblStatus.Text = "Error - Please try again!";
                lblStatus.ForeColor = Color.Red;
            }
        }

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

        protected void BtnPopulate_Click(object sender, EventArgs e)
        {
            txtAdditionalFees.Text = "45";
            txtClimateControlled.Text = "Yes";
            txtConsignmentRate.Text = "37";
            txtDeadlineDate.Text = "2021-02-01";
            txtDistance.Text = "100ft";
            txtElevator.Text = "No";
            txtFloor.Text = "5";
            txtLoadingDoor.Text = "300 yards";
            txtOutdoor.Text = "Yes";
            txtPickUpFee.Text = "79";
            txtSell.Text = "Tea Cart";
            txtSteps.Text = "11";
            txtTrashRemoval.Text = "26";
            ddlAdditionalServices.SelectedValue = "Move";
            ddlDeadlineDate.SelectedValue = "Yes";
            ddlHomeType.SelectedValue = "Home";
            ddlItemList.SelectedValue = "No";
            ddlPicsRequested.SelectedValue = "No";
            ddlReasonWhySell.SelectedValue = "Settling an estate";


        }

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            txtAdditionalFees.Text = "";
            txtClimateControlled.Text = "";
            txtConsignmentRate.Text = "";
            txtDeadlineDate.Text = "";
            txtDistance.Text = "";
            txtElevator.Text = "";
            txtFloor.Text = "";
            txtLoadingDoor.Text = "";
            txtOutdoor.Text = "";
            txtPickUpFee.Text = "";
            txtSell.Text = "";
            txtSteps.Text = "";
            txtTrashRemoval.Text = "";
            ddlAdditionalServices.ClearSelection();
            ddlDeadlineDate.ClearSelection();
            ddlHomeType.ClearSelection();
            ddlItemList.ClearSelection();
            ddlPicsRequested.ClearSelection();
            ddlReasonWhySell.ClearSelection();
        }
        protected String getMaterialID(String material)
        {
            string sqlQuery = "SELECT materialID FROM dbo.MATERIALS WHERE MATERIALS.description ='" + material + "'";

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
            DataSet matDS = new DataSet();
            sqlAdapter.Fill(matDS);

            String matID = matDS.Tables[0].Rows[0][0].ToString();
            sqlConnect.Close();

            //return the ID
            return matID;
        }
        protected String getSpecialEquipmentID(String special)
        {
            string sqlQuery = "SELECT specialEquipmentID FROM dbo.SPECIALEQUIPMENT WHERE SPECIALEQUIPMENT.description ='" + special + "'";

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
            Response.Redirect("AuctionAssessment.aspx");

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

        protected void btnSavePre_Click(object sender, EventArgs e)
        {
            try
            {
                String itemToSell = HttpUtility.HtmlEncode(txtSell.Text);
                String whySelling = ddlReasonWhySell.SelectedValue;
                DateTime deadlineDate = DateTime.Parse(HttpUtility.HtmlEncode(txtDeadlineDate.Text));
                String pictures = HttpUtility.HtmlEncode(ddlPicsRequested.SelectedValue);
                String itemsRequested = HttpUtility.HtmlEncode(ddlItemList.SelectedValue);

                System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString.ToString());
                System.Data.SqlClient.SqlCommand addAucPreAssess = new System.Data.SqlClient.SqlCommand();
                sc.Open();
                addAucPreAssess.Connection = sc;
                // INSERT Service RECORD
                addAucPreAssess.CommandText = " UPDATE dbo.AUCTIONSERVICE SET itemToSell = @itemToSell, whySelling = @whySelling, deadlineDate = @deadlineDate, picturesRequested= @picturesRequested," +
                    " itemsRequested=itemsRequested" +
                    " WHERE serviceID = @serviceID";
                addAucPreAssess.Parameters.Add(new SqlParameter("@itemToSell", itemToSell));
                addAucPreAssess.Parameters.Add(new SqlParameter("@whySelling", whySelling));
                addAucPreAssess.Parameters.Add(new SqlParameter("@deadlineDate", deadlineDate));
                addAucPreAssess.Parameters.Add(new SqlParameter("@picturesRequested", pictures));
                addAucPreAssess.Parameters.Add(new SqlParameter("@itemsRequested", itemsRequested));
                addAucPreAssess.Parameters.Add(new SqlParameter("@serviceID", Session["serviceID"].ToString()));
                addAucPreAssess.ExecuteNonQuery();
                lblSaved.Text = "Auction PreAssessment has been saved!";
                lblSaved.ForeColor = Color.Green;
            }

            catch
            {
                lblSaved.Text = "Error - Please try again!";
                lblSaved.ForeColor = Color.Red;
            }
        }
        protected void submitNote_Click(object sender, EventArgs e)
        {
            try
            {
                String employeeID = getEmployee();

                System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString.ToString());
                sc.Open();

                System.Data.SqlClient.SqlCommand addNote = new System.Data.SqlClient.SqlCommand();
                addNote.Connection = sc;
                // INSERT INTO Note TABLE
                addNote.CommandText = "INSERT INTO dbo.EMPLOYEENOTE (noteTitle, noteBody, employeeID, serviceID) VALUES(@noteTitle, @noteBody, @employeeID, @serviceID)";
                addNote.Parameters.Add(new SqlParameter("@noteTitle", HttpUtility.HtmlEncode(txtTitle2.Text)));
                addNote.Parameters.Add(new SqlParameter("@noteBody", HttpUtility.HtmlEncode(txtBody.Text)));
                addNote.Parameters.Add(new SqlParameter("@employeeID", employeeID));
                addNote.Parameters.Add(new SqlParameter("@serviceID", Session["serviceID"].ToString()));
                addNote.ExecuteNonQuery();
                sc.Close();
            }
            catch
            {
                //lblNotify.Text = "Note was unable to be added.";
            }
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
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Attributes.CssStyle.Add("display", "block");
            btnAuctionAssessmentForm.Visible = true;
            btnAppraisalServiceOrderForm.Visible = true;
            btnAuctionServiceOrder.Visible = true;
            forms.Visible = true;
            ImageButton1.Visible = false;
        }
        protected void btnCollapse_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Attributes.CssStyle.Add("display", "none");
            btnAuctionAssessmentForm.Visible = false;
            btnAppraisalServiceOrderForm.Visible = false;
            btnAuctionServiceOrder.Visible = false;
            forms.Visible = false;
            ImageButton1.Visible = true;
        }

    }
}



