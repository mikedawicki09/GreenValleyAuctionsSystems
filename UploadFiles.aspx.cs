using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GreenValleyAuctionsSystem
{
    public partial class UploadFiles : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            datasrcFileTable.SelectCommand = "Select * from [FILE] where serviceID = " + Session["serviceID"];

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            string strFileName;
            string strFilePath;
            string strFolder;
            string fileType;
            strFolder = strFolder = HttpContext.Current.Request.MapPath(".") + "CustomerFiles/";
            //strFolder = strFolder = Server.MapPath("~") + "CustomerFiles/";    //working but maybe not on AWS
           // strFolder = strFolder = HttpContext.Current.Request.

            //strFolder = Request.PhysicalApplicationPath + "CustomerFiles\\";

            // Get the name of the file that is posted.
            strFileName = oFile.PostedFile.FileName;
            //strFileName = Path.GetFileName(strFileName);

            fileType = rbfiletype.SelectedValue;

            if (!fileType.Equals(""))
            {
                if (oFile.Value != "")
                {
                    // Create the directory if it does not exist.
                    if (!Directory.Exists(strFolder))
                    {
                        Directory.CreateDirectory(strFolder);
                    }
                    // Save the uploaded file to the server.
                    strFilePath = strFolder + strFileName;
                    //lblUploadResult.Text = strFilePath;
                    if (File.Exists(strFilePath))
                    {
                        lblUploadResult.Text = strFileName + " already exists on the server!";
                    }
                    else
                    {
                        oFile.PostedFile.SaveAs(strFilePath);
                        lblUploadResult.Text = strFileName + " has been successfully uploaded.";

                        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString);

                        System.Data.SqlClient.SqlCommand insertImage = new System.Data.SqlClient.SqlCommand();

                        con.Open();
                        insertImage.Connection = con;

                        insertImage.CommandText = "INSERT INTO dbo.[FILE] ([fileName], fileType, serviceID) VALUES(@Filename, @Filetype, @ServiceID)";

                        insertImage.Parameters.Add(new SqlParameter("@Filename", strFileName));
                        insertImage.Parameters.Add(new SqlParameter("@Filetype", fileType));
                        insertImage.Parameters.Add(new SqlParameter("@ServiceID", Session["serviceID"]));

                        insertImage.ExecuteNonQuery();
                        con.Close();

                        Response.Redirect("UploadFiles.aspx");
                    }
                }
                else
                {
                    lblUploadResult.Text = "Click 'Browse' to select the file to upload.";
                }
                // Display the result of the upload.
                frmConfirmation.Visible = true;
            }
            else
            {
                lblUploadResult.Text = "Please select file type.";
                frmConfirmation.Visible = true;
            }
        }

        protected void grdvwFileTable_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "View")
            {
                //holds the index of the selected row 
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = grdvwFileTable.Rows[rowIndex];
                Response.Write("<script>");
                //Response.Write("window.open('../CustomerFiles/" + "Service " + Session["serviceID"] + "/" + row.Cells[1].Text + "', '_newtab');");
                Response.Write("window.open('../CustomerFiles/" + row.Cells[1].Text + "', '_newtab');");
                Response.Write("</script>");
            }
        }

        protected void ddlfilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlfilter.SelectedValue.Equals("No Filter"))
            {
                Response.Redirect("UploadFiles.aspx");
            }
            else
            {
                datasrcFileTable.SelectCommand = "Select * from [FILE] where serviceID = " + Session["serviceID"] + " AND fileType = '" + ddlfilter.SelectedValue + "'";
            }
        }

        protected void btsearch_Click(object sender, EventArgs e)
        {
            if (!txtsearch.Text.Equals(""))
            {
                datasrcFileTable.SelectCommand = "SELECT * from [FILE] where [fileName] LIKE '%" + txtsearch.Text + "%'";
            }
            else
            {
                Response.Redirect("UploadFiles.aspx");
            }
        }

    }
}


