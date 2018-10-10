using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;

namespace Shop.Administrator
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string LoginID = WebConfigurationManager.AppSettings["AdministratorLoginID"];
            string Password = WebConfigurationManager.AppSettings["AdministratorPassword"];

            if (txtLoginId.Text == LoginID && txtPassword.Text == Password)
            {
                Session["ShopAdministrator"] = "ShopAdministrator";
                Response.Redirect("~/Administator/AddNewProducts.aspx");
            }
            {
                lblAlert.Text = "Wrong LoginId/Password";
            }
        }
    }
}