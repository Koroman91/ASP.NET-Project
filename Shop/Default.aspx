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
                            <asp:LinkButton ID="lblLogo" runat="server" Text="Shopping" Font-Names="Eras Demi ITC"   
                            Font-Size="20pt" ForeColor="#6600CC" OnClick="lblLogo_Click"></asp:LinkButton>
                            <br  />
                            Let's shopping!!!
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
                                        <asp:Label ID="lblCategoryName" runat="server" Front-Size="15pt" ForeColor="#6600CC"></asp:Label>
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
                                                            <img alt="" src="<%# Bind('ImageUrl') %>" runat="server" id="imgProductPhoto" style="border: ridge 1px black;
                                                            width: 173px; height: 160px;" />
                                                        </td>
                                                    </tr>
                                                     <tr>
                                                         <td>
                                                             Price:<asp:Label ID="lblPrice" runat="server" Text="<%# Bind('Price') %>"></asp:Label>
                                                         </td>
                                                     </tr>
                                                     <tr>
                                                         <td>
                                                         <asp:Button ID="btnAddToCart" runat="server" CommandArgument="<%# Bind('ProductID') %>"
                                                         OnClick="btnAddToCart_Click" Text="Add To Cart" Width="100%" BorderColor="Black"
                                                         BorderStyle="Inset" BorderWidth="1px" />
                                                        </td>
                                                     </tr>
                                                 </table>
                                             </div>
                                         </ItemTemplate> 
                                         </asp:DataList> 
                                         </asp:Panel> 
                                      <asp:Panel ID="pnlMyCart" runat="server" ScrollBars="Auto" Height="500px" BorderColor="Black"
                                         BorderStyle="Inset" BorderWidth="1px" Visible="false">
                                          <table align="center" cellspacing="1">
                                              <tr>
                                                  <td align="center">
                                                      <asp:DataList ID="dlCartProducts" runat="server" RepeatColumns="3" Font-Bold="false"
                                                        Font-Italic="false" Font-Overline="false" Font-Strikeout="false" Font-Underline="false"
                                                        Width="551px">
                                                <ItemTemplate>
                                                    <div align="left">
                                                        <table cellspacing="1" style="border: 1px ridge #9900FF; text-align: center; width: 172px;"
                                                            <tr>
                                                                <td style="border-bottom-style: ridge; border-width: 1px; border-color: #000000">
                                                                <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("Name") %>' Style="font-weight: 700"></asp:Label>                                                                  
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                        <td>
                                                            <img alt="" src="<%# Bind('ImageUrl') %>" runat="server" id="imgProductPhoto" style="border: ridge 1px black;
                                                            width: 112px; height: 100px;" />
                                                        </td>
                                                    </tr>
                                                     <tr>
                                                         <td>
                                                             Price:<asp:Label ID="lblPrice" runat="server" Text="<%# Bind('Price') %>"></asp:Label>
                                                         </td>
                                                     </tr>
                                                        <tr>
                                                        <td>
                                                            <asp:Button ID="btnRemoveFromCart" runat="server" CommandArgument="<%# Bind('ProductID') %>"
                                                            Text="RemoveFromCart" Width="100%" BorderColor="Black" BorderStyle="Inset" BorderWidth="1px"
                                                                OnClick="btnRemoveFromCart_Click" />
                                                        </td>
                                                        </tr>
                                                            </table>
                                                    </div>
                                                </ItemTemplate>
                                               </asp:DataList> 
                                         </asp:Panel>  
                                   </td>            
                                  <td class="style3" valign="top" align="center">
                                      <asp:Panel ID="pnlCategories" runat="server" ScrollBars="Auto" Heigh="500px" BorderColor="Black"
                                     BorderStyle="Inset" BorderWidth="1px">
                                     <asp:DataList ID="dlCategories" runat="server" BackColor="White" BorderColor="#CCCCCC"
                                     BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal"
                                     Width="252px">
                                     <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                     <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                     <ItemTemplate>
                                         <asp:LinkButton ID="lbtnCategory" runat="server" Text="<%# Bind('CategoryName') %>"
                                         OnClick="lbtnCategory_Click" CommandArgument="<%# Bind('CategoryID') %>"></asp:LinkButton>
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
                                          </table>
                                      </asp:Panel>                              
                                  </td>
                              </tr>
                              <tr>
                                  <td colspan="2" align="center" style="border: thin ridge #9900FF">
                                      &nbsp;&copy; <a href="">Stefan Korolija</a>
                                      || <a href="Admin/Login.aspx">AdminPanel</a>
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
