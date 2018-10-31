using Shop.BusinessLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shop.Administrator
{
    public partial class CustomerOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetOrdersList();
            }
        }
        private void GetOrdersList()
        {
            ShoppingCart k = new ShoppingCart()

            {
                Flag = 0
            };

        DataTable dt = k.GetOrdersList();

        gvCustomerOrders.DataSource = dt;
        gvCustomerOrders.DataBind();
        }

        }
    }
