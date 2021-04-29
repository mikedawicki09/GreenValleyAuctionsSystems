using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;



namespace GreenValleyAuctionsSystem
{
    public partial class ServiceRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected string getCustomerID(object sender, EventArgs e)
        {
            string custID;

            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString);

            System.Data.SqlClient.SqlCommand getCustomerID = new System.Data.SqlClient.SqlCommand();

            con.Open();
            getCustomerID.Connection = con;

            getCustomerID.CommandText = "SELECT customerID from CUSTOMER where emailAddress = '" + Session["CustomerUsername"] + "';";

            SqlDataReader reader = getCustomerID.ExecuteReader();
            reader.Read();
            custID = reader["customerID"].ToString();
            con.Close();

            return custID;
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            string serviceType = HttpUtility.HtmlEncode(ddlServiceType.Text);
            string requestDescription = HttpUtility.HtmlEncode(txtRequestDescription.Text);
            //string dateTime = DateTime.Now.ToString("h:mm:ss tt") + " " + DateTime.Today.ToString("mm/dd/yyyy");
            string requestBoolean = "0";
            // Get customerID using emailAddress, maybe use first and last name
            string customerID = getCustomerID(sender, e);
            string deadlineDate = HttpUtility.HtmlEncode(txtDeadlineDate.Text);

            if (ddlServiceType.SelectedValue != "")
            {

                // Code Chunk to Attain CustomerID from Customer
                SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString);

                System.Data.SqlClient.SqlCommand createRequest = new System.Data.SqlClient.SqlCommand();

                con.Open();
                createRequest.Connection = con;

                createRequest.CommandText = "INSERT INTO dbo.SERVICEREQUEST (serviceType, deadlineDate,requestTimeDate, requestDescription, requestSeen, customerID) VALUES(@ServiceType, @DeadlineDate, GETDATE(), @RequestDescription, @RequestSeen, @CustomerID)";

                createRequest.Parameters.Add(new SqlParameter("@ServiceType", serviceType));
                createRequest.Parameters.Add(new SqlParameter("@DeadlineDate", deadlineDate));
                //createRequest.Parameters.Add(new SqlParameter("@TimeDate", dateTime));
                createRequest.Parameters.Add(new SqlParameter("@RequestDescription", requestDescription));
                createRequest.Parameters.Add(new SqlParameter("@RequestSeen", requestBoolean));
                createRequest.Parameters.Add(new SqlParameter("@customerID", customerID));

                createRequest.ExecuteNonQuery();
                con.Close();

                Response.Redirect("CustomerPortal.aspx");



            }



        }
    }
}

