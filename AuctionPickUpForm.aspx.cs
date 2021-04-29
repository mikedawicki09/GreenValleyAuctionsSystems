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
    public partial class AuctionPickUpForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable datesDT;
            if (Session["requestID"] == null)
            {
                datesDT = checkDates();

                if (datesDT.Rows.Count == 0)
                {
                    lblDate.Text = "Confirm Action Dates: ";
                    lblPossibleDates.Text = "Possible Action Dates";
                    tblePossibleDates.Visible = true;
                    lblPossBring.Text = "Bring in Date: " + datesDT.Rows[0][0].ToString();
                    lblPossPick.Text = "Pick Up Date: " + datesDT.Rows[0][1].ToString();
                    lblPossLook.Text = "Look At Date: " + datesDT.Rows[0][2].ToString();
                    lblPossAppraisal.Text = "Appraisal Date: " + datesDT.Rows[0][3].ToString();
                    lblPossSales.Text = "Sales Date: " + datesDT.Rows[0][4].ToString();
                    lblPossStorage.Text = "Storage Location: " + datesDT.Rows[0][5].ToString();

                }
                else
                {
                    lblDate.Text = "Change Confirmed Action Dates: ";
                    lblPossibleDates.Text = "Confirmed Action Dates";
                    tblePossibleDates.Visible = true;
                    lblPossBring.Text = "Bring in Date: " + datesDT.Rows[0][0].ToString();
                    lblPossPick.Text = "Pick Up Date: " + datesDT.Rows[0][1].ToString();
                    lblPossLook.Text = "Look At Date: " + datesDT.Rows[0][2].ToString();
                    lblPossAppraisal.Text = "Appraisal Date: " + datesDT.Rows[0][3].ToString();
                    lblPossSales.Text = "Sales Date: " + datesDT.Rows[0][4].ToString();
                    lblPossStorage.Text = "Storage Location: " + datesDT.Rows[0][5].ToString();
                }
            }
            else if (Session["requestID"] != null)
            {
                datesDT = addDates();
                lblDate.Text = "Possible Action Dates: ";
            }
        }

        //method called when user clicks submit 
        protected void btnPossibleSubmit_Click(object sender, EventArgs e)
        {
          try
            {
            //creates connection with database 
            System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString.ToString());
            sc.Open();
            System.Data.SqlClient.SqlCommand addAuctionForm = new System.Data.SqlClient.SqlCommand();
            addAuctionForm.Connection = sc;

            if (Session["requestID"] == null)
            {
                addAuctionForm.CommandText = "UPDATE AUCTIONSERVICE SET bringDate = @bringDate, pickUpDate= @pickUpDate, lookAtDate = @lookAtDate, appraisalDate = @appraisalDate, saleDate = @saleDate, storageLocation = @storageLocation WHERE serviceID = @serviceID";
                addAuctionForm.Parameters.Add(new SqlParameter("@bringDate", txtBringIn.Text));
                addAuctionForm.Parameters.Add(new SqlParameter("@pickUpDate", txtPickUp.Text));
                addAuctionForm.Parameters.Add(new SqlParameter("@lookAtDate", txtLookAt.Text));
                addAuctionForm.Parameters.Add(new SqlParameter("@appraisalDate", txtAppraisal.Text));
                addAuctionForm.Parameters.Add(new SqlParameter("@saleDate", txtSales.Text));
                addAuctionForm.Parameters.Add(new SqlParameter("@storageLocation", txtStorage.Text));
                addAuctionForm.Parameters.Add(new SqlParameter("@serviceID", Session["serviceID"]));
                addAuctionForm.ExecuteNonQuery();
            } else if (Session["requestID"] != null)
            {
                addAuctionForm.CommandText = "UPDATE SERVICEREQUEST SET possBringDate = @possBring, possPickUpDate = @possPickUp, possLookAtDate = @possLookAt, possAppraisalDate = @possAppraisal, possSaleDate = @possSale, possStorageLocation = @possStorage WHERE requestID = @requestID";
                addAuctionForm.Parameters.Add(new SqlParameter("@possBring", txtBringIn.Text));
                addAuctionForm.Parameters.Add(new SqlParameter("@possPickUp", txtPickUp.Text));
                addAuctionForm.Parameters.Add(new SqlParameter("@possLookAt", txtLookAt.Text));
                addAuctionForm.Parameters.Add(new SqlParameter("@possAppraisal", txtAppraisal.Text));
                addAuctionForm.Parameters.Add(new SqlParameter("@possSale", txtSales.Text));
                addAuctionForm.Parameters.Add(new SqlParameter("@possStorage", txtStorage.Text));
                addAuctionForm.Parameters.Add(new SqlParameter("@requestID", Session["requestID"]));
                addAuctionForm.ExecuteNonQuery();
                }
                lblSuccess.Visible = true;
                lblSuccess.Text = "Auction Pick Up Form has been successfully Added!";
                lblSuccess.ForeColor = Color.Green;
            }
            catch
            {
                lblSuccess.Visible = true;
                lblSuccess.ForeColor = Color.Red;
                lblSuccess.Text = "Auction Pick up Form was not added.";
           }
        }

        protected DataTable checkDates()
        {
               String sqlQuery = "SELECT AUCTIONSERVICE.bringDate, AUCTIONSERVICE.pickUpDate, AUCTIONSERVICE.lookAtDate, AUCTIONSERVICE.appraisalDate, AUCTIONSERVICE.saleDate, AUCTIONSERVICE.storageLocation";
                sqlQuery += " FROM dbo.AUCTIONSERVICE, dbo.SERVICE";
                sqlQuery += " WHERE AUCTIONSERVICE.serviceID = SERVICE.serviceID AND SERVICE.serviceID = '" + Session["serviceID"].ToString() + "'";

            //creates connection object with the database 
            SqlConnection sqlConnect = new SqlConnection("Server=greenvalleyauctions.cn5mwe8nhtvg.us-east-1.rds.amazonaws.com;Database=Lab4; uid=DukeDevs;password=Capstone1!;Trusted_Connection=Yes;Integrated Security=false;");

            //create sql command object and send query 
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;

            sqlConnect.Open();
            //data set to hold the max id  
            DataTable datesDT = new DataTable();
            sqlAdapter.Fill(datesDT);

            return datesDT;
        }
        protected DataTable addDates()
        {
           String sqlQuery = "SELECT AUCTIONSERVICE.bringDate, AUCTIONSERVICE.pickUpDate, AUCTIONSERVICE.lookAtDate, AUCTIONSERVICE.appraisalDate, AUCTIONSERVICE.saleDate, AUCTIONSERVICE.storageLocation";
            sqlQuery += " FROM dbo.AUCTIONSERVICE, dbo.SERVICE, dbo.SERVICEREQUEST, dbo.CUSTOMER, dbo.SERVICETICKET";
            sqlQuery += " WHERE AUCTIONSERVICE.serviceID = SERVICE.serviceID AND SERVICEREQUEST.customerID = CUSTOMER.customerID AND CUSTOMER.customerID = SERVICETICKET.customerID AND SERVICETICKET.serviceID = SERVICE.serviceID AND SERVICEREQUEST.requestID = '" + Session["requestID"].ToString() + "'";

            //creates connection object with the database 
            SqlConnection sqlConnect = new SqlConnection("Server=greenvalleyauctions.cn5mwe8nhtvg.us-east-1.rds.amazonaws.com;Database=Lab4;Trusted_Connection=Yes;Integrated Security=false;");

            //create sql command object and send query 
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;

            sqlConnect.Open();
            //data set to hold the max id  
            DataTable datesDT = new DataTable();
            sqlAdapter.Fill(datesDT);

            return datesDT;
        }
     
    }
}








