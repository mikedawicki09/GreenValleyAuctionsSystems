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

namespace GreenValleyAuctionsSystems
{
    public partial class ManageEquipment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // if the employee that is logged in is NOT admin (Elizabeth or Greg) ... redirect to dashboard
            // need-to-know information basis

            if (Session["Username"].ToString() != "admin")
            {
                Response.Redirect("EmployeeDashboard.aspx");
            }
        }

        protected void addEuipment_Click(object sender, ImageClickEventArgs e)
        {

            btnNewEquipment.Attributes.CssStyle.Add("display", "block");
            btnCancelEquipment.Visible = true;

            txtDescription.Visible = true;
            txtPurchaseCost.Visible = true;
            txtPurchaseDate.Visible = true;

        }

        protected void btnNewEquipment_Click(object sender, ImageClickEventArgs e)
        {

            try
            {
                System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString.ToString());
                sc.Open();

                System.Data.SqlClient.SqlCommand addEquipment = new System.Data.SqlClient.SqlCommand();
                addEquipment.Connection = sc;

                // INSERT INTO Table
                addEquipment.CommandText = "INSERT INTO dbo.EQUIPMENT (description, purchaseCost, purchaseDate) VALUES (@Description, @PurchaseCost, @PurchaseDate)";

                addEquipment.Parameters.Add(new SqlParameter("@Description", HttpUtility.HtmlEncode(txtDescription.Text)));
                addEquipment.Parameters.Add(new SqlParameter("@PurchaseCost", HttpUtility.HtmlEncode(txtPurchaseCost.Text)));
                addEquipment.Parameters.Add(new SqlParameter("@PurchaseDate", HttpUtility.HtmlEncode(txtPurchaseDate.Text)));

                addEquipment.ExecuteNonQuery();

                sc.Close();

                Response.Redirect("ManageEquipment.aspx");

                txtDescription.Visible = false;
                txtPurchaseCost.Visible = false;
                txtPurchaseDate.Visible = false;
            }
            catch
            {
                Response.Redirect("ManageEquipment.aspx");
            }

        }

        protected void btnCancelEquipment_Click(object sender, ImageClickEventArgs e)
        {

            txtDescription.Text = null;
            txtPurchaseCost.Text = null;
            txtPurchaseDate.Text = null;

            txtDescription.Visible = false;
            txtPurchaseCost.Visible = false;
            txtPurchaseDate.Visible = false;

            addEuipment.Attributes.CssStyle.Add("display", "block");
            btnNewEquipment.Attributes.CssStyle.Add("display", "none");
            btnCancelEquipment.Visible = false;

        }



        protected DataTable sqlConnection(String sqlQuery)
        {
            try
            {
                //creates connection object with the database 
                SqlConnection sqlConnect = new SqlConnection("Server=greenvalleyauctions.cn5mwe8nhtvg.us-east-1.rds.amazonaws.com;Database=Lab4;uid=DukeDevs;password=Capstone1!;Trusted_Connection=Yes;Integrated Security=false;");

                SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString.ToString());

                //create sql command object and send query 
                SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, connection);
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = connection;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = sqlQuery;

                connection.Open();
                //data set to hold the max id  
                DataTable inventoryDS = new DataTable();
                sqlAdapter.Fill(inventoryDS);

                connection.Close();

                return inventoryDS;

            }
            catch
            {
                lblResponse.Text = "Database Error: Please try again.";
                return null;
            }
        }

        protected void datasrcEquipment_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            try
            {
                String equipmentID = Session["equipmentID"].ToString();
                String sqlQuery = "SELECT equipmentID FROM dbo.EQUIPMENT WHERE equipmentID = '" + equipmentID + "'";
                DataTable equipment = sqlConnection(sqlQuery);
                String ID = equipment.Rows[0][0].ToString();

                // SqlCommand Chunk to DELETE EQUIPMENT from EQUIPMENT
                System.Data.SqlClient.SqlCommand deleteEquip = new System.Data.SqlClient.SqlCommand();
                SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString.ToString());

                con.Open();

                deleteEquip.Connection = con;

                deleteEquip.CommandText = "DELETE FROM EQUIPMENT WHERE equipmentID = '" + ID + "'";

                deleteEquip.ExecuteNonQuery();

                con.Close();

                Response.Redirect("ManageEquipment.aspx");
            }
            catch
            {
                lblResponse.Text = "Database Error: Please try again.";
            }
        }

        protected void grdvwEquipmentTable_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                Session["equipmentID"] = e.CommandArgument.ToString();
            }
        }
    }
}



