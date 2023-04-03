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
using System.Security.Principal;

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
                string UserId = dataRow["Id"].ToString();
                string userName = dataRow["Name"].ToString();
                Session["role"] = roleName;
                Session["UserId"] = UserId;
                //lblTest.Text = roleName;
                lblNotFound.Text = "";
                FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(
                          1, // sürüm numarası
                          userName, // kullanıcı adı
                          DateTime.Now, // oluşturma tarihi
                          DateTime.Now.AddMinutes(30), // son kullanma tarihi
                          false, // kalıcı çerez olmadığı belirtilir
                          roleName // kullanıcının rolü UserData özelliğine eklenir
                      );
                string[] roles = new string[] { roleName };
                string encryptedTicket = FormsAuthentication.Encrypt(ticket);
                HttpCookie authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);
                HttpContext.Current.Response.Cookies.Add(authCookie);
                HttpContext.Current.User = new GenericPrincipal(new FormsIdentity(ticket), roles);
               
                Response.Redirect("~/Home.aspx");
                    
            }
            else
            {
                lblTest.Text = "";
                lblNotFound.Text = "İstifadəçi tapılmadı.";
            }

            txtEmailLogin.Text = "";
            txtPassword.Text = "";

        }
    }
}