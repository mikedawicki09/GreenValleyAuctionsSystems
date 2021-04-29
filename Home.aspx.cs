using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GreenValleyAuctionsSystem
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEmployee_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeLogin.aspx");
        }

        protected void btnCustomer_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerLogin.aspx");
        }
    }
}