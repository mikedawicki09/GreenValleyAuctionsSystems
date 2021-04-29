using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GreenValleyAuctionsSystem
{
    public partial class EmployeeFacingMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //require users sign in to access the page 
            if (Session["Username"] == null)
            {
                Session["InvalidUse"] = "You must login to access this page!";
                Response.Redirect("EmployeeLogin.aspx");
            }
            else
            {

            }

        }

        protected void imgBtnLogo_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("EmployeeDashboard.aspx");
        }

        protected void btnDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeDashboard.aspx");
        }

        protected void btnCustomers_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewAllCustomers.aspx");
            //redirect to page to view all customers, search customers, add new customer, etc
        }

        protected void btnServices_Click(object sender, EventArgs e)
        {
            //redirect to a page where you can view list of current (in-progress) services, add new service ticket, search old, etc? 
            //could dropdown to have more specific options (like Mike & Kellie's)
        }

        protected void btnInventory_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewInventory.aspx");
            //redirect to page to view all inventory, search inventory, add new item, show location of inventory in storage, upload new pics (?), etc
        }

        protected void btnCalendar_Click(object sender, EventArgs e)
        {
            //redirect to page to view all auction events and other services (greg/elizabeth/laura can see if they have availability to schedule a move for a particular weekend, etc)
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            //redirects to the login page
            Session.Abandon();
            Response.Redirect("Home.aspx?LoggedOut=true");
        }
    }
}