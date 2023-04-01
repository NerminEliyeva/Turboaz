using Microsoft.AspNet.FriendlyUrls;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Turboaz.App_Code;

namespace Turboaz
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                carsRepeater.DataSource = SqlFuncs.GetAllCars();
                carsRepeater.DataBind();
            }
        }

        protected void btnAddNewCarPage_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AddingNewCar.aspx");
        }
    }
}