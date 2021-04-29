using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace GreenValleyAuctionsSystems
{
    public partial class SearchBar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            
            //string saveDir = Request.PhysicalApplicationPath + "CustomerFiles\\";
           // string appPath = Path.GetFileName(FileUpload1.FileName);
            if (FileUpload1.HasFile)
            {
                string strPath = Path.GetTempPath() + "../CustomerFiles/" + FileUpload1.FileName;
                FileUpload1.SaveAs(strPath);
                //string savePath = saveDir +
                //    Server.HtmlEncode(FileUpload1.FileName);

                // Call the SaveAs method to save the 
                // uploaded file to the specified path.
                // This example does not perform all
                // the necessary error checking.               
                // If a file with the same name
                // already exists in the specified path,  
                // the uploaded file overwrites it.
                //FileUpload1.SaveAs(savePath);

                // Notify the user that the file was uploaded successfully.
                UploadStatusLabel.Text = strPath + "fuck yeah";

            }
            else
            {
                // Notify the user that a file was not uploaded.
                UploadStatusLabel.Text = "something went wrong";
            }
        }
    }
}