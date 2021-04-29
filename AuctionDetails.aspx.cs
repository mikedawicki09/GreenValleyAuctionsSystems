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
    public partial class AuctionDetails : System.Web.UI.Page
    {

        //creates an object for the green valley green 
        Color greenValley = System.Drawing.ColorTranslator.FromHtml("#266141");
        protected void Page_Load(object sender, EventArgs e)
        {
            //checks to see if 
            if (Session["customerID"] == null)
            {
                Response.Redirect("EmployeeDashboard.aspx");
            }
            if (!IsPostBack)
            {
                String sqlQueryEmp = "SELECT employeeID, firstName +' ' + lastName as FullName FROM dbo.EMPLOYEE";
                DataTable customerList = sqlConnection(sqlQueryEmp);
                ddlEmp.DataSource = customerList;
                ddlEmp.DataTextField = "FullName";
                ddlEmp.DataValueField = "employeeID";
                ddlEmp.DataBind();

                String sqlQueryVehicle = "SELECT equipmentID, description FROM dbo.EQUIPMENT";
                DataTable vehicleList = sqlConnection(sqlQueryVehicle);
                ddlVehicles.DataSource = vehicleList;
                ddlVehicles.DataTextField = "description";
                ddlVehicles.DataValueField = "equipmentID";
                ddlVehicles.DataBind();



            }
            //call method to fill the status bar 
            fillStatusBar();

            newTitle.Text = "Auction Ticket for " + Session["CustomerName"];





        }
        //fills the tickets progress bar 
        protected void fillStatusBar()
        {
            String status = "";
            String sqlQuery1 = "SELECT SERVICE.serviceStatus FROM dbo.SERVICE WHERE SERVICE.serviceID = '" + Session["serviceID"].ToString() + "'";
            DataTable progressDS = sqlConnection(sqlQuery1);
            status = progressDS.Rows[0][0].ToString();

            switch (status)
            {
                case "New Service":
                    lblServiceCompleted.Text = "Auction Assessment has been Scheduled!";
                    checkBxCompleted.ToolTip = "Schedule Assessment";
                    break;
                case "Schedule Assessment":
                    step1.Attributes.Add("class", "later");
                    status1.CssClass = "fontAfter";
                    checkBxCompleted.Text = " The Proposal has been presented!";
                    checkBxCompleted.ToolTip = "Present Proposal";
                    break;
                case "Present Proposal":
                    step1.Attributes.Add("class", "later");
                    step2.Attributes.Add("class", "later");
                    status1.CssClass = "fontAfter";
                    status2.CssClass = "fontAfter";
                    checkBxCompleted.Text = " Customer has approved the Proposal!";
                    checkBxCompleted.ToolTip = "Proposal Accepted";
                    break;
                case "Proposal Accepted":
                    step1.Attributes.Add("class", "later");
                    step2.Attributes.Add("class", "later");
                    step3.Attributes.Add("class", "later");
                    status1.CssClass = "fontAfter";
                    status2.CssClass = "fontAfter";
                    status3.CssClass = "fontAfter";
                    checkBxCompleted.Text = " Add On Services have been Scheduled!";
                    checkBxCompleted.ToolTip = "Schedule Add On Services";
                    break;
                case "Schedule Add On Services":
                    step1.Attributes.Add("class", "later");
                    step2.Attributes.Add("class", "later");
                    step3.Attributes.Add("class", "later");
                    step4.Attributes.Add("class", "later");
                    status1.CssClass = "fontAfter";
                    status2.CssClass = "fontAfter";
                    status3.CssClass = "fontAfter";
                    status4.CssClass = "fontAfter";
                    checkBxCompleted.Text = " Auction has been Scheduled!";
                    checkBxCompleted.ToolTip = "Schedule Auction";
                    break;
                case "Schedule Auction":
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
                    checkBxCompleted.Text = " Service has been Completed!";
                    checkBxCompleted.ToolTip = "Auction Completed";
                    break;
                case "Auction Completed":
                    step1.Attributes.Add("class", "later");
                    step2.Attributes.Add("class", "later");
                    step3.Attributes.Add("class", "later");
                    step4.Attributes.Add("class", "later");
                    step5.Attributes.Add("class", "later");
                    step6.Attributes.Add("class", "later");
                    status1.CssClass = "fontAfter";
                    status2.CssClass = "fontAfter";
                    status3.CssClass = "fontAfter";
                    status4.CssClass = "fontAfter";
                    status5.CssClass = "fontAfter";
                    status6.CssClass = "fontAfter";
                    lblServiceCompleted.Text = " Customer has completed their Review!";
                    checkBxCompleted.ToolTip = "Review Completed";
                    break;
                case "Review Completed":
                    step1.Attributes.Add("class", "later");
                    step2.Attributes.Add("class", "later");
                    step3.Attributes.Add("class", "later");
                    step4.Attributes.Add("class", "later");
                    step5.Attributes.Add("class", "later");
                    step6.Attributes.Add("class", "later");
                    step7.Attributes.Add("class", "later");
                    step8.Attributes.Add("class", "later");
                    status1.CssClass = "fontAfter";
                    status2.CssClass = "fontAfter";
                    status3.CssClass = "fontAfter";
                    status4.CssClass = "fontAfter";
                    status5.CssClass = "fontAfter";
                    status6.CssClass = "fontAfter";
                    status7.CssClass = "fontAfter";
                    checkBxCompleted.Attributes.CssStyle.Add("display", "none");
                    lblServiceCompleted.Text = "All tasks for this service have been completed!";
                    btnTaskCompleted.Visible = false;
                    break;
            }

        }


        //creates connection with the database and sends query results back 
        protected DataTable sqlConnection(String sqlQuery)
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


        protected void btnSubmit_Click(object sender, EventArgs e)
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
            Response.Redirect("AuctionDetails.aspx");


        }
        //method to find the employee id 
        protected String GetEmployeeID()
        {
            try
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
            catch
            {
                return null;
            }

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
            Response.Redirect("AuctionAssessment.aspx");
        }

        protected void btnAppraisalServiceOrderForm_Click(object sender, EventArgs e)
        {
            //change this when form is created
            Response.Redirect("Appraisal.aspx");
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

        protected void addInventory_Click(object sender, ImageClickEventArgs e)
        {
            //adds styling to elements 
            btnCancelInventory.Visible = true;
            btnNewInventory.Visible = true;
            txtItem.Attributes.CssStyle.Add("margin-left", "70px");
            txtItem.Visible = true;
            txtCost.Visible = true;
        }

        protected void btnNewInventory_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString.ToString());
                sc.Open();

                System.Data.SqlClient.SqlCommand addItem = new System.Data.SqlClient.SqlCommand();
                addItem.Connection = sc;
                // INSERT INTO Note TABLE
                addItem.CommandText = "INSERT INTO dbo.INVENTORY (inventoryDescription, inventoryCost, serviceID) VALUES (@itemDesc, @itemCost, @serviceID)";
                addItem.Parameters.Add(new SqlParameter("@itemDesc", HttpUtility.HtmlEncode(txtItem.Text)));
                addItem.Parameters.Add(new SqlParameter("@itemCost", HttpUtility.HtmlEncode(txtCost.Text)));
                addItem.Parameters.Add(new SqlParameter("@serviceID", Session["serviceID"]));
                addItem.ExecuteNonQuery();
                sc.Close();
                Response.Redirect("AuctionDetails.aspx");
                txtItem.Visible = false;
                txtCost.Visible = false;
                btnNewInventory.Visible = false;
                btnCancelInventory.Visible = false;
            }
            catch
            {
                Response.Redirect("AuctionDetails.aspx");
            }
        }
        protected void btnCancelInventory_Click(object sender, ImageClickEventArgs e)
        {
            txtItem.Text = null;
            txtCost.Text = null;
            txtItem.Visible = false;
            txtCost.Visible = false;
            addInventory.Attributes.CssStyle.Add("display", "block");
            btnNewInventory.Attributes.CssStyle.Add("display", "none");
            btnCancelInventory.Visible = false;
        }

        protected void addEmp_Click(object sender, ImageClickEventArgs e)
        {
            //adds styling to elements 
            btnNewEmp.Visible = true;
            btnCancelEmp.Visible = true;
            ddlEmp.Visible = true;
        }

        protected void btnCancelEmp_Click(object sender, ImageClickEventArgs e)
        {
            btnNewEmp.Visible = false;
            btnCancelEmp.Visible = false;
            ddlEmp.Visible = false;
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
            Response.Redirect("AuctionDetails.aspx");

            btnNewEmp.Visible = false;
        }

        protected void addVehicle_Click(object sender, ImageClickEventArgs e)
        {
            //adds styling to elements 
            btnNewVehicle.Visible = true;
            btnCancelVehicle.Visible = true;
            ddlVehicles.Visible = true;
        }

        protected void btnCancelVehicle_Click(object sender, ImageClickEventArgs e)
        {
            btnNewVehicle.Visible = false;
            btnCancelVehicle.Visible = false;
            ddlVehicles.Visible = false;
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
            Response.Redirect("AuctionDetails.aspx");

            btnNewEmp.Visible = false;
        }


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
                Response.Redirect("AuctionDetails.aspx");
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            divPopUp.Attributes.CssStyle.Add("display", "block");
        }

        protected void btnExit_Click(object sender, EventArgs e)
        {
            divPopUp.Attributes.CssStyle.Add("display", "none");
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

        //            Response.Redirect("AuctionDetails.aspx");
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

        //            Response.Redirect("AuctionDetails.aspx");
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

        //protected void datasrcDocuments_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        //{
        //    File.Delete(Session["deletedFilePath"].ToString());

        //}


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
        //protected void imageEnlarge_Click(object sender, ImageClickEventArgs e)
        //{
        //    ImageButton button = sender as ImageButton;
        //    //DeleteUserById(Convert.ToInt32(button.CommandArgument));
        //}
        protected void btnCollapse_Click(object sender, ImageClickEventArgs e)
        {
            Panel1.Attributes.CssStyle.Add("display", "none");
            btnAuctionAssessmentForm.Visible = false;
            btnAppraisalServiceOrderForm.Visible = false;
            btnAuctionServiceOrder.Visible = false;
            forms.Visible = false;
            ImageButton1.Visible = true;
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

        protected void grdImages_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "view")
            {
                //holds the index of the selected row 
                String rowIndex = e.CommandArgument.ToString();

                int length = rowIndex.Length;
                String file = rowIndex.Substring(15, length - 15);
                //lblHelp.Text = file;

                Response.Write("<script>");
                Response.Write("window.open('CustomerFiles/" + file + "', '_newtab');");
                Response.Write("</script>");
            }


            if (e.CommandName == "Delete")
            {
                String rowIndex = e.CommandArgument.ToString();
                string filePath = Server.MapPath("./") + rowIndex;

                Session["deletedImagePath"] = filePath;

            }

        }

        protected void lbtnToCustomerFile_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerFile.aspx");
        }

        protected void btnCompletionForm_Click(object sender, EventArgs e)
        {
            Response.Redirect("ServiceCompletionForm.aspx");
        }
    }

}


