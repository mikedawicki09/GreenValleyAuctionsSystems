using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GreenValleyAuctionsSystem
{
    public partial class ViewAllCustomers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void grdvwCustomerTable_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("InitialContactNewCustomer.aspx");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }
    }
}