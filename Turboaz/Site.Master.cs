using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Turboaz
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool isAdmin = Session["role"]?.ToString() == "admin";

            if (isAdmin) liAppeal.Visible = true;
            else liAppeal.Visible = false;

        }

        protected void btnAppeal_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/Appeal.aspx");
        }
    }
}