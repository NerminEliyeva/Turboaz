using Microsoft.AspNet.FriendlyUrls;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Turboaz.App_Code;

namespace Turboaz
{
    public partial class Home : System.Web.UI.Page
    {
        private int iPageSize = 6;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                bool isAdmin = Session["role"]?.ToString() == "admin";
                bool isUser = Session["role"]?.ToString() == "user";

                if (isAdmin || isUser) btnAddNewCarPage.Visible = true;

                else btnAddNewCarPage.Visible = false;


                Session["source"] = SqlFuncs.GetAllCars();

                GetCars();

                DataTable dt = SqlFuncs.GetMarks();
                var row = dt.NewRow();
                row["MarkName"] = "--Seçin--";
                row["MarkId"] = -1;
                dt.Rows.InsertAt(row, 0);
                var rowAll = dt.NewRow();
                rowAll["MarkName"] = "Hamısı";
                rowAll["MarkId"] = -2;
                dt.Rows.InsertAt(rowAll, 1);
                ddlMark.DataSource = dt;
                ddlMark.DataTextField = "MarkName";
                ddlMark.DataValueField = "MarkId";
                ddlMark.DataBind();
                ddlMark_SelectedIndexChanged(null, null);
            }
        }
        private void GetCars()
        {
            DataTable dt = (DataTable)Session["source"];
            PagedDataSource pdsData = new PagedDataSource();
            DataView dv = new DataView(dt);
            pdsData.DataSource = dv;
            pdsData.AllowPaging = true;
            pdsData.PageSize = iPageSize;
            if (ViewState["PageNumber"] != null)
                pdsData.CurrentPageIndex = Convert.ToInt32(ViewState["PageNumber"])-1;
            else
                pdsData.CurrentPageIndex = 0;
            if (pdsData.PageCount > 1)
            {
                pageRepeater.Visible = true;
                ArrayList alPages = new ArrayList();
                for (int i = 1; i <= pdsData.PageCount; i++)
                    alPages.Add((i).ToString());
                pageRepeater.DataSource = alPages;
                pageRepeater.DataBind();
            }
            else
            {
                pageRepeater.Visible = false;
            }

            carsRepeater.DataSource = pdsData;
            carsRepeater.DataBind();

        }
        protected void pageRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            ViewState["PageNumber"] = Convert.ToInt32(e.CommandArgument);
            GetCars();
        }
        protected void btnAddNewCarPage_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AddingNewCar.aspx");
        }

        protected void ddlMark_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ddlMark.SelectedValue);

            DataTable dt = SqlFuncs.GetModels(id);
            var row = dt.NewRow();
            row["ModelName"] = "--Seçin--";
            row["ModelId"] = -1;
            dt.Rows.InsertAt(row, 0);
            var rowAll = dt.NewRow();
            rowAll["ModelName"] = "Hamısı";
            rowAll["ModelId"] = -2;
            dt.Rows.InsertAt(rowAll, 1);
            ddlModel.DataSource = dt;
            ddlModel.DataTextField = "ModelName";
            ddlModel.DataValueField = "ModelId";
            ddlModel.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            ViewState["PageNumber"] = null;
            lblMessageFilter.Text = "";
            int markId = Convert.ToInt32(ddlMark.SelectedValue);
            int? mark = null;
            if (markId > -1)
            {
                mark = markId;
            }

            int modelId = Convert.ToInt32(ddlModel.SelectedValue);
            int? model = null;
            if (modelId > -1)
            {
                model = modelId;
            }

            double? minPrice = null;
            double? maxPrice = null;
            bool isValidMin = double.TryParse(txtMinPrice.Text, out double prcmin);
            if (txtMinPrice.Text.Trim().Length > 0 && !isValidMin)
            {
                lblMessageFilter.Text = "Qiymət üçün tam dəyər daxil edin.";
                return;
            }
            if (isValidMin)
            {
                minPrice = prcmin;
            }
            bool isValidMax = double.TryParse(txtMaxPrice.Text, out double prcmax);

            if (txtMaxPrice.Text.Trim().Length > 0 && !isValidMax)
            {
                lblMessageFilter.Text = "Qiymət üçün tam dəyər daxil edin.";
                return;
            }
            if (isValidMax)
            {
                maxPrice = prcmax;
            }
            Session["source"] = SqlFuncs.GetFilteredTable(mark, model, minPrice, maxPrice);

            GetCars();
        }
    }
}