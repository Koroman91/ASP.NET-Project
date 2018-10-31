<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Shop.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 900px;
        }
         .style2
        {
            width: 633px;
            text-align: left;
        }
          .style3
        {
            width: 257px;
            text-align: center;
        }
         .style4
        {
            width: 185px;
            text-align: center;
        }
          .style6
        {
            width: 260px;
            text-align: left;
        }
           .style7
        {
            width: 427px;
            text-align: center;
        }
             .style8
        {
            width: 108px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <table align="center" class="style1">
                    <tr>
                        <td>
                            <table align="center" class="style1" style="border-bottom-style: ridge; border-width: medium;
                               border-color: #9933FF">
                    <tr>
                        <td class="style8" align="center" rowspan="2">
                            <asp:Image ID="Image1" runat="server" Height="53px" ImageUrl="~/Images/ShopCartProject.png"
                            Width="72px" />
                            &nbsp;
                        </td>
                        <td class="style6" rowspan="2">
                            <asp:LinkButton ID="lblLogo" runat="server" Text="TechShop" Font-Names="Eras Demi ITC"   
                            Font-Bold="True" Font-Size="35pt" ForeColor="#6600CC" OnClick="lblLogo_Click"></asp:LinkButton>
                            <br  />
                        </td>
                        <td class="style7" rowspan="2">
                            <asp:Image ID="Image3" runat="server" Height="67px" ImageUrl="~/Images/shoppingcart.png"
                            Width="282px" />                           
                        </td>
                         <td rowspan="2" align="right">
                            <asp:Image ID="Image2" runat="server" Height="53px" ImageUrl="~/Images/shopping-cart-icon.png"
                            Width="70px" />                     
                        </td>
                         <td align="left">
                            <asp:LinkButton ID="btnShoppingHeart" runat="server" Font-Underline="False" Font-Size="20pt" 
                            ForeColor="Red" OnClick="btnShoppingHeart_Click">0</asp:LinkButton>                       
                        </td>
                   </tr>
                   <tr>
                       <td class="style3" valign="middle">
                           &nbsp;
                       </td>
                   </tr>
                   </table>
                   </td>
                   </tr>
                    <tr>
                        <td>
                            <table align="center" class="style1" style="border: thin ridge  #9900FF">
                                <tr>
                                    <td class="style2">
                                        &nbsp;
                                        <asp:Label ID="lblCategoryName" runat="server" Font-Size="15pt" ForeColor="#6600CC"></asp:Label>
                                    </td>
                                    <td class="style3" style="border-left-style: ridge; border-width: thin; border-color: #9900FF">
                                        &nbsp;
                                        <asp:Label ID="lblProducts" runat="server" Text="Products" Font-Size="15pt" ForeColor="#6600CC"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                      <td>
                          <table align="center" class="style1">
                              <tr>
                                  <td class="style2" valign="top">
                                      <asp:Panel ID="pnlProducts" runat="server" ScrollBars="Auto" Height="500px" BorderColor="Black"
                                    BorderStyle="Inset" BorderWidth="1px">
                                      <asp:DataList ID="dlProducts" runat="server" RepeatColumns="3" Width="600px" Font-Bold="False"
                                        Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False">
                                         <ItemTemplate>
                                             <div align="left">
                                                 <table cellspacing="1" class="style4" style="border: 1px ridge #9900FF">
                                                     <tr>
                                                         <td style="border-bottom-style: ridge; border-width: 1px; border-color: #000000">
                                                        <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("Name")%>' Style="font-weight: 700"></asp:Label>
                                                         </td>
                                                     </tr>
                                                    <tr>
                                                        <td>
                                                            <img alt="" src='<%# Eval("ImageUrl") %>' runat="server" id="imgProductPhoto" style="border: ridge 1px black;
                                                            width: 173px; height: 160px;" />
                                                        </td>
                                                    </tr>
                                                     <tr>
                                                         <td>
                                                             Price:<asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                                             <asp:Image ID="imgStar" runat="server" Visible="false" ImageUrl="~/Images/Star.png" />
                                                             Stock:&nbsp;
                                                             <asp:Label ID="lblAvailableStock" runat="server" Text='<%# Eval("AvailableStock") %>'
                                                                 ToolTip="Available Stock" ForeColor="Red" Font-Bold="true"></asp:Label>
                                                             <asp:HiddenField ID="hfProductID" runat="server" Value='<%# Eval("ProductID") %>' />
                                                         </td>
                                                     </tr>
                                                     <tr>
                                                         <td>
                                                         <asp:Button ID="btnAddToCart" runat="server" CommandArgument='<%# Eval("ProductID") %>'
                                                         OnClick="btnAddToCart_Click" Text="Add To Cart" Width="100%" BorderColor="Black"
                                                         BorderStyle="Inset" BorderWidth="1px" CausesValidation="false" />
                                                        </td>
                                                     </tr>
                                                 </table>
                                             </div>
                                         </ItemTemplate> 
                                          <ItemStyle Width="33%" />
                                         </asp:DataList> 
                                         </asp:Panel> 
                                      <asp:Panel ID="pnlMyCart" runat="server" ScrollBars="Auto" Height="500px" BorderColor="Black"
                                         BorderStyle="Inset" BorderWidth="1px" Visible="False">
                                          <table align="center" cellspacing="1">
                                              <tr>
                                                  <td align="center">
                                                      <asp:Label ID="lblAvailableStockAlert" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
                                                      <asp:DataList ID="dlCartProducts" runat="server" RepeatColumns="3" Font-Bold="false"
                                                        Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False"
                                                        Width="551px">
                                                <ItemTemplate>
                                                    <div align="left">
                                                        <table cellspacing="1" style="border: 1px ridge #9900FF; text-align: center; width: 172px;">
                                                            <tr>
                                                                <td style="border-bottom-style: ridge; border-width: 1px; border-color: #000000">
                                                                <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("Name") %>' Style="font-weight: 700"></asp:Label>                                                                  
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                        <td>
                                                            <img alt="" src='<%# Eval("ImageUrl") %>' runat="server" id="imgProductPhoto" style="border: ridge 1px black;
                                                            width: 157px; height: 130px;" />
                                                        </td>
                                                    </tr>
                                                     <tr>
                                                         <td>
                                                             AvailableStock:&nbsp;
                                                             <asp:Label ID="lblAvailableStock" runat="server" Text='<%# Eval("AvailableStock") %>'
                                                                 ToolTip="Available Stock" ForeColor="Red" Font-Bold="true"></asp:Label>
                                                             <br />
                                                             Price:<asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                                             &nbsp;x&nbsp;
                                                             <asp:TextBox ID="txtProductQuantity" runat="server" Width="10px" Height="10px" MaxLength="1"
                                                                 OnTextChanged="txtProductQuantity_TextChanged" AutoPostBack="true" Text='<%# Eval("ProductQuantity")%>'></asp:TextBox>
                                                             <asp:HiddenField ID="hfProductID" runat="server" Value='<%# Eval("ProductID") %>' />
                                                         </td>
                                                     </tr>
                                                        <tr>
                                                        <td>
                                                            <hr />
                                                            <asp:Button ID="btnRemoveFromCart" runat="server" CommandArgument='<%# Eval("ProductID") %>'
                                                            Text="RemoveFromCart" Width="100%" BorderColor="Black" BorderStyle="Inset" BorderWidth="1px"
                                                                OnClick="btnRemoveFromCart_Click" CausesValidation="false" />
                                                        </td>
                                                        </tr>
                                                            </table>
                                                    </div>
                                                </ItemTemplate>
                                                  <ItemStyle Width="33%"/>
                                               </asp:DataList> 
                                                      </td>
                                                  </tr>
                                              <tr>
                                                  <td align="center">
                                                      &nbsp;
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td align="center">
                                                      &nbsp;
                                                  </td>
                                              </tr>
                                            </table>
                                         </asp:Panel>  
                                   </td>            
                                  <td class="style3" valign="top" align="center">
                                      <asp:Panel ID="pnlCategories" runat="server" ScrollBars="Auto" Height="500px" BorderColor="Black"
                                     BorderStyle="Inset" BorderWidth="1px">
                                     <asp:DataList ID="dlCategories" runat="server" BackColor="White" BorderColor="#CCCCCC"
                                     BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal"
                                     Width="252px">
                                     <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                     <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />                                         
                                     <ItemTemplate>
                                         <asp:LinkButton ID="lbtnCategory" runat="server" Text='<%# Eval("CategoryName") %>'
                                         OnClick="lbtnCategory_Click" CommandArgument='<%# Eval("CategoryID") %>'></asp:LinkButton>
                                     </ItemTemplate>
                                         <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                    </asp:DataList>
                                    </asp:Panel>  
                                      <asp:Panel ID="pnlCheckOut" runat="server" ScrollBars="Auto" Height="500px" BorderColor="Black"
                                          BorderStyle="Inset" BorderWidth="1px" Visible="false">
                                          <table style="width: 258px;">
                                              <tr>
                                                  <td align="left">
                                                      Name:
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td>
                                                      <asp:TextBox ID="txtCustomerName" runat="server" Width="231px"></asp:TextBox>
                                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCustomerName"
                                                          ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td align="left">
                                                      PhoneNo:
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td>
                                                      <asp:TextBox ID="txtCustomerPhoneNo" runat="server" Width="231px" MaxLength="10"></asp:TextBox>
                                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCustomerPhoneNo"
                                                          ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td align="left">
                                                      EmailID
                                                  </td>
                                              </tr>
                                               <tr>
                                                  <td>
                                                      <asp:TextBox ID="txtCustomerEmailID" runat="server" Width="231px"></asp:TextBox>
                                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCustomerEmailID"
                                                          ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                  </td>
                                              </tr>
                                               <tr>
                                                  <td align="left">
                                                      Address
                                                  </td>
                                              </tr>
                                               <tr>
                                                  <td align="left">
                                                      &nbsp;<asp:TextBox ID="txtCustomerAddress" runat="server" Width="227px" Height="81px"
                                                          TextMode="MultiLine"></asp:TextBox>                                                    
                                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCustomerAddress"
                                                          ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                  </td>
                                              </tr>
                                               <tr>
                                                  <td align="left">
                                                      Total Products:
                                                  </td>
                                              </tr>
                                               <tr>
                                                  <td align="center">
                                                      &nbsp;<asp:TextBox ID="txtTotalProducts" runat="server" ReadOnly="true" Width="231px"></asp:TextBox>                                                    
                                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtTotalProducts"
                                                          ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                  </td>
                                              </tr>
                                               <tr>
                                                  <td align="left">
                                                      Total Price:
                                                  </td>
                                              </tr>
                                               <tr>
                                                  <td>
                                                      <asp:TextBox ID="txtTotalPrice" runat="server" ReadOnly="true" Width="231px"></asp:TextBox>                                                    
                                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtTotalPrice"
                                                          ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                  </td>
                                              </tr>
                                               <tr>
                                                  <td align="left">
                                                      Payment Mode:
                                                  </td>
                                              </tr>
                                               <tr>
                                                  <td align="left">
                                                      <asp:RadioButtonList ID="rblPaymentMethod" runat="server">
                                                          <asp:ListItem Value="1" Selected="True">1.Cash on Delivery</asp:ListItem>
                                                          <asp:ListItem Value="2">2. Payment Gateway</asp:ListItem>
                                                      </asp:RadioButtonList>
                                                  </td>
                                              </tr>
                                               <tr>
                                                  <td>
                                                      <br />
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td>
                                                      <asp:Button ID="btnPlaceOrder" runat="server" OnClick="btnPlaceOrder_Click" Style="font-weight: 700"
                                                          Text="PlaceOrder" Width="90px" />                                            
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td>
                                                      <asp:RegularExpressionValidator ID="RegualarExpressionValidator1" runat="server" ControlToValidate="txtCustomerEmailID"
                                                          ErrorMessage="Please Enter Valid EmailID" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                  </td>
                                              </tr>
                                          </table>
                                      </asp:Panel>                              
                                  </td>
                              </tr>
                              <tr>
                                  <td colspan="2">
                                      <asp:Panel ID="pnlEmptyCart" runat="server" Visible="false">
                                          <div style="text-align: center;">
                                              <br />
                                              <br />
                                              <br />
                                              <br />
                                              <br />
                                          <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/EmptyShoppingCart.jpg" Width="500px" />
                                              <br />
                                              <br />
                                              <br />
                                              <br />
                                              <br />
                                          </div>
                                      </asp:Panel>
                                      <asp:Panel ID="pnlOrderPlacedSuccessfully" runat="server" Visible="false">
                                          <div style="text-align: center;">
                                              <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/HappyShopping.jpg" Width="500px" /><br />
                                              <br />
                                              <label>
                                                  Order Places Successfully.</label><br />
                                              <br />
                                              Transaction Details Are Sent At EmailId Provided By You.<br />
                                              <br />
                                              <br />
                                              <asp:Label ID="lblTransactioNo" runat="server" Style="font-weight: 700"></asp:Label>
                                              <br />
                                              <br />
                                              <br />
                                              <a href="TrackYourOrder.aspx" target="_blank">TrackYourTransactionDetailsHere</a>
                                              <br />
                                              <br />
                                              <br />
                                          </div>
                                      </asp:Panel>
                                  </td>
                              </tr>
                              <tr>
                                  <td colspan="2" align="center" style="border: thin ridge #9900FF">
                                      &nbsp;&copy; <a href="https://github.com/Koroman91">Stefan Korolija</a>
                                      || <a href="Administrator/Login.aspx" target="_blank">AdminPanel</a> || <a href="TrackYourOrder.aspx" target="_blank">TrackOrderStatus</a>
                                  </td>
                              </tr>
                          </table>
                </td>
                </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
