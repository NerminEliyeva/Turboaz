using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net.Mail;
using System.Reflection;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Turboaz.App_Code;

namespace Turboaz
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (txtName.Text.Length<1)
            {
                lblMessageError.Text = "Adınızı daxil edin.";
                return;
            }
            string name = txtName.Text;

            string emailPattern = @"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$";
            Regex emailRegex = new Regex(emailPattern);
            if (!emailRegex.IsMatch(txtEmailRegister.Text))
            {
                lblMessageError.Text = "Email düzgün formatda daxil edin.";
                return;
            }
            string email = txtEmailRegister.Text;

            string phonePattern = @"^\+?\d{10,12}$";
            Regex phoneRegex = new Regex(phonePattern);
            if (!phoneRegex.IsMatch(txtPhone.Text))
            {
                lblMessageError.Text = "Telefon nömrəsini düzgün formatda daxil edin.";
                return;
            }
            string phone = txtPhone.Text;

            if (txtPasswordRegister.Text.Length<6)
            {
                lblMessageError.Text = "Şifrə 6 simvoldan az ola bilməz.";
                return;
            }
            string password = txtPasswordRegister.Text;

            SqlFuncs.SaveNewPerson(name, email, phone, password, 2);

            txtName.Text = "";
            txtEmailRegister.Text = "";
            txtPhone.Text = "";
            txtPasswordRegister.Text = "";

            Response.Redirect("/Login");
        }
    }
}