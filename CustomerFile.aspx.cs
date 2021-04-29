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
using System.Web.UI.HtmlControls;

namespace GreenValleyAuctionsSystem
{
    public partial class CustomerFile : System.Web.UI.Page
    {
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

                String sqlQuery = "SELECT CUSTOMER.firstName, CUSTOMER.lastName, CUSTOMER.emailAddress, CUSTOMER.phoneNumber, CUSTOMER.streetAddress + ' ' + CUSTOMER.city + ', ' + CUSTOMER.state + ' ' + CUSTOMER.zipcode AS 'Address' FROM dbo.CUSTOMER";
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
                Session["CustomerName"] = fName + " " + lName;
                lblTitle.Text = "Customer File for " + fName + " " + lName;
            }

            //add the progress bar to the MOVINGSERVICE gridview
            int numOfRowsMoving = (Int32.Parse(grdvwMovingService.Rows.Count.ToString()));
            if (numOfRowsMoving == 0)
            {
                lblProgressTitleM.Visible = false;
            }
            for (int i = 0; i < numOfRowsMoving; i++)
            {
                TableRow newMoveRow = new TableRow();
                newMoveRow.Height = Unit.Pixel(50);
                newMoveRow.Width = Unit.Pixel(80);
                if (i % 2 == 0)
                {
                    newMoveRow.BackColor = ColorTranslator.FromHtml("#f1f8f7");
                }
                tblBarMoving.Controls.Add(newMoveRow);

                TableCell barCellMove = new TableCell();
                TableCell percentCellMove = new TableCell();

                HtmlGenericControl divA = new HtmlGenericControl("div");
                barCellMove.Controls.Add(divA);
                divA.Attributes.Add("class", "row");

                HtmlGenericControl divB = new HtmlGenericControl("div");
                divA.Controls.Add(divB);
                divB.Attributes.Add("class", "col-lg-12");

                HtmlGenericControl divC = new HtmlGenericControl("div");
                divB.Controls.Add(divC);
                divC.Attributes.Add("class", "progress");

                HtmlGenericControl divprogress = new HtmlGenericControl("div");
                divC.Controls.Add(divprogress);
                divprogress.Attributes.Add("class", "progress-bar");



                string status = grdvwMovingService.Rows[i].Cells[5].Text;
                int steps = 6; //number of steps in progress bar (easily change this if we add or take away steps)
                double progress = 100 / steps;
                switch (status)
                {
                    case "Schedule Assessment":
                        progress = (progress) * 1;
                        divprogress.Attributes.CssStyle.Add("width", progress + "%");
                        percentCellMove.Text = progress + "%";
                        break;
                    case "Present Estimate":
                        progress = (progress) * 2;
                        divprogress.Attributes.CssStyle.Add("width", progress + "%");
                        percentCellMove.Text = progress + "%";
                        break;
                    case "Estimate Accepted":
                        progress = (progress) * 3;
                        divprogress.Attributes.CssStyle.Add("width", progress + "%");
                        percentCellMove.Text = progress + "%";
                        break;
                    case "Schedule Move":
                        progress = (progress) * 4;
                        divprogress.Attributes.CssStyle.Add("width", progress + "%");
                        percentCellMove.Text = progress + "%";
                        break;
                    case "Move Completed":
                        progress = (progress) * 5;
                        divprogress.Attributes.CssStyle.Add("width", progress + "%");
                        percentCellMove.Text = progress + "%";
                        break;
                    case "Review Completed":
                        progress = (progress) * 6;
                        divprogress.Attributes.CssStyle.Add("width", progress + "%");
                        percentCellMove.Text = progress + "%";
                        break;

                }
                newMoveRow.Controls.Add(barCellMove);
                newMoveRow.Controls.Add(percentCellMove);
            }
            //add the progress bar to the AUCTIONSERVICE gridview
            int numOfRows = (Int32.Parse((grdvwAuctionService.Rows.Count.ToString())));
            if (numOfRows == 0)
            {
                lblProgressTitleA.Visible = false;
            }
            for (int j = 0; j < numOfRows; j++)
            {
                TableRow newRow = new TableRow();
                newRow.Height = Unit.Pixel(50);
                newRow.Width = Unit.Pixel(80);
                if (j % 2 == 0)
                {
                    newRow.BackColor = ColorTranslator.FromHtml("#f1f8f7");
                }
                tblBarAuction.Controls.Add(newRow);

                TableCell barCell = new TableCell();
                TableCell percentCell = new TableCell();

                HtmlGenericControl div1 = new HtmlGenericControl("div");
                barCell.Controls.Add(div1);
                div1.Attributes.Add("class", "row");

                HtmlGenericControl div2 = new HtmlGenericControl("div");
                div1.Controls.Add(div2);
                div2.Attributes.Add("class", "col-lg-12");

                HtmlGenericControl div3 = new HtmlGenericControl("div");
                div2.Controls.Add(div3);
                div3.Attributes.Add("class", "progress");

                HtmlGenericControl divprogress1 = new HtmlGenericControl("div");
                div3.Controls.Add(divprogress1);
                divprogress1.Attributes.Add("class", "progress-bar");


                string status2 = grdvwAuctionService.Rows[j].Cells[5].Text;
                int steps2 = 7; //number of steps in progress bar (easily change this if we add or take away steps)
                double progress2 = 100 / steps2;
                switch (status2)
                {
                    case "Schedule Assessment":
                        progress2 = (progress2) * 1;
                        divprogress1.Attributes.CssStyle.Add("width", progress2 + "%");
                        percentCell.Text = progress2 + "%";
                        break;
                    case "Present Proposal":
                        progress2 = (progress2) * 2;
                        divprogress1.Attributes.CssStyle.Add("width", progress2 + "%");
                        percentCell.Text = progress2 + "%";
                        break;
                    case "Proposal Accepted":
                        progress2 = (progress2) * 3;
                        divprogress1.Attributes.CssStyle.Add("width", progress2 + "%");
                        percentCell.Text = progress2 + "%";
                        break;
                    case "Schedule Add On Services":
                        progress2 = (progress2) * 4;
                        divprogress1.Attributes.CssStyle.Add("width", progress2 + "%");
                        percentCell.Text = progress2 + "%";
                        break;
                    case "Schedule Auction":
                        progress2 = (progress2) * 5;
                        divprogress1.Attributes.CssStyle.Add("width", progress2 + "%");
                        percentCell.Text = progress2 + "%";
                        break;
                    case "Auction Completed":
                        progress2 = (progress2) * 6;
                        divprogress1.Attributes.CssStyle.Add("width", progress2 + "%");
                        percentCell.Text = progress2 + "%";
                        break;
                    case "Review Completed":
                        progress2 = (progress2) * 7;
                        divprogress1.Attributes.CssStyle.Add("width", progress2 + "%");
                        percentCell.Text = progress2 + "%";
                        break;
                }

                newRow.Controls.Add(barCell);
                newRow.Controls.Add(percentCell);

            }

        }



        protected void grdvwAuctionService_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void grdvwInventory_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void btnMoveServiceOrderForm_Click(object sender, EventArgs e)
        {
            DetailsViewRow row = dvCustomerInfo.Rows[0];
            Session["customerID"] = row.Cells[1].Text;

            Response.Redirect("MoveForm.aspx");
        }

        protected void grdvwMovingService_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //checks 
            if (e.CommandName == "view")
            {
                //holds the index of the selected row 
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = grdvwMovingService.Rows[rowIndex];

                //places the customer information into session variables 
                Session["customerID"] = row.Cells[0].Text;
                Session["serviceID"] = row.Cells[1].Text;
                Session["serviceName"] = row.Cells[2].Text;

                Response.Redirect("MovingDetails.aspx");
            }
            //lblTest.Text = Session["serviceID"].ToString();
        }

        protected void grdvwAuctionService_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            ////checks 
            if (e.CommandName.Equals("view"))
            {
                //holds the index of the selected row 
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = grdvwAuctionService.Rows[rowIndex];

                //places the customer information into session variables 
                Session["customerID"] = row.Cells[0].Text;
                Session["serviceID"] = row.Cells[1].Text;
                Session["serviceName"] = row.Cells[2].Text;

                Response.Redirect("AuctionDetails.aspx");
            }
            //lblTest.Text = Session["serviceID"].ToString();
        }

        protected void submitNote_Click(object sender, EventArgs e)
        {
            int customerID = int.Parse(Session["customerID"].ToString());
            //Define connection to database 
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString);


            //create sql command object which will send the query
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = "INSERT INTO CUSTOMERNOTE(noteTitle, noteBody, customerID) VALUES(@NoteTitle, @NoteBody, @CustomerID)";

            sqlCommand.Parameters.Add(new SqlParameter("@NoteTitle", HttpUtility.HtmlEncode(txtTitle2.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@NoteBody", HttpUtility.HtmlEncode(txtBody.Text)));
            sqlCommand.Parameters.Add(new SqlParameter("@CustomerID", HttpUtility.HtmlEncode(customerID)));


            //open connection
            sqlConnect.Open();

            //send query
            SqlDataReader queryResults = sqlCommand.ExecuteReader();
            //close connections
            queryResults.Close();
            sqlConnect.Close();
            Response.Redirect("CustomerFile.aspx");
        }

        protected void btnMoveAssessment_Click(object sender, EventArgs e)
        {
            Response.Redirect("MoveForm.aspx");
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

        protected int getStorage(string location)
        {
            String sqlQuery = "SELECT STORAGE.storageID FROM STORAGE WHERE STORAGE.storageLocation = '" + @location + "'";

            //connect to database
            System.Data.SqlClient.SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString.ToString());

            //create sql command object and send query 
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;
            sqlConnect.Open();

            DataSet storageLocation = new DataSet();
            sqlAdapter.Fill(storageLocation);
            String storageIDstr = storageLocation.Tables[0].Rows[0][0].ToString();

            int storageID = int.Parse(storageIDstr);

            sqlConnect.Close();
            return storageID;
        }


        protected void btnSubmitStorage_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString);

            //string numberItems = HttpUtility.HtmlEncode(txtNumberItems.Text);
            string itemLocation = HttpUtility.HtmlEncode(ddlStorageArea.Text);

            try
            {
                if (ddlStorageArea.SelectedValue != null)
                {
                    System.Data.SqlClient.SqlCommand createStorageSpace = new System.Data.SqlClient.SqlCommand();

                    con.Open();

                    createStorageSpace.Connection = con;
                    createStorageSpace.CommandText = "INSERT INTO dbo.STORAGESERVICE (storageID, customerID) VALUES(@storageID, @customerID)";

                    //createStorageSpace.Parameters.Add(new SqlParameter("@NumberOfItems", numberItems));
                    createStorageSpace.Parameters.Add(new SqlParameter("@storageID", getStorage(itemLocation)));
                    createStorageSpace.Parameters.Add(new SqlParameter("@customerID", Session["customerID"]));

                    createStorageSpace.ExecuteNonQuery();
                    con.Close();

                    lblSuccess.Text = "SUCCESS: Storage Allocated";

                }

            }
            catch
            {
                lblSuccess.Text = "Database Error";
            }
            Response.Redirect("CustomerFile.aspx");

        }
    }
}












