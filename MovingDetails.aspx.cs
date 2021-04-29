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
using System.IO;

namespace GreenValleyAuctionsSystem
{
    public partial class MovingDetails : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //adds the title for the page 
            newTitle.Text = "Moving Ticket for " + Session["CustomerName"];
            if (!IsPostBack)
            {
                //calls method to fill drop down lists as long as the page is not a post back 
                fillDataLists();
            }

            //gets the moving service ID associated with this service 
            String sqlQuery = "SELECT movingServiceID FROM dbo.MOVINGSERVICE  WHERE MOVINGSERVICE.serviceID = '" + Session["serviceID"] + "'";
            DataTable ds = sqlConnection(sqlQuery);
            Session["movingServiceID"] = ds.Rows[0][0].ToString();

            //get the total cubic units associated with this service 
            String sqlQueryTotal = "SELECT MOVINGSERVICE.totalCU FROM dbo.MOVINGSERVICE WHERE MOVINGSERVICE.movingServiceID = '" + Session["movingServiceID"] + "'";
            DataTable totalDS = sqlConnection(sqlQueryTotal);
            //checks to see if query comes back null 

            lblTotalCU.Visible = true;
            lblTotalCU.Text = "Total Cubic Units: " + totalDS.Rows[0][0].ToString() + " Units";


