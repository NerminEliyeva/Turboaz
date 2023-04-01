using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Turboaz.App_Code;
using Turboaz.Models;

namespace Turboaz
{
    public partial class AddingNewCar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ddlMark.DataSource = SqlFuncs.GetMarks();
                ddlMark.DataTextField = "MarkName";
                ddlMark.DataValueField = "MarkId";
                ddlMark.DataBind();
            }
        }

        protected void ddlMark_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ddlMark.SelectedValue);
            ddlModel.DataSource = SqlFuncs.GetModels(id);
            ddlModel.DataTextField = "ModelName";
            ddlModel.DataValueField = "ModelId";
            ddlModel.DataBind();
        }
        [WebMethod]
        public static string Save(SavedCarModel dto)
        {
            return "Posted";
        }
    }
}