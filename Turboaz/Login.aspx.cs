using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Turboaz.App_Code;
using System.Data.SqlClient;
using System.Web.Security;
using System.Reflection.Emit;
using System.Text;
using System.Web.DynamicData;

namespace Turboaz
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmailLogin.Text;
            string password = txtPassword.Text;

            DataTable dt = SqlFuncs.ValidationLogin(email, password);
            if (dt != null && dt.Rows.Count > 0)
            {
                DataTable dataTable = SqlFuncs.ValidationLogin(email, password);
                DataRow dataRow = dataTable.Rows[0];
                string roleName = dataRow["RoleName"].ToString();
                lblTest.Text = roleName;
                lblNotFound.Text = "";
                //Response.Redirect("~/Home.aspx");
                FormsAuthentication.RedirectToLoginPage("~/Home.aspx");
            }
            else
            {
                lblTest.Text = "";
                lblNotFound.Text = "İstifadəçi tapılmadı.";
            }

            txtEmailLogin.Text = "";
            txtPassword.Text = "";

            this.btnLogin.Click += new System.EventHandler(this.btnLogin_Click);
        }
    }
}