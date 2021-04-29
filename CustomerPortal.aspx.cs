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
    public partial class CustomerPortal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["customerName"] == null)
            {
                Response.Redirect("Home.aspx");
            }
            else
            {
                Session["customerID"] = getCustomerID();
            }

        }
        protected int getCustomerID()
        {
            String username = Session["CustomerUsername"].ToString();

            String customerIDQuery = "Select customerID from CUSTOMER WHERE emailAddress = '" + username + "';";
            string custID = "";
            int customerID;
            SqlConnection sqlConnect1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString);
            SqlCommand getCustomerIDCommand = new SqlCommand();
            getCustomerIDCommand.CommandType = CommandType.Text;
            getCustomerIDCommand.CommandText = customerIDQuery;
            getCustomerIDCommand.Connection = sqlConnect1;


            sqlConnect1.Open();
            SqlDataReader getCustomerIDReader = getCustomerIDCommand.ExecuteReader();
            while (getCustomerIDReader.Read())
            {
                custID = getCustomerIDReader["customerID"].ToString();
            }
            customerID = Int32.Parse(custID);
            //txtbxMoveDeadlineDate.Text = deadlineDate;
            sqlConnect1.Close();
            sqlConnect1.Dispose();
            return customerID;

        }


        protected void grdvwActiveServices_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //checks 
            if (e.CommandName == "uploadFiles")
            {
                //holds the index of the selected row 
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = grdvwActiveServices.Rows[rowIndex];

                //places the customer information into session variables 
                Session["serviceID"] = row.Cells[0].Text;
                Response.Redirect("UploadFiles.aspx");
            }
        }
    }
}

