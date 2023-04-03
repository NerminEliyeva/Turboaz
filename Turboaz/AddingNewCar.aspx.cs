using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.Services;
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
                DataTable dt = SqlFuncs.GetMarks();
                var row = dt.NewRow();
                row["MarkName"] = "--Seçin--";
                row["MarkId"] = -1;
                dt.Rows.InsertAt(row, 0);
                ddlMark.DataSource = dt;
                ddlMark.DataTextField = "MarkName";
                ddlMark.DataValueField = "MarkId";
                ddlMark.DataBind();

                ddlMark_SelectedIndexChanged(null, null);
            }
       
        }

        protected void ddlMark_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ddlMark.SelectedValue);

            DataTable dt = SqlFuncs.GetModels(id);
            var row = dt.NewRow();
            row["ModelName"] = "--Seçin--";
            row["ModelId"] = -1;
            dt.Rows.InsertAt(row, 0);

            ddlModel.DataSource = dt;
            ddlModel.DataTextField = "ModelName";
            ddlModel.DataValueField = "ModelId";
            ddlModel.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

            if (ddlMark.SelectedValue == "")
            {
                lblMessage.Text = "Marka seçin.";
                return;
            }
            int mark = Convert.ToInt32(ddlMark.SelectedValue);

            if (ddlModel.SelectedValue == "")
            {
                lblMessage.Text = "Model seçin.";
                return;
            }
            int model = Convert.ToInt32(ddlModel.SelectedValue);

            if (!int.TryParse(txtPrice.Text, out int prc))
            {
                lblMessage.Text = "Qiymət üçün tam dəyər daxil edin.";
                return;
            }
            int price = Convert.ToInt32(txtPrice.Text);
            DateTime time = DateTime.Now;
            if (fileUpload.PostedFile != null && fileUpload.PostedFile.FileName != null && fileUpload.HasFile)
            {
                string timePath = time.ToString("yyyyMMddHHmmssfff");
                string fileName = Path.GetFileName(fileUpload.PostedFile.FileName);
                string filePath = Server.MapPath("~/Images/" + timePath + fileName);
                fileUpload.SaveAs(filePath);
                SqlFuncs.SaveNewCar(mark, model, price, "/Images/" + timePath + fileName, time, 1, 1);
            }
            else
            {
                if (fileUpload.PostedFile == null || !fileUpload.HasFile)
                {
                    lblMessage.Text = "Please select a file to upload.";
                }
                else if (fileUpload.PostedFile.FileName == null)
                {
                    lblMessage.Text = "File name cannot be null.";
                }
            }
            ddlMark.SelectedValue = "-1";
            ddlModel.SelectedValue = "-1";
            txtPrice.Text = "";
        }
    }
}