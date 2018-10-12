﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Shop.BusinessLayer;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace Shop
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblCategoryName.Text = "Popular Products";

            if (!IsPostBack)
            {
                GetCategory();
                GetProducts(0);
            }
        }

        private void GetCategory()
        {
            ShoppingCart k = new ShoppingCart();
            dlCategories.DataSource = null;
            dlCategories.DataSource = k.GetCategories();
            dlCategories.DataBind();
        }

        private void GetProducts(int CategoryID)
        {
            ShoppingCart k = new ShoppingCart()
            {
                CategoryID = CategoryID
            };

            dlProducts.DataSource = null;
            dlProducts.DataSource = k.GetAllProducts(); ;
            dlProducts.DataBind();

        }
  
        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            string ProductID = Convert.ToInt16((((Button)sender).CommandArgument)).ToString();

           if (Session["ShopAdministrator"] != null)
            {
                DataTable dt = (DataTable)Session["ShopAdministrator"];
                dt.Rows.Add(ProductID);
                Session["ShopAdministrator"] = dt;
                btnShoppingHeart.Text = dt.Rows.Count.ToString();
            }
            else
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("ProductID", typeof(string));
                dt.Rows.Add(ProductID);
                Session["ShopAdministrator"] = dt;
                btnShoppingHeart.Text = dt.Rows.Count.ToString();
            }
        }

        protected void lbtnCategory_Click(object sender, EventArgs e)
        {
            pnlMyCart.Visible = false;
            pnlProducts.Visible = true;
            int CategoryID = Convert.ToInt16((((LinkButton)sender).CommandArgument));
            GetProducts(CategoryID);
            HighlightCartProducts();
        }

        protected void btnShoppingHeart_Click(object sender, EventArgs e)
        {
            GetMyCart();
            lblCategoryName.Text = "Products in Your Shop Cart.";
            lblProducts.Text = "CheckOut Form";
            pnlMyCart.Visible = true;
            pnlCheckOut.Visible = true;
            pnlCategories.Visible = false;
            pnlProducts.Visible = false;
        }

        private void GetMyCart()
        {
            string productids = string.Empty;
            DataTable dt = (DataTable)Session["ShopAdministrator"];

            for (int i=0; i <dt.Rows.Count; i++)
            {
                if (i == 0 || dt.Rows.Count == 1)
                {
                    productids = productids + dt.Rows[i]["ProductID"].ToString();
                }
                else
                {
                    productids = productids + "," + dt.Rows[i]["ProductID"].ToString();
                }
            }

            productids = "(" + productids + ")";
            if (dt.Rows.Count > 0)
            {
                string query = "select * from Products where ProductId in " + productids + "";
                DataTable dtProducts = GetData(query);
                lblTotalProducts.Text = dtProducts.Rows.Count.ToString();
                dlCartProducts.DataSource = dtProducts;
                dlCartProducts.DataBind();
            }
            else
            {
                dlCartProducts.DataSource = null;
                dlCartProducts.DataBind();
                lblTotalProducts.Text = "0";
            }

        }

        public DataTable GetData(string query)
        {
            DataTable dt = new DataTable();
            string Conn = WebConfigurationManager.ConnectionStrings["ShopAdministrator"].ConnectionString;
            SqlConnection con = new SqlConnection(Conn);
            con.Open();

            SqlDataAdapter da = new SqlDataAdapter(query, con);
            da.Fill(dt);

            con.Close();
            return dt;

        }

        protected void dlCartProducts_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void txtProductQuantity_TextChanged(object seneder, EventArgs e)
        {
            TextBox txtQuantity = (sender as TextBox);

            DataListItem currentItem = (sender as TextBox).NamingContainer as DataListItem;
            HiddenField ProductID = currentItem.FindControl("hfProductID") as HiddenField;
            Label lblAvailableStock = currentItem.FindControl("lblAvailableStock") as Label;

            if (txtQuantity.Text == string.Empty || txtQuantity.Text == "0" || txtQuantity.Text == "1")
            {
                txtQuantity.Text = "1";
            }
            else
            {
                if (Session["ShopAdministrator"] !=null )
                {
                    if (Convert.ToInt32(txtQuantity.Text) <= Convert.ToInt32(lblAvailableStock.Text))
                    {
                        DataTable dt = (DataTable)Session["ShopAdministrator"];
                        DataRow[] rows = dt.Select("ProductID= '" + ProductID.Value + "'");
                        int index = dt.Rows.IndexOf(rows[0]);

                        dt.Rows[index]["ProductQuantity"] = txtQuantity.Text;

                        Session["ShopAdministrator"] = dt;
                    }
                    else
                    {
                        lblAvailableStock.Text = "Alert : Product Buyout should not be Mote than AvailableStock!";
                        txtQuantity.Text = "1";
                    }
                }
            }
            UpdateTotalBill();
        }

        private void UpdateTotalBill()
        {
            long TotalPrice = 0;
            long TotalProducts = 0;
            foreach (DataListItem item in dlCartProducts.Items)
            {
                Label PriceLabel = item.FindControl("lblPrice") as Label;
                TextBox ProductQuantity = item.FindControl("txtProductQuantity") as TextBox;
                long ProductPrice = Convert.ToInt64(PriceLabel.Text) * Convert.ToInt64(ProductQuantity.Text);
                TotalPrice = TotalPrice + ProductPrice;
                TotalProducts = TotalProducts + Convert.ToInt32(ProductQuantity.Text);
            }
            txtTotalPrice.Text = Convert.ToString(TotalPrice);
            txtTotalProducts.Text = Convert.ToString(TotalProducts);
        }
    }
}