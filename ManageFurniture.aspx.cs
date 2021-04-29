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
    public partial class ManageFurniture : System.Web.UI.Page
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

        protected void addFurniture_Click(object sender, ImageClickEventArgs e)
        {

            // Add styling to elements
            btnNewFurniture.Attributes.CssStyle.Add("display", "block");
            btnCancelFurniture.Visible = true;

            txtName.Visible = true;
            txtCubicUnit.Visible = true;

        }

        protected void btnNewFurniture_Click(object sender, ImageClickEventArgs e)
        {

            try
            {

                System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString.ToString());

                sc.Open();

                System.Data.SqlClient.SqlCommand addFurniture = new System.Data.SqlClient.SqlCommand();

                addFurniture.Connection = sc;

                int cubicUnit = int.Parse(HttpUtility.HtmlEncode(txtCubicUnit.Text));

                // INSERT INTO TABLE
                addFurniture.CommandText = "INSERT INTO dbo.FURNITURE (name, cubicUnit) VALUES (@Name, @CubicUnit)";

                addFurniture.Parameters.Add(new SqlParameter("@Name", HttpUtility.HtmlEncode(txtName.Text)));
                addFurniture.Parameters.Add(new SqlParameter("@CubicUnit", HttpUtility.HtmlEncode(cubicUnit)));

                addFurniture.ExecuteNonQuery();

                sc.Close();

                Response.Redirect("ManageFurniture.aspx");

                txtName.Visible = false;
                txtCubicUnit.Visible = false;

            }
            catch
            {
                Response.Redirect("ManageFurniture.aspx");
            }

        }

        protected void btnCancelFurniture_Click(object sender, ImageClickEventArgs e)
        {

            txtName.Text = null;
            txtCubicUnit.Text = null;

            txtName.Visible = false;
            txtCubicUnit.Visible = false;

            addFurniture.Attributes.CssStyle.Add("display", "block");
            btnNewFurniture.Attributes.CssStyle.Add("display", "none");
            btnCancelFurniture.Visible = false;

        }

        protected void grdvwFurniture_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                Session["furnitureID"] = e.CommandArgument.ToString();
            }

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


        protected void datasrcFurniture_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            try
            {
                String furnitureID = Session["furnitureID"].ToString();
                String sqlQuery = "SELECT furnitureID FROM dbo.FURNITURE WHERE furnitureID = '" + furnitureID + "'";
                DataTable furn = sqlConnection(sqlQuery);
                String ID = furn.Rows[0][0].ToString();

                // SqlCommand Chunk to DELETE FURNITURE from FURNITURE
                System.Data.SqlClient.SqlCommand deleteFurniture = new System.Data.SqlClient.SqlCommand();
                SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString.ToString());

                con.Open();

                deleteFurniture.Connection = con;

                deleteFurniture.CommandText = "DELETE FROM FURNITURE WHERE furnitureID = '" + ID + "'";

                deleteFurniture.ExecuteNonQuery();

                con.Close();

                Response.Redirect("ManageFurniture.aspx");

            }
            catch
            {
                lblResponse.Text = "Database Error: Please try again.";
            }
        }
    }
}


