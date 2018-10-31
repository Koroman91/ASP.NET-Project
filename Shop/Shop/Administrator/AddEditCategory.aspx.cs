﻿using Shop.BusinessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shop.Administrator
{
    public partial class AddEditCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ShoppingCart k = new ShoppingCart
            {
                CategoryName = txtCategoryName.Text
            };
            k.AddNewCategory();
            txtCategoryName.Text = string.Empty;
            Response.Redirect("~/Administrator/AddNewProducts.aspx");
        }
    }
}