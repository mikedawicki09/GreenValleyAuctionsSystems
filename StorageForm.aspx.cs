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

    public partial class StorageForm : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ddlCustomerList_SelectedIndexChanged(object sender, EventArgs e)
        {


        }

        protected void ddlStorageArea_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            string[] ddlStrings = ddlCustomerList.SelectedValue.Split(' ');

            Session["CustomerFirst"] = ddlStrings[0];
            Session["CustomerLast"] = ddlStrings[1];

            string customerID;

            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString);

            System.Data.SqlClient.SqlCommand getCustomerID = new System.Data.SqlClient.SqlCommand();

            con.Open();

            getCustomerID.Connection = con;
            getCustomerID.CommandText = "SELECT customerID from CUSTOMER where firstName = '" + Session["CustomerFirst"] + "' and lastName = '" + Session["CustomerLast"] + "';";

            SqlDataReader reader = getCustomerID.ExecuteReader();
            reader.Read();

            customerID = reader["customerID"].ToString();

            con.Close();

            string customerName = HttpUtility.HtmlEncode(ddlCustomerList.Text);
            string numberItems = HttpUtility.HtmlEncode(txtNumberItems.Text);
            string itemLocation = HttpUtility.HtmlEncode(ddlStorageArea.Text);

            try
            {
                if (ddlStorageArea.SelectedValue != null)
                {
                    System.Data.SqlClient.SqlCommand createStorageSpace = new System.Data.SqlClient.SqlCommand();

                    con.Open();

                    createStorageSpace.Connection = con;
                    createStorageSpace.CommandText = "INSERT INTO dbo.STORAGE (customerName, numberOfItems, storageLocation, customerID) VALUES(@CustomerName, @NumberOfItems, @StorageLocation, @CustomerID)";

                    createStorageSpace.Parameters.Add(new SqlParameter("@CustomerName", customerName));
                    createStorageSpace.Parameters.Add(new SqlParameter("@NumberOfItems", numberItems));
                    createStorageSpace.Parameters.Add(new SqlParameter("@StorageLocation", itemLocation));
                    createStorageSpace.Parameters.Add(new SqlParameter("@CustomerID", customerID));

                    createStorageSpace.ExecuteNonQuery();
                    con.Close();

                    lblSuccess.Text = "SUCCESS: Storage Allocated";

                }

            }
            catch
            {

            }

        }
    }
}

