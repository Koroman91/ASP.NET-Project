using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Shop.BusinessLayer;
using System.Data;

namespace Shop
{
    public partial class TrackYourOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["Id"]))
            {
                string Transaction = Request.QueryString["Id"];

                ucCustomerOrder1.TransactionNoText = TransactionNo;
            }
            if (!string.IsNullOrEmpty(Convert.ToString(Session["ShopAdministrator"])))
            {
                ucCustomerOrder1.IsAuthorizedToAddStatus = true;
            }
            else
            {
                ucCustomerOrder1.IsAuthorizedToAddStatus = false;
              
            }
        }
    }
}