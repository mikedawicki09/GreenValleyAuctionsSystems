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
    public partial class InitialContactNewCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnExistingCustomer_Click(object sender, EventArgs e)
        {
            Response.Redirect("InitialContactExistingCustomer.aspx");

        }

        protected void btnNewCustomer_Click(object sender, EventArgs e)
        {
            Response.Redirect("InitialContactNewCustomer.aspx");
        }
        protected void btnAnotherItem_Click(object sender, EventArgs e)
        {
            {
                if (txtbxItemName.Text != "" & txtbxAddress.Text != "" & txtbxPickupCity.Text != "" & txtbxPickupState.Text != "" & txtbxPickupZipCode.Text != "")
                {
                    lblAddInventoryWarning.ForeColor = Color.Green;
                    lblAddInventoryWarning.Font.Bold = false;
                    lblAddInventoryWarning.Text = "Object Added";
                    lbInventory.Items.Add(txtbxItemName.Text);
                    lblDisplayNumOfItems.Text = lbInventory.Items.Count.ToString();
                    txtbxItemName.Text = "";
                }
                else
                {
                    lblAddInventoryWarning.ForeColor = Color.Red;
                    lblAddInventoryWarning.Font.Bold = true;
                    lblAddInventoryWarning.Text = "Please fill out all item forms before adding a new item";
                }
            }
        }

        protected void cbxAuction_CheckedChanged(object sender, EventArgs e)
        {
            if (cbxAuction.Checked)
            {
                Table2.Visible = true;
                moreInvTable.Visible = true;

            }
            else
            {
                Table2.Visible = false;
                moreInvTable.Visible = false;
            }
        }

        protected void cbxMove_CheckedChanged(object sender, EventArgs e)
        {
            if (cbxMove.Checked)
            {
                Table3.Visible = true;
                txtbxCurrentStreet.Text = txtbxCustomerStreet.Text;
                txtbxCurrentCity.Text = txtbxCustomerCity.Text;
                txtbxCurrentState.Text = txtbxCustomerState.Text;
                txtbxCurrentZipCode.Text = txtbxCustomerZipCode.Text;
            }
            else
            {
                Table3.Visible = false;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

            string saveNewCustomer = "";
            saveNewCustomer = "INSERT INTO CUSTOMER(firstName, lastName, initialContact, discoveredFrom, emailAddress, streetAddress, city, state, zipcode, phoneNumber, phoneType) " +
                "VALUES('" + txtbxFName.Text + "', '" + txtbxLName.Text + "', '" + txtbxMethodOfContact.Text + "', '" + txtbxHowTheyHeard.Text + "', '" + txtbxEmail.Text + "', '" +
                txtbxCustomerStreet.Text + "', '" + txtbxCustomerCity.Text + "', '" +
                txtbxCustomerState.Text + "', '" + txtbxCustomerZipCode.Text + "', '" + txtbxPhoneNumber.Text + "', '" + ddlPhoneType.SelectedValue.ToString() + "')";

            //Define connection to database 
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString);


            //create sql command object which will send the query
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = saveNewCustomer;


            //open connection
            sqlConnect.Open();

            //send query
            SqlDataReader queryResults = sqlCommand.ExecuteReader();
            //close connections
            queryResults.Close();
            sqlConnect.Close();

            int customerID = getCustomerID();

            if (cbxAuction.Checked)
            {
                saveAuctionRequest(customerID);
            }
            if (cbxMove.Checked)
            {
                saveMoveRequest(customerID);
            }

            lblConfirmation.Visible = true;
            lblConfirmation.Text = "Service Request(s) Saved!";
            lblConfirmation.ForeColor = Color.Green;

        }
        protected int getCustomerID()
        {
            String customerIDQuery = "Select customerID from CUSTOMER WHERE (firstName + ' ' + lastName) = '" + (txtbxFName.Text + ' ' + txtbxLName.Text) + "';";
            String customerID = "";
            int custIdNumber;
            SqlConnection sqlConnect1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString);
            SqlCommand getCustomerIDCommand = new SqlCommand();
            getCustomerIDCommand.CommandType = CommandType.Text;
            getCustomerIDCommand.CommandText = customerIDQuery;
            getCustomerIDCommand.Connection = sqlConnect1;


            sqlConnect1.Open();
            SqlDataReader getCustomerIDReader = getCustomerIDCommand.ExecuteReader();
            while (getCustomerIDReader.Read())
            {
                customerID = getCustomerIDReader["customerID"].ToString();

            }
            custIdNumber = Int32.Parse(customerID);
            sqlConnect1.Close();
            sqlConnect1.Dispose();
            return custIdNumber;

        }
        protected void saveAuctionRequest(int customerID)
        {
            String inventoryList = "";
            foreach (object i in lbInventory.Items)
            {
                inventoryList += i.ToString() + ", ";
            }

            String insertAuctionRequestQuery = "INSERT into SERVICEREQUEST(serviceType, deadlineDate, auctionReasonForSelling, auctionNumberOfItems, auctionItemName, pickupStreetAddress," +
                "pickupCity, pickupState, pickupZipcode, requestTimeDate, requestDescription, requestSeen, customerID) VALUES('Auction', '" + txtbxDeadlineDate.Text + "', '" + txtbxReason.Text + "', '" + lblDisplayNumOfItems.Text + "', '" + inventoryList
                + "', '" + txtbxAddress.Text + "', '" + txtbxPickupCity.Text + "', '" + txtbxPickupState.Text + "', '" + txtbxPickupZipCode.Text + "', '" + DateTime.Now + "', 'Auction Request', 0, '" + customerID + "')";

            SqlConnection sqlConnect2 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString);
            SqlCommand insertAuctionRequest = new SqlCommand();
            insertAuctionRequest.CommandType = CommandType.Text;
            insertAuctionRequest.CommandText = insertAuctionRequestQuery;
            insertAuctionRequest.Connection = sqlConnect2;

            //open connection
            sqlConnect2.Open();

            //send query
            SqlDataReader queryResults = insertAuctionRequest.ExecuteReader();
            //close connections
            queryResults.Close();
            sqlConnect2.Close();
        }
        protected void saveMoveRequest(int customerID)
        {
            String insertMoveRequestQuery = "INSERT into SERVICEREQUEST(serviceType, deadlineDate, moveOriginStreet, moveOriginCity, moveOriginState, moveOriginZipcode," +
                "moveDestinationStreet, moveDestinationCity, moveDestinationState, moveDestinationZipcode, requestTimeDate, requestDescription, requestSeen, customerID) VALUES('Move', '" + txtbxDeadlineDate.Text + "', '" + txtbxCurrentStreet.Text + "', '" + txtbxCurrentCity.Text + "', '" + txtbxCurrentState.Text
                + "', '" + txtbxCurrentZipCode.Text + "', '" + txtbxDestinationStreet.Text + "', '" + txtbxDestinationCity.Text + "', '" + txtbxDestinationState.Text + "', '" + txtbxDestinationZipCode.Text + "', '" + DateTime.Now + "', 'Move Request', 0, '" + customerID + "')";

            SqlConnection sqlConnect3 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString);
            SqlCommand insertMoveRequest = new SqlCommand();
            insertMoveRequest.CommandType = CommandType.Text;
            insertMoveRequest.CommandText = insertMoveRequestQuery;
            insertMoveRequest.Connection = sqlConnect3;

            //open connection
            sqlConnect3.Open();

            //send query
            SqlDataReader queryResults = insertMoveRequest.ExecuteReader();
            //close connections
            queryResults.Close();
            sqlConnect3.Close();
        }
    }
}


