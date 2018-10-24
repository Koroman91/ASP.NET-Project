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
    public partial class IncomeReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetIncomeReport();
            }                   
        }

        protected void rblIncomeFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetIncomeReport();

        }
            
        public void GetIncomeReport()
        {
            ShoppingCart k = new ShoppingCart()
            {
                Flag = Convert.ToInt32(rblIncomeFilter.SelectedValue)
            };

            DataTable dt = k.GetIncomeReport();
            if (dt.Rows.Count > 0)
            {
                gvIncomeReport.Visible = true;
                gvIncomeReport.DataSource = dt;
                gvIncomeReport.DataBind();

                object ProductSold;
                ProductSold = dt.Compute("Sum(TotalProducts)", "");

                object TotalIncome;
                TotalIncome = dt.Compute("Sum(TotalPrice)", "");

                lblIncome.Text = "Products Sold :" + ProductSold + " Total Income :" + TotalIncome;

            }
            else
            {
                gvIncomeReport.Visible = false;
                lblIncome.Text = "No Records Available";
            } 
        }
    }
}