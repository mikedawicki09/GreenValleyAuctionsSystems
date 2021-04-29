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
using System.Windows.Input;
using System.Windows.Markup;
using System.Text;
using System.Configuration;

namespace GreenValleyAuctionsSystem
{
    public partial class EmployeeDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblWelcome.Text = "Welcome, " + Session["Username"] + "!";
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }

        //redirects the user to a new page to display the ticket's information 

        protected void grdVwServiceRequest_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            DateTime currentDate = DateTime.Now;
            //DateTime threeDaysAhead = DateTime.Now.AddDays(3);

            if (e.Row.RowIndex >= 0)
            {
                DateTime daysBetween = (DateTime.Parse(e.Row.Cells[4].Text));
                DateTime refDate = daysBetween.AddDays(3);

                if (refDate < currentDate)
                {
                    e.Row.Cells[5].Font.Bold = true;
                    e.Row.Cells[5].ForeColor = Color.Red;

                }
                else if (DateTime.Parse(e.Row.Cells[4].Text) > currentDate)
                {
                    e.Row.Cells[5].Font.Italic = true;
                    e.Row.Cells[5].Text = "Future date";

                }
                else
                {
                    e.Row.Cells[5].Font.Bold = true;
                }

            }
        }
        protected void grdvwCustomerTable_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //checks 
            if (e.CommandName == "view")
            {
                //holds the index of the selected row 
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = grdvwCustomerTable.Rows[rowIndex];

                //places the customer information into session variables 
                Session["customerID"] = row.Cells[0].Text;
                Session["FirstName"] = row.Cells[1].Text;
                Session["LastName"] = row.Cells[2].Text;

                //redirects user to customer file page
                Response.Redirect("CustomerFile.aspx");

            }
        }
        protected void btnSearchCustomer_Click(object sender, EventArgs e)
        {
            grdvwCustomerTable.Attributes.Add("class", "hiddenfalse");
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

        protected void grdvwServiceRequestNew_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            DateTime currentDate = DateTime.Now;

            if (e.Row.RowIndex >= 0)
            {
                DateTime daysBetween = (DateTime.Parse(e.Row.Cells[4].Text));
                DateTime refDate = daysBetween.AddDays(3);

                if (refDate < currentDate)
                {
                    e.Row.Cells[5].Font.Bold = true;
                    e.Row.Cells[5].ForeColor = Color.Red;
                }
                else if (DateTime.Parse(e.Row.Cells[4].Text) > currentDate)
                {
                    e.Row.Cells[5].Font.Italic = true;
                    e.Row.Cells[5].Text = "Future date";

                }
                else
                {
                    e.Row.Cells[5].Font.Bold = true;
                }
            }
        }

        protected void grdvwServiceRequestNew_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //checks to see if the command name is schedule 
            if (e.CommandName == "view")
            {
                //Determine the RowIndex of the Row whose Button was clicked.
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                //Reference the GridView Row.
                GridViewRow row = grdvwServiceRequestNew.Rows[rowIndex];

                //creates session variables for service type and service request id 
                Session["customerID"] = row.Cells[0].Text;
                Session["serviceID"] = row.Cells[1].Text;
                Session["customerName"] = row.Cells[2].Text;
                Session["serviceName"] = row.Cells[3].Text;

                //checks the selected customers service type 
                if (Session["serviceName"].ToString() == "Auction")
                {
                    Response.Redirect("AuctionDetails.aspx");
                }
                else
                {
                    Response.Redirect("MovingDetails.aspx");
                }
            }
        }


        protected void chkbxComplete_CheckedChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in grdvwToDoVeryUrgent.Rows)
            {
                //find the checkbox
                CheckBox completeCheckBox = row.FindControl("chkbxComplete") as CheckBox;
                if (completeCheckBox.Checked)
                {
                    int toDoID = int.Parse(row.Cells[0].Text);
                    System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString.ToString());
                    try
                    {
                        //Update record in SERVICE
                        sc.Open();
                        System.Data.SqlClient.SqlCommand updateToDo = new System.Data.SqlClient.SqlCommand();
                        updateToDo.Connection = sc;
                        updateToDo.CommandText = "UPDATE TODO SET complete = @complete WHERE toDoID = @toDoID;";
                        updateToDo.Parameters.Add(new SqlParameter("@complete", HttpUtility.HtmlEncode('1')));
                        updateToDo.Parameters.Add(new SqlParameter("@toDoID", HttpUtility.HtmlEncode(toDoID)));
                        updateToDo.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }
                }
            }
            Response.Redirect("EmployeeDashboard.aspx");
        }
        protected void chkbxComplete2_CheckedChanged(object sender, EventArgs e)
        {
            //foreach (GridViewRow row in GridView1.Rows)
            //{
            //    //find the checkbox
            //    CheckBox completeCheckBox = row.FindControl("chkbxComplete2") as CheckBox;
            //    if (completeCheckBox.Checked)
            //    {
            //        int toDoID = int.Parse(row.Cells[0].Text);
            //        System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString.ToString());
            //        try
            //        {
            //            //Update record in SERVICE
            //            sc.Open();
            //            System.Data.SqlClient.SqlCommand updateToDo = new System.Data.SqlClient.SqlCommand();
            //            updateToDo.Connection = sc;
            //            updateToDo.CommandText = "UPDATE TODO SET complete = @complete WHERE toDoID = @toDoID;";
            //            updateToDo.Parameters.Add(new SqlParameter("@complete", HttpUtility.HtmlEncode('1')));
            //            updateToDo.Parameters.Add(new SqlParameter("@toDoID", HttpUtility.HtmlEncode(toDoID)));
            //            updateToDo.ExecuteNonQuery();
            //        }
            //        catch (Exception ex)
            //        {
            //            throw ex;
            //        }

            //    }

            //}
            //Response.Redirect("EmployeeDashboard.aspx");
        }

        protected void grdvwToDoVeryUrgent_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            DateTime currentDate = DateTime.Now;

            if (e.Row.RowIndex >= 0)
            {

                Label lblPriority = (Label)e.Row.FindControl("lblPriority");
                bool urgency = Convert.ToBoolean(e.Row.Cells[1].Text);
                //lblPriority.Text = urgency.ToString();
                if (urgency.Equals(true))
                {
                    lblPriority.Text = "Very Urgent";
                    lblPriority.Attributes.CssStyle.Add("Background-color", "#f57c7b");//red

                }
                else
                {
                    lblPriority.Text = "Urgent";
                    lblPriority.Attributes.CssStyle.Add("Background-color", "#A7BED6");//blue
                }

                //ImageButton imgbtnClock = (ImageButton)e.Row.FindControl("imgbtnClock");
                //imgbtnClock.ToolTip = "Test tooltip";
                //DateTime dueDate = (DateTime.Parse(e.Row.Cells[3].Text));

                //double daysBetween = (dueDate - currentDate).TotalDays;
                //int daysBetweenInt = Convert.ToInt32(daysBetween);

                //if (daysBetweenInt == 0)
                //{
                //    e.Row.Cells[4].Text = daysBetweenInt.ToString() + " days remaining";
                //    e.Row.BackColor = Color.FromName("#ffb0af"); //red
                //    imgbtnClock.Visible = true;
                //}
                //else if (daysBetweenInt == 1)
                //{
                //    e.Row.Cells[4].Text = daysBetweenInt.ToString() + " day remaining";
                //    e.Row.BackColor = Color.FromName("#ffb0af"); //red
                //    imgbtnClock.Visible = true;
                //}
                //else if (daysBetweenInt <= 3 && daysBetweenInt > 1)
                //{
                //    e.Row.Cells[4].Text = daysBetweenInt.ToString() + " days remaining";
                //    e.Row.BackColor = Color.FromName("#f7dfc5"); //orange
                //    imgbtnClock.Visible = true;
                //}

            }


        }
    }
}