            //calls method to fill the status bar 
            fillStatusBar();


        }
        //method that fills each of the drop down lists 
        protected void fillDataLists()
        {
            //fills the employee/crew drop down list
            String sqlQueryEmp = "SELECT employeeID, firstName +' ' + lastName as FullName FROM dbo.EMPLOYEE";
            DataTable customerList = sqlConnection(sqlQueryEmp);
            ddlEmp.DataSource = customerList;
            ddlEmp.DataTextField = "FullName";
            ddlEmp.DataValueField = "employeeID";
            ddlEmp.DataBind();

            //fills the vehicle drop down list 
            String sqlQueryVehicle = "SELECT equipmentID, description FROM dbo.EQUIPMENT";
            DataTable vehicleList = sqlConnection(sqlQueryVehicle);
            ddlVehicles.DataSource = vehicleList;
            ddlVehicles.DataTextField = "description";
            ddlVehicles.DataValueField = "equipmentID";
            ddlVehicles.DataBind();

            //fills the furniture name drop down list 
            String sqlQueryFurniture = "SELECT furnitureID, name FROM dbo.FURNITURE";
            DataTable furnitureList = sqlConnection(sqlQueryFurniture);
            ddlName.DataSource = furnitureList;
            ddlName.DataTextField = "name";
            ddlName.DataValueField = "furnitureID";
            ddlName.DataBind();

            //fills the room type drop down list 
            String sqlQueryRoom = "Select roomID, roomType FROM dbo.ROOMS";
            DataTable roomList = sqlConnection(sqlQueryRoom);
            ddlRoom.DataSource = roomList;
            ddlRoom.DataTextField = "roomType";
            ddlRoom.DataValueField = "roomID";
            ddlRoom.DataBind();

        }


        //creates connection with the database and sends query results back 
        protected DataTable sqlConnection(String sqlQuery)
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
        //method that fills the status bar 
        protected void fillStatusBar()
        {
            String status = "";
            String sqlQuery1 = "SELECT SERVICE.serviceStatus FROM dbo.SERVICE WHERE SERVICE.serviceID = '" + Session["serviceID"].ToString() + "'";
            DataTable progressDS = sqlConnection(sqlQuery1);
            status = progressDS.Rows[0][0].ToString();


            switch (status)
            {

                case "New Service":
                    lblServiceCompleted.Text = "Move Assessment has been Scheduled!";
                    checkBxCompleted.ToolTip = "Schedule Assessment";
                    break;
                case "Schedule Assessment":
                    step1.Attributes.Add("class", "later");
                    status1.CssClass = "fontAfter";
                    checkBxCompleted.Text = " The estimate has been presented to the customer!";
                    checkBxCompleted.ToolTip = "Present Estimate";
                    break;
                case "Present Estimate":
                    step1.Attributes.Add("class", "later");
                    step2.Attributes.Add("class", "later");
                    status1.CssClass = "fontAfter";
                    status2.CssClass = "fontAfter";
                    checkBxCompleted.Text = " Customer has accepted the estimate!";
                    checkBxCompleted.ToolTip = "Estimate Accepted";
                    break;
                case "Estimate Accepted":
                    step1.Attributes.Add("class", "later");
                    step2.Attributes.Add("class", "later");
                    step3.Attributes.Add("class", "later");
                    status1.CssClass = "fontAfter";
                    status2.CssClass = "fontAfter";
                    status3.CssClass = "fontAfter";
                    checkBxCompleted.Text = " Move has been Scheduled!";
                    checkBxCompleted.ToolTip = "Schedule Move";
                    break;
                case "Schedule Move":
                    step1.Attributes.Add("class", "later");
                    step2.Attributes.Add("class", "later");
                    step3.Attributes.Add("class", "later");
                    step4.Attributes.Add("class", "later");
                    status1.CssClass = "fontAfter";
                    status2.CssClass = "fontAfter";
                    status3.CssClass = "fontAfter";
                    status4.CssClass = "fontAfter";
                    checkBxCompleted.Text = " Service has been Completed!";
                    checkBxCompleted.ToolTip = "Move Completed";
                    break;
                case "Move Completed":
                    step1.Attributes.Add("class", "later");
                    step2.Attributes.Add("class", "later");
                    step3.Attributes.Add("class", "later");
                    step4.Attributes.Add("class", "later");
                    step5.Attributes.Add("class", "later");
                    status1.CssClass = "fontAfter";
                    status2.CssClass = "fontAfter";
                    status3.CssClass = "fontAfter";
                    status4.CssClass = "fontAfter";
                    status5.CssClass = "fontAfter";
                    checkBxCompleted.Text = " Customer has completed their Review!";
                    checkBxCompleted.ToolTip = "Review Completed";
                    break;
                case "Review Completed":
                    step1.Attributes.Add("class", "later");
                    step2.Attributes.Add("class", "later");
                    step3.Attributes.Add("class", "later");
                    step4.Attributes.Add("class", "later");
                    step5.Attributes.Add("class", "later");
                    step6.Attributes.Add("class", "later");
                    step8.Attributes.Add("class", "later");
                    status1.CssClass = "fontAfter";
                    status2.CssClass = "fontAfter";
                    status3.CssClass = "fontAfter";
                    status4.CssClass = "fontAfter";
                    status5.CssClass = "fontAfter";
                    status6.CssClass = "fontAfter";
                    checkBxCompleted.Attributes.CssStyle.Add("display", "none");
                    lblServiceCompleted.Text = "All Tasks for this service have been completed!";
                    btnTaskCompleted.Visible = false;
                    break;
            }
        }
        protected void btnMovingForm_Click(object sender, EventArgs e)
        {
            Response.Redirect("MoveForm.aspx");
        }


        protected void btnMoveSchedulingForm_Click1(object sender, EventArgs e)
        {
            Response.Redirect("MoveSchedulingScreen.aspx");
        }

        protected void btnCompletionForm_Click(object sender, EventArgs e)
        {
            Response.Redirect("ServiceCompletionForm.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // String noteID = GenerateID("SELECT MAX(dbo.EMPLOYEENOTE.noteID) FROM dbo.EMPLOYEENOTE");
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
            Response.Redirect("MovingDetails.aspx");
        }
        protected String GetEmployeeID()
        {
            String sqlQuery = "SELECT EMPLOYEE.employeeID FROM dbo.EMPLOYEE WHERE EMPLOYEE.emailAddress = '" + Session["Username"].ToString() + "'";

            //will hold the ID from query
            String employeeID = "";

            DataTable employeeDS = sqlConnection(sqlQuery);

            employeeID = employeeDS.Rows[0][0].ToString();

            int newIDNum = int.Parse(employeeID);
            string newID = newIDNum.ToString();

            return newID;
        }
        protected void btnInitialContactForm_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewCustomer.aspx");
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
            saveNote.CommandText = "INSERT INTO [dbo].[TODO] (taskTitle, taskBody, startDate, endDate, urgency,  employeeID) VALUES(@TaskTitle, @TaskBody, GETDATE(), @EndDate, @Urgency, @EmployeeID)";
            saveNote.Parameters.Add(new SqlParameter("@TaskTitle", taskTitle));
            saveNote.Parameters.Add(new SqlParameter("@TaskBody", taskBody));
            //saveNote.Parameters.Add(new SqlParameter("@startDate", lblsDate.Text));
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

        protected void btnNewRoom_Click(object sender, ImageClickEventArgs e)
        {
            String sqlQueryTotal = "SELECT MOVINGSERVICE.totalCU FROM dbo.MOVINGSERVICE WHERE MOVINGSERVICE.movingServiceID  = '" + Session["movingserviceID"] + "'";
            DataTable totalDS = sqlConnection(sqlQueryTotal);
            String CU = totalDS.Rows[0][0].ToString();
            int currentCU = int.Parse(CU);

            String sqlQueryCubic = "SELECT FURNITURE.cubicUnit FROM dbo.FURNITURE WHERE FURNITURE.furnitureID = '" + ddlName.SelectedValue + "'";
            DataTable cubicDS = sqlConnection(sqlQueryCubic);
            String cubicUnit = cubicDS.Rows[0][0].ToString();
            int cube = int.Parse(cubicUnit);

            int selector = int.Parse(quantitySelector.Text);

            int newCubicUnits = currentCU + (selector * cube);

            System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString.ToString());
            sc.Open();

            System.Data.SqlClient.SqlCommand addItem = new System.Data.SqlClient.SqlCommand();
            addItem.Connection = sc;
            // INSERT INTO Note TABLE
            addItem.CommandText = "INSERT INTO dbo.FURNITURESERVICE (quantity, serviceID, furnitureID, roomID) VALUES (@quantity, @serviceID, @furnitureID, @roomID)";
            addItem.Parameters.Add(new SqlParameter("@quantity", HttpUtility.HtmlEncode(selector)));
            addItem.Parameters.Add(new SqlParameter("@serviceID", HttpUtility.HtmlEncode(Session["serviceID"])));
            addItem.Parameters.Add(new SqlParameter("@furnitureID", HttpUtility.HtmlEncode(ddlName.SelectedIndex + 1)));
            addItem.Parameters.Add(new SqlParameter("@roomID", HttpUtility.HtmlEncode(ddlRoom.SelectedIndex + 1)));
            addItem.ExecuteNonQuery();


            System.Data.SqlClient.SqlCommand addCubicUnits = new System.Data.SqlClient.SqlCommand();
            addCubicUnits.Connection = sc;
            addCubicUnits.CommandText = "UPDATE dbo.MOVINGSERVICE SET totalCU = @totalCU FROM dbo.SERVICE, dbo.MOVINGSERVICE WHERE MOVINGSERVICE.serviceID = SERVICE.serviceID AND SERVICE.serviceID ='" + Session["serviceID"] + "'";
            addCubicUnits.Parameters.Add(new SqlParameter("totalCU", HttpUtility.HtmlEncode(newCubicUnits)));
            addCubicUnits.ExecuteNonQuery();

            Response.Redirect("MovingDetails.aspx");
            ddlName.Visible = false;
            ddlRoom.Visible = false;
            btnNewRoom.Visible = false;
            btnCancelRoom.Visible = false;
            quantitySelector.Visible = false;



        }

        protected void btnCancelRoom_Click(object sender, ImageClickEventArgs e)
        {
            btnNewRoom.Visible = false;
            btnCancelRoom.Visible = false;
            ddlName.Visible = false;
            ddlRoom.Visible = false;
            quantitySelector.Visible = false;

        }

        protected void addRoom_Click(object sender, ImageClickEventArgs e)
        {
            //adds styling to elements 
            btnNewRoom.Visible = true;
            btnCancelRoom.Visible = true;
            ddlName.Attributes.CssStyle.Add("margin-left", "30px");
            ddlName.Visible = true;
            ddlRoom.Visible = true;
            quantitySelector.Visible = true;


        }

        protected void btnNewEmp_Click(object sender, ImageClickEventArgs e)
        {
            String empID = ddlEmp.Items[ddlEmp.SelectedIndex].Value;

            System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString.ToString());
            sc.Open();

            System.Data.SqlClient.SqlCommand addItem = new System.Data.SqlClient.SqlCommand();
            addItem.Connection = sc;
            // INSERT INTO Note TABLE
            addItem.CommandText = "INSERT INTO dbo.CREW (employeeID, serviceID) VALUES (@employeeID, @serviceID)";
            addItem.Parameters.Add(new SqlParameter("@employeeID", HttpUtility.HtmlEncode(empID)));
            addItem.Parameters.Add(new SqlParameter("@serviceID", Session["serviceID"]));
            addItem.ExecuteNonQuery();
            sc.Close();
            Response.Redirect("MovingDetails.aspx");

            btnNewEmp.Visible = false;
        }

        protected void btnCancelEmp_Click(object sender, ImageClickEventArgs e)
        {
            btnNewEmp.Visible = false;
            btnCancelEmp.Visible = false;
            ddlEmp.Visible = false;
        }

        protected void addEmp_Click(object sender, ImageClickEventArgs e)
        {
            //adds styling to elements 
            btnNewEmp.Visible = true;
            btnCancelEmp.Visible = true;
            ddlEmp.Visible = true;
        }

        protected void btnNewVehicle_Click(object sender, ImageClickEventArgs e)
        {
            String vehicleID = ddlVehicles.Items[ddlVehicles.SelectedIndex].Value;

            System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString.ToString());
            sc.Open();

            System.Data.SqlClient.SqlCommand addItem = new System.Data.SqlClient.SqlCommand();
            addItem.Connection = sc;
            // INSERT INTO Note TABLE
            addItem.CommandText = "INSERT INTO dbo.EQUIPMENTSERVICE (serviceID, equipmentID) VALUES (@serviceID, @equipmentID)";
            addItem.Parameters.Add(new SqlParameter("@equipmentID", HttpUtility.HtmlEncode(vehicleID)));
            addItem.Parameters.Add(new SqlParameter("@serviceID", Session["serviceID"]));
            addItem.ExecuteNonQuery();
            sc.Close();
            Response.Redirect("MovingDetails.aspx");

            btnNewEmp.Visible = false;
        }

        protected void btnCancelVehicle_Click(object sender, ImageClickEventArgs e)
        {
            btnNewVehicle.Visible = false;
            btnCancelVehicle.Visible = false;
            ddlVehicles.Visible = false;
        }

        protected void addVehicle_Click(object sender, ImageClickEventArgs e)
        {

            //adds styling to elements 
            btnNewVehicle.Visible = true;
            btnCancelVehicle.Visible = true;
            ddlVehicles.Visible = true;
        }

        //protected void grdDocuments_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    if (e.CommandName == "view")
        //    {
        //        //holds the index of the selected row 
        //        String rowIndex = e.CommandArgument.ToString();
        //        Response.Write("<script>");
        //        Response.Write("window.open('CustomerFiles/" + rowIndex + "', '_newtab');");
        //        Response.Write("</script>");
        //    }


        //    if (e.CommandName == "Delete")
        //    {
        //        String rowIndex = e.CommandArgument.ToString();
        //        string filePath = Server.MapPath("./") + "CustomerFiles/" + rowIndex;

        //        Session["deletedFilePath"] = filePath;

        //    }

        //}


        //protected void btnAddDoc_Click(object sender, ImageClickEventArgs e)
        //{
        //    btnAddDoc.Attributes.CssStyle.Add("display", "none");
        //    divFile1.Attributes.CssStyle.Add("display", "block");
        //    divFile2.Attributes.CssStyle.Add("display", "block");
        //}

        ////method that adds files to the database and the customer file 
        //protected void AddFiles(String strFileName, String strFolder)
        //{
        //    String fileType = "";
        //    String strFilePath = "";

        //    if (strFileName.Contains(".jpg") || strFileName.Contains(".jpeg") || strFileName.Contains(".png") || strFileName.Contains(".PNG") || strFileName.Contains(".jfif"))
        //    {
        //        fileType = "Image";
        //    }
        //    else if (strFileName.Contains(".pdf") || strFileName.Contains(".doc") || strFileName.Contains(".docx") || strFileName.Contains(".txt"))
        //    {
        //        fileType = "Information File or Contract";
        //    }
        //    else if (strFileName.Contains(".mp4") || strFileName.Contains(".mov") || strFileName.Contains(".qt") || strFileName.Contains(".mpg") || strFileName.Contains(".mpeg") || strFileName.Contains(".avi"))
        //    {
        //        fileType = "Video";
        //    }
        //    else
        //    {
        //        fileType = "Unspecified";
        //    }
        //    if (oFile.Value != "")
        //    {
        //        // Create the directory if it does not exist.
        //        if (!Directory.Exists(strFolder))
        //        {
        //            Directory.CreateDirectory(strFolder);
        //        }
        //        // Save the uploaded file to the server.
        //        strFilePath = strFolder + strFileName;
        //        if (File.Exists(strFilePath))
        //        {
        //            lblUploadResult1.Visible = true;
        //            lblUploadResult1.Text = strFileName + " already exists on the server!";
        //        }
        //        else
        //        {
        //            oFile.PostedFile.SaveAs(strFilePath);
        //            lblUploadResult1.Text = strFileName + " has been successfully uploaded.";

        //            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString);

        //            System.Data.SqlClient.SqlCommand insertImage = new System.Data.SqlClient.SqlCommand();

        //            con.Open();
        //            insertImage.Connection = con;

        //            insertImage.CommandText = "INSERT INTO dbo.[FILE] (fileName, fileType, serviceID) VALUES(@fileName, @fileType, @serviceID)";

        //            insertImage.Parameters.Add(new SqlParameter("@fileName", strFileName));
        //            insertImage.Parameters.Add(new SqlParameter("@fileType", fileType));
        //            insertImage.Parameters.Add(new SqlParameter("@serviceID", Session["serviceID"]));

        //            insertImage.ExecuteNonQuery();
        //            con.Close();

        //            Response.Redirect("MovingDetails.aspx");
        //        }
        //    }
        //    else if (imageFile.Value != "")
        //    {
        //        // Create the directory if it does not exist.
        //        if (!Directory.Exists(strFolder))
        //        {
        //            Directory.CreateDirectory(strFolder);
        //        }
        //        // Save the uploaded file to the server.
        //        strFilePath = strFolder + strFileName;
        //        if (File.Exists(strFilePath))
        //        {
        //            lblUploadResult2.Visible = true;
        //            lblUploadResult2.Text = strFileName + " already exists on the server!";
        //        }
        //        else
        //        {
        //            imageFile.PostedFile.SaveAs(strFilePath);
        //            lblUploadResult2.Text = strFileName + " has been successfully uploaded.";

        //            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString);

        //            System.Data.SqlClient.SqlCommand insertImage = new System.Data.SqlClient.SqlCommand();

        //            con.Open();
        //            insertImage.Connection = con;

        //            insertImage.CommandText = "INSERT INTO dbo.[FILE] (fileName, fileType, serviceID) VALUES(@fileName, @fileType, @serviceID)";

        //            insertImage.Parameters.Add(new SqlParameter("@fileName", strFileName));
        //            insertImage.Parameters.Add(new SqlParameter("@fileType", fileType));
        //            insertImage.Parameters.Add(new SqlParameter("@serviceID", Session["serviceID"]));

        //            insertImage.ExecuteNonQuery();
        //            con.Close();

        //            Response.Redirect("MovingDetails.aspx");
        //        }
        //    }
        //    else
        //    {
        //        lblUploadResult2.Text = "Click 'Choose File' to select the file to upload.";
        //    }
        //}

        //protected void btnUploads_Click(object sender, ImageClickEventArgs e)
        //{
        //    string strFileName;
        //    string strFolder;

        //    strFolder = Server.MapPath("./") + "CustomerFiles\\";
        //    // Get the name of the file that is posted.
        //    strFileName = oFile.PostedFile.FileName;
        //    strFileName = Path.GetFileName(strFileName);
        //    AddFiles(strFileName, strFolder);

        //    btnAddDoc.Attributes.CssStyle.Add("display", "block");
        //    divFile1.Attributes.CssStyle.Add("display", "none");
        //    divFile2.Attributes.CssStyle.Add("display", "none");

        //}

        //protected void btnCancelUploads_Click(object sender, ImageClickEventArgs e)
        //{
        //    btnAddDoc.Attributes.CssStyle.Add("display", "block");
        //    divFile1.Attributes.CssStyle.Add("display", "none");
        //    divFile2.Attributes.CssStyle.Add("display", "none");
        //}

        protected void btnTaskCompleted_Click(object sender, EventArgs e)
        {
            if (checkBxCompleted.Checked)
            {
                System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString.ToString());
                sc.Open();

                System.Data.SqlClient.SqlCommand updateStatus = new System.Data.SqlClient.SqlCommand();
                updateStatus.Connection = sc;
                // INSERT INTO Note TABLE
                updateStatus.CommandText = "UPDATE dbo.SERVICE SET serviceStatus = @serviceStatus  WHERE SERVICE.serviceID = '" + Session["serviceID"] + "'";
                updateStatus.Parameters.Add(new SqlParameter("@serviceStatus", HttpUtility.HtmlEncode(checkBxCompleted.ToolTip)));
                updateStatus.Parameters.Add(new SqlParameter("@serviceID", HttpUtility.HtmlEncode(Session["serviceID"])));

                updateStatus.ExecuteNonQuery();
                sc.Close();
                sc.Dispose();
                Response.Redirect("MovingDetails.aspx");
            }
        }

        //protected void datasrcDocuments_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        //{
        //    File.Delete(Session["deletedFilePath"].ToString());

        //}

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            divPopUp.Attributes.CssStyle.Add("display", "block");
        }

        protected void btnExit_Click(object sender, EventArgs e)
        {
            divPopUp.Attributes.CssStyle.Add("display", "none");
        }

        //protected void datasrcImages_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        //{
        //    File.Delete(Session["deletedImagePath"].ToString());
        //}




        ////method that adds image upload to database and customer file 
        //protected void btnImageUpload_Click(object sender, ImageClickEventArgs e)
        //{
        //    string strFileName;
        //    string strFolder;

        //    strFolder = Server.MapPath("./") + "CustomerFiles\\";
        //    // Get the name of the file that is posted.
        //    strFileName = imageFile.PostedFile.FileName;
        //    strFileName = Path.GetFileName(strFileName);
        //    AddFiles(strFileName, strFolder);

        //    btnAddImage.Attributes.CssStyle.Add("display", "block");
        //    divImages2.Attributes.CssStyle.Add("display", "none");
        //    divFiles2.Attributes.CssStyle.Add("display", "none");
        //}
        ////method that cancels image upload options 
        //protected void btnCancelImage_Click(object sender, ImageClickEventArgs e)
        //{
        //    btnAddImage.Attributes.CssStyle.Add("display", "block");
        //    divImages2.Attributes.CssStyle.Add("display", "none");
        //    divFiles2.Attributes.CssStyle.Add("display", "none");
        //}

        ////method that displays image upload options 
        //protected void btnAddImage_Click(object sender, ImageClickEventArgs e)
        //{
        //    btnAddImage.Attributes.CssStyle.Add("display", "none");
        //    divImages2.Attributes.CssStyle.Add("display", "block");
        //    divFiles2.Attributes.CssStyle.Add("display", "block");
        //}

        protected void btnCollapse_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Attributes.CssStyle.Add("display", "none");
            btnMoveAssessmentForm.Visible = false;
            btnAppraisalServiceOrderForm.Visible = false;
            btnMoveServiceOrder.Visible = false;
            forms.Visible = false;
            ImageButton1.Visible = true;
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Attributes.CssStyle.Add("display", "block");
            btnMoveAssessmentForm.Visible = true;
            btnAppraisalServiceOrderForm.Visible = true;
            btnMoveServiceOrder.Visible = true;
            forms.Visible = true;
            ImageButton1.Visible = false;
        }


        //protected void grdImages_RowCommand(object sender, GridViewCommandEventArgs e)
        //{

        //    if (e.CommandName == "view")
        //    {
        //        //holds the index of the selected row 
        //        String rowIndex = e.CommandArgument.ToString();

        //        int length = rowIndex.Length;
        //        String file = rowIndex.Substring(15, length - 15);
        //        //lblHelp.Text = file;

        //        Response.Write("<script>");
        //        Response.Write("window.open('CustomerFiles/" + file + "', '_newtab');");
        //        Response.Write("</script>");
        //    }


        //    if (e.CommandName == "Delete")
        //    {
        //        String rowIndex = e.CommandArgument.ToString();
        //        string filePath = Server.MapPath("./") + rowIndex;

        //        Session["deletedImagePath"] = filePath;

        //    }

        //}

        protected void lbtnToCustomerFile_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerFile.aspx");
        }

        protected void btnCompletion_Click(object sender, EventArgs e)
        {
            Response.Redirect("MoveServiceCompletionForm.aspx");
        }
    }
}




