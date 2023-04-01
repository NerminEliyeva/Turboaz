using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Turboaz.App_Code;

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

        protected void btnSave_Click(object sender, EventArgs e)
        {
           
        }

        protected void ddlMark_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ddlMark.SelectedValue);
            ddlModel.DataSource = SqlFuncs.GetModels(id);
            ddlModel.DataTextField = "ModelName";
            ddlModel.DataValueField = "ModelId";
            ddlModel.DataBind();
        }
    }
}