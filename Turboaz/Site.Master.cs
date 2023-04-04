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
            if (!Page.IsPostBack)
            {
                bool isAdmin = Session["role"]?.ToString() == "admin";
                bool isUser = Session["role"]?.ToString() == "user";

                if (isAdmin) liAppeal.Visible = true;
                else liAppeal.Visible = false;

                if (isAdmin || isUser) btnLogout.Visible = true;
                else btnLogout.Visible = false;
            }

        }

        protected void btnAppeal_Click1(object sender, EventArgs e)
        {
            Response.Redirect("~/Appeal.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["role"] = null;
            btnLogout.Visible = false;
        }

    }
}