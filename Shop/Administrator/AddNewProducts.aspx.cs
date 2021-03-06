﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Shop.BusinessLayer;
using System.Data;
using System.Data.SqlClient;

namespace Shop.Administrator
{
    public partial class AddNewProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetCategories();
            

            AddSubmitEvent();

            if (Request.QueryString["alert"] == "success")
            {
                Response.Write("<script>alert('Record Saved Sucessfully.');</script>");
            }
         }

        }

        private void AddSubmitEvent()
        {
            UpdatePanel updatePanel = Page.Master.FindControl("AdminUpdatePanel") as UpdatePanel;
            UpdatePanelControlTrigger trigger = new PostBackTrigger();
            trigger.ControlID = btnSubmit.UniqueID;

            updatePanel.Triggers.Add(trigger);
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
            }
        }



        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (uploadProductPhoto.PostedFile !=null)
            {
                SaveProductPhoto();

                ShoppingCart k = new ShoppingCart()
                {
                    ProductName = txtProductName.Text,
                    ProductImage = "~/ProductImages/" + uploadProductPhoto.FileName,
                    ProductPrice = txtProductPrice.Text,
                    ProductDescription = txtProductDescription.Text,
                    CategoryID = Convert.ToInt32(ddlCategory.SelectedValue),
                    TotalProducts = Convert.ToInt32(txtProductQuantity.Text)
                };
                k.AddNewProduct();
                ClearText();
                Response.Redirect("~/Administrator/AddNewProducts.aspx?alert=success");
            }
            else
            {
                Response.Write("<script>alert('Please Upload Photo');</script>");
            }
        }

        private void ClearText()
        {
            uploadProductPhoto = null;
            txtProductName.Text = string.Empty;
            txtProductPrice.Text = string.Empty;
            txtProductDescription.Text = string.Empty;
            txtProductQuantity.Text = string.Empty;
        }

        private void SaveProductPhoto()
        {
            if (uploadProductPhoto.PostedFile != null)
            {


                string filename = uploadProductPhoto.PostedFile.FileName.ToString();
                string fileExt = System.IO.Path.GetExtension(uploadProductPhoto.FileName);

                if (filename.Length > 96)
                {
                    //Alert.Show("image name should not exeed 96 characters!");
                }
                else if (fileExt != ".jpeg" && fileExt != ".jpg" && fileExt != ".png" && fileExt != ".bmp")
                {
                    // Alert.Show("Only jpeg,jpg, bmp & png formats are allowed!");
                }
                else if (uploadProductPhoto.PostedFile.ContentLength > 4000000)
                {
                    // Alert.Show("Image size should not be greater than 4MB!");
                }
                else
                {
                    uploadProductPhoto.SaveAs(Server.MapPath("~/ProductImages/" + filename));
                }
            }
            }





        /*  public DataTable GetCategories()
          {
              SqlParameter[] parameters = new SqlParameter[0];
              DataTable dt = DataLayer.DataAccess.ExecuteDTByProcedure("SP_GetAllCategories", parameters);
          } */
    }
}