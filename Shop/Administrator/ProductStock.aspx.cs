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
    public partial class ProductStock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetCategories();
                GetAvailableStock();
            }
        }

        private void GetCategories()
        {
            ShoppingCart k = new ShoppingCart();
            DataTable dt = k.GetCategories();
            if (dt.Rows.Count > 0)
            {
                ddlCategory.DataValueField = "CategoryID";
                ddlCategory.DataTextField = "CategoryName";
                ddlCategory.DataSource = dt;
                ddlCategory.DataBind();
                ddlCategory.Items.Add(new ListItem("All Products", "0", true));
                ddlCategory.SelectedValue = "0";
            }
        }

        private void GetAvailableStock()
        {
            ShoppingCart k = new ShoppingCart()
            {
                CategoryID = Convert.ToInt32(ddlCategory.SelectedValue),
                StockType = Convert.ToInt32(rblProductStock.SelectedValue)
            };
            DataTable dt = k.GetAvailableStock();
            if (dt.Rows.Count > 0)
            {
                gvAvailableStock.DataSource = dt;
                gvAvailableStock.DataBind();
                gvAvailableStock.Visible = true;
                gvAvailableStock.Visible = false;
            }
            else
            {
                NoRecordsToDisplay.Visible = true;
                gvAvailableStock.Visible = false;
            }
                 
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetAvailableStock();
        }

        protected void rblProductStock_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetAvailableStock();
        }
    }
}