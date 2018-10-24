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
using System.IO;


namespace Shop
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                lblCategoryName.Text = "Popular Products";
                GetCategory();
                GetProducts(0);
            }
            lblAvailableStockAlert.Text = string.Empty;
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
            string ProductQuantity = "1";

            DataListItem currentItem = (sender as Button).NamingContainer as DataListItem;
            Label lblAvailableStock = currentItem.FindControl("lblAvailableStock") as Label;

            if (Session["ShopAdministrator"] != null)
            {
                DataTable dt = (DataTable)Session["ShopAdministrator"];
                var checkProduct = dt.AsEnumerable().Where(r => r.Field<string>("ProductID") == ProductID);
                if (checkProduct.Count() == 0)
                {
                    string query = "select * from Products where ProductID = " + ProductID + "";
                    DataTable dtProducts = GetData(query);


                    DataRow dr = dt.NewRow();
                    dr["ProductID"] = ProductID;
                    dr["Name"] = Convert.ToString(dtProducts.Rows[0]["Name"]);
                    dr["Description"] = Convert.ToString(dtProducts.Rows[0]["Description"]);
                    dr["Price"] = Convert.ToString(dtProducts.Rows[0]["Price"]);
                    dr["ImageUrl"] = Convert.ToString(dtProducts.Rows[0]["ImageUrl"]);
                    dr["ProductQuantity"] = ProductQuantity;
                    dr["AvailableStock"] = lblAvailableStock.Text;
                    dt.Rows.Add(dr);

                    Session["ShopAdministrator"] = dt;
                    btnShoppingHeart.Text = dt.Rows.Count.ToString();
                }
            }
            else
            {
                string query = "select * from Products where ProductID = " + ProductID + "";
                DataTable dtProducts = GetData(query);
                DataTable dt = new DataTable();

                dt.Columns.Add("ProductID", typeof(string));
                dt.Columns.Add("Name", typeof(string));
                dt.Columns.Add("Description", typeof(string));
                dt.Columns.Add("Price", typeof(string));
                dt.Columns.Add("ImageUrl", typeof(string));
                dt.Columns.Add("ProductQuantity", typeof(string));
                dt.Columns.Add("AvailableStock", typeof(string));

                DataRow dr = dt.NewRow();

                dr["ProductID"] = ProductID;
                dr["Name"] = Convert.ToString(dtProducts.Rows[0]["Name"]);
                dr["Description"] = Convert.ToString(dtProducts.Rows[0]["Description"]);
                dr["Price"] = Convert.ToString(dtProducts.Rows[0]["Price"]);
                dr["ImageUrl"] = Convert.ToString(dtProducts.Rows[0]["ImageUrl"]);
                dr["ProductQuantity"] = ProductQuantity;
                dr["AvailableStock"] = lblAvailableStock.Text;
                dt.Rows.Add(dr);

                Session["ShopAdministrator"] = dt;
                btnShoppingHeart.Text = dt.Rows.Count.ToString();

            }

            HighlightCartProducts();
        }

        private void HighlightCartProducts()
        {
            if (Session["ShopAdministrator"] != null)
            {
                DataTable dtProductAddedToCart = (DataTable)Session["ShopAdministrator"];
                if (dtProductAddedToCart.Rows.Count > 0)
                {
                    foreach (DataListItem item in dlProducts.Items)
                    {
                        HiddenField hfProductID = item.FindControl("hfProductID") as HiddenField;
                        if (dtProductAddedToCart.AsEnumerable().Any(row => hfProductID.Value == row.Field<String>("ProductID")))
                        {
                            //item.BackColor = System.Drawing.Color.Red;

                            Button btnAddToCart = item.FindControl("btnAddToCart") as Button;
                            btnAddToCart.BackColor = System.Drawing.Color.Green;
                            btnAddToCart.Text = "Added to Cart";

                            Image imgGreenStar = item.FindControl("imgStar") as Image;
                            imgGreenStar.Visible = true;

                        }

                    }
                }
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

            DataTable dtProducts;

            if (Session["ShopAdministrator"] != null)
            {
                dtProducts = (DataTable)Session["ShopAdministrator"];

            }
            else
            {
                dtProducts = new DataTable();
            }

            if (dtProducts.Rows.Count > 0)
            {
                txtTotalProducts.Text = dtProducts.Rows.Count.ToString();
                btnShoppingHeart.Text = dtProducts.Rows.Count.ToString();
                dlCartProducts.DataSource = dtProducts;
                dlCartProducts.DataBind();
                UpdateTotalBill();

                pnlMyCart.Visible = true;
                pnlCheckOut.Visible = true;
                pnlEmptyCart.Visible = false;
                pnlCategories.Visible = false;
                pnlProducts.Visible = false;
                pnlOrderPlacedSuccessfully.Visible = false;
            }
            else
            {
                pnlEmptyCart.Visible = true;
                pnlMyCart.Visible = false;
                pnlCheckOut.Visible = false;
                pnlCategories.Visible = false;
                pnlProducts.Visible = false;
                pnlOrderPlacedSuccessfully.Visible = false;

                dlCartProducts.DataSource = null;
                dlCartProducts.DataBind();
                txtTotalProducts.Text = "0";
                txtTotalPrice.Text = "0";
                btnShoppingHeart.Text = "0";


            }











            /*   string productids = string.Empty;
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
               */

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
                if (Session["ShopAdministrator"] != null)
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

        protected void lblLogo_Click(object sender, EventArgs e)
        {
            lblCategoryName.Text = "Popular Products At Shop";
            lblProducts.Text = "Products";



            pnlMyCart.Visible = false;
            pnlCheckOut.Visible = false;
            pnlCategories.Visible = true;
            pnlProducts.Visible = true;
            pnlEmptyCart.Visible = true;
            pnlOrderPlacedSuccessfully.Visible = false;

            GetProducts(0);
            HighlightCartProducts();

        }

        protected void btnRemoveFromCart_Click(object sender, EventArgs e)
        {
            string ProductID = Convert.ToInt16((((Button)sender).CommandArgument)).ToString();
            if (Session["ShopAdministrator"] != null)
            {
                DataTable dt = (DataTable)Session["ShopAdministrator"];

                DataRow drr = dt.Select("ProductID=" + ProductID + " ").FirstOrDefault();

                if (drr != null)
                    dt.Rows.Remove(drr);
                Session["ShopAdministrator"] = dt;
            }
            GetMyCart();
        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            string productids = string.Empty;
            DataTable dt;
            if (Session["ShopAdministrator"] != null)
            {
                dt = (DataTable)Session["ShopAdministrator"];

                ShoppingCart k = new ShoppingCart()
                {
                    CustomerName = txtCustomerName.Text,
                    CustomerEmailID = txtCustomerEmailID.Text,
                    CustomerAddress = txtCustomerAddress.Text,
                    CustomerPhoneNo = txtCustomerPhoneNo.Text,
                    TotalProducts = Convert.ToInt32(txtTotalProducts.Text),
                    TotalPrice = Convert.ToInt32(txtTotalPrice.Text),
                    ProductList = productids,
                    PaymentMethod = rblPaymentMethod.SelectedItem.Text
                };

                DataTable dtResult = k.SaveCustomerDetails();

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    ShoppingCart SaveProducts = new ShoppingCart()
                    {
                        CustomerID = Convert.ToInt32(dtResult.Rows[0][0]),
                        ProductID = Convert.ToInt32(dt.Rows[i]["ProductID"]),
                        TotalProducts = Convert.ToInt32(dt.Rows[i]["ProductQuantity"])
                    };
                    SaveProducts.SaveCustomerProducts();
                }

                Session.Clear();
                GetMyCart();

                lblTransactioNo.Text = "Your Transaction Number: " + dtResult.Rows[0][0];

                pnlOrderPlacedSuccessfully.Visible = true;
                pnlCheckOut.Visible = false;
                pnlCategories.Visible = false;
                pnlMyCart.Visible = false;
                pnlEmptyCart.Visible = false;
                pnlProducts.Visible = false;
                pnlEmptyCart.Visible = false;

                txtCustomerAddress.Text = string.Empty;
                txtCustomerEmailID.Text = string.Empty;
                txtCustomerName.Text = string.Empty;
                txtCustomerPhoneNo.Text = string.Empty;
                txtTotalPrice.Text = "0";
                txtTotalProducts.Text = "0";
            }
        }

        private string PopulateOrderEmailBody(string customerName, string transactionNo)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(Server.MapPath("~/OrderTemplate.html")))
            {
                body = reader.ReadToEnd();
            }

            body = body.Replace("{CustomerName}", customerName);
            body = body.Replace("{OrderNo}", transactionNo);
            body = body.Replace("{TransactionURL}", "http://www.ShoppingHeart.com?TrackYourOrder,aspxId=" + transactionNo);
            return body;
        }



        private void SendOrderPlaceAlert(string CustomerName, string CustomerEmailID, string TransactionNo)
        {
            
                string body = this.PopulateOrderEmailBody(CustomerName, TransactionNo);

            EmailEngine.SendEmail(CustomerEmailID, "Shopping -- Your OrderDetails", body);               
        }

    }
}