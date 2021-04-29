using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GreenValleyAuctionsSystem
{
    public partial class CustomerFacingMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CustomerUsername"] == null)
            {
                Response.Redirect("CustomerLogin.aspx");
            }
            else
            {
                LoginAware.Text = "Welcome, " + Session["CustomerName"];
            }

        }

        protected void btnRequestService_Click(object sender, EventArgs e)
        {
            Response.Redirect("ServiceRequest.aspx");
        }

        protected void btnContactUs_Click(object sender, EventArgs e)
        {
            //This page will just have contact info in case any customers want to call and request service that way or if they want to inquire about services already requested
            Response.Redirect("ContactUs.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            //redirects to the login page
            Session.Abandon();
            Response.Redirect("Home.aspx?LoggedOut=true");

        }

        protected void imgBtnLogo_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("CustomerPortal.aspx");
        }
    }
}
