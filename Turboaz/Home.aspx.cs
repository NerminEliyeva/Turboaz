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
        //PagedDataSource _PagedDataSource = new PagedDataSource();//used the store data from db
        private int iPageSize = 6;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GetCars();
                //_PagedDataSource.DataSource = SqlFuncs.GetAllCars().Rows;
                //_PagedDataSource.AllowPaging = true;
                //_PagedDataSource.PageSize = 10;
                //_PagedDataSource.CurrentPageIndex = currentPage;
                //ViewState["TotalPages"] = _PagedDataSource.Count;
                //if (SqlFuncs.GetAllCars().Rows.Count < 11)
                //    divPaging.Visible = false;
                //btnPrevious.Visible = !_PagedDataSource.IsFirstPage;
                //btnNext.Visible = !_PagedDataSource.IsLastPage;
                //btnFirst.Visible = !_PagedDataSource.IsFirstPage;
                //btnLast.Visible = !_PagedDataSource.IsLastPage;

                //// Bind the data to the repeater control
                //carsRepeater.DataSource = _PagedDataSource; // rows-a gore evaldakilari oxuya bilmir 
                //carsRepeater.DataBind();

                ////call paging method
                //doPaging();

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

            PagedDataSource pdsData = new PagedDataSource();
            DataView dv = new DataView(SqlFuncs.GetAllCars());
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

            carsRepeater.DataSource = SqlFuncs.GetFilteredTable(mark, model, minPrice, maxPrice);
            carsRepeater.DataBind();
        }

   
        //    #region doPaging
        //    protected void btnFirst_Click(object sender, EventArgs e)
        //    {

        //    }

        //    protected void btnPrevious_Click(object sender, EventArgs e)
        //    {

        //    }

        //    protected void btnNext_Click(object sender, EventArgs e)
        //    {

        //    }

        //    protected void btnLast_Click(object sender, EventArgs e)
        //    {

        //    }

        //    protected void dlPaging_ItemCommand(object source, DataListCommandEventArgs e)
        //    {

        //    }

        //    protected void dlPaging_ItemDataBound(object sender, DataListItemEventArgs e)
        //    {

        //    }
        //    private void doPaging()
        //    {
        //        DataTable dt = new DataTable();
        //        dt.Columns.Add("PageIndex");
        //        dt.Columns.Add("PageText");
        //        firstIndex = currentPage - 5;
        //        if (currentPage > 5)
        //            lastIndex = currentPage + 5;
        //        else
        //            lastIndex = 10;
        //        if (lastIndex > Convert.ToInt32(ViewState["TotalPages"]))
        //        {
        //            lastIndex = Convert.ToInt32(ViewState["TotalPages"]);
        //            firstIndex = lastIndex - 10;
        //        }
        //        if (firstIndex < 0)
        //            firstIndex = 0;
        //        for (int i = firstIndex; i < lastIndex; i++)
        //        {
        //            DataRow dr = dt.NewRow();
        //            dr[0] = i;
        //            dr[1] = i + 1;
        //            dt.Rows.Add(dr);
        //        }
        //        dlPaging.DataSource = dt;
        //        dlPaging.DataBind();
        //    }
        //    #endregion

        //    #region handle index
        //    private int currentPage
        //    {
        //        get
        //        {
        //            object objPage = ViewState["_CurrentPage"];
        //            int _CurrentPage = 0;
        //            if (objPage == null)
        //                _CurrentPage = 0;
        //            else
        //                _CurrentPage = (int)objPage;
        //            return _CurrentPage;
        //        }
        //        set
        //        {
        //            ViewState["_CurrentPage"] = value;
        //        }
        //    }
        //    private int firstIndex
        //    {
        //        get {
        //            int _FirstIndex = 0;
        //            if (ViewState["_FirstIndex"] == null)
        //                _FirstIndex = 0;
        //            else
        //                _FirstIndex = Convert.ToInt32(ViewState["_FirstIndex"]);
        //            return _FirstIndex;
        //        }
        //        set
        //        {
        //            ViewState["_FirstIndex"] = value;
        //        }
        //    }
        //    private int lastIndex
        //    {
        //        get
        //        {
        //            int _LastIndex = 0;
        //            if (ViewState["_LastIndex"] == null)
        //                _LastIndex = 0;
        //            else
        //                _LastIndex = Convert.ToInt32(ViewState["_LastIndex"]);
        //            return _LastIndex;
        //        }
        //        set
        //        {
        //            ViewState["_LastIndex"] = value;
        //        }
        //    }
        //}
        //#endregion
    }
}