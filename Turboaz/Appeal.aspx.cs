using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Turboaz.App_Code;

namespace Turboaz
{
    public partial class Appeal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                tblRepeater.DataSource = SqlFuncs.GetCarsAppeals();
                tblRepeater.DataBind();
            }
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {

            LinkButton btn=sender as LinkButton;
            int routeId = Convert.ToInt32(btn.CommandArgument);
            SqlFuncs.UpdateCarStatus(routeId, 1);
            tblRepeater.DataSource = SqlFuncs.GetCarsAppeals();
            tblRepeater.DataBind();
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            LinkButton btn = sender as LinkButton;
            int routeId = Convert.ToInt32(btn.CommandArgument);
            SqlFuncs.UpdateCarStatus(routeId, 0);
            tblRepeater.DataSource = SqlFuncs.GetCarsAppeals();
            tblRepeater.DataBind();
        }
    }
}