using System;
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
    }
}