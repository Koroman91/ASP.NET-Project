<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucCustomerOrder.ascx.cs" Inherits="Shop.ucCustomerOrder" %>

<style type="text/css">
    .styleorderDetails{
        width: 600px;
        border: 1px ridge red;
    }
</style>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel3" runat="server">
    <ContentTemplate>
        <div align="center">
            <asp:Label ID="lblTransactionNo" runat="server" Style="font-weight: 700" Text="Transaction No :"></asp:Label>
            <asp:TextBox ID="txtTransactionNo" runat="server" Width="90px"></asp:TextBox>
            <asp:Button ID="btnGo" runat="server" Style="font-weight: 700" Text="Go" Width="36px"
                OnClick="btnGo_Click" />
             &nbsp;</div>
        <table align="center" cellspacing="1" style="width: 100%; background-color: #FFFFFF;">
            <tr>
                <td align="center">
                    <hr />
                    <asp:RadioButtonList ID="rblOrderDetails" runat="server" RepeatDirection="Horizontal"
                        AutoPostBack="true" OnSelectedIndexChanged="rblOrderDetails_SelectedIndexChanged">
                        <asp:ListItem Value="1" Selected="True">CustomerDetails</asp:ListItem>
                        <asp:ListItem Value="2">ProductDetails</asp:ListItem>
                        <asp:ListItem Value="3">DeliveryStatus</asp:ListItem>
                    </asp:RadioButtonList>
                    <hr />
                </td>
            </tr>
            <tr>
                 <td align="center">
                     <asp:Panel ID="Panel1" runat="server">
                         <table class="styleOrderDetails">
                             <tr>
                                 <td align="center" colspan="2">
                                   <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/CustomerDetails.png" Height="150px" />
                                    <hr />
                                 </td>
                             </tr>
                             <tr>
                                 <td align="right" style="width: 50%; padding-right: 30px;">
                                     Name :
                                 </td>
                                 <td align="left" style="width: 50%;">
                                     <asp:Label ID="lblCustomerName" runat="server"></asp:Label>
                                 </td>
                             </tr>
                              <tr>
                                 <td align="right" style="width: 50%; padding-right: 30px;">
                                     EmailId :
                                 </td>
                                 <td align="left" style="width: 50%;">
                                     <asp:Label ID="lblCustomerEmailId" runat="server"></asp:Label>
                                 </td>
                             </tr>
                             <tr>
                                 <td align="right" style="width: 50%; padding-right: 30px;">
                                     PhoneNo :
                                 </td>
                                 <td align="left" style="width: 50%;">
                                     <asp:Label ID="lblCustomerPhoneNo" runat="server"></asp:Label>
                                 </td>
                             </tr>
                             <tr>
                                 <td align="right" style="width: 50%; padding-right: 30px;">
                                     TotalProducts :
                                 </td>
                                 <td align="left" style="width: 50%;">
                                     <asp:Label ID="lblTotalProducts" runat="server"></asp:Label>
                                 </td>
                             </tr>
                             <tr>
                                 <td align="right" style="width: 50%; padding-right: 30px;">
                                     TotalPrice :
                                 </td>
                                 <td align="left" style="width: 50%;">
                                     <asp:Label ID="lblTotalPrice" runat="server"></asp:Label>
                                 </td>
                             </tr>
                             <tr>
                                 <td align="right" style="width: 50%; padding-right: 30px;" valign="top">
                                     Address :
                                 </td>
                                 <td align="left" style="width: 50%;">
                                     <asp:TextBox ID="txtCustomerAddress" runat="server" Height="73px" ReadOnly="True"
                                         TextMode="MultiLine" Width="260px"></asp:TextBox>
                                 </td>
                             </tr>
                              <tr>
                                 <td align="right" style="width: 50%; padding-right: 30px;" valign="top">
                                     PaymentMethod :
                                 </td>
                                 <td align="left" style="width: 50%;">
                                     <asp:Label ID="lblPaymentMethod" runat="server"></asp:Label>
                                 </td>
                             </tr>
                              <tr>
                                 <td align="center" style="width: 50%;">
                                     &nbsp;
                                 </td>
                                 <td align="left" style="width: 50%;">
                                     &nbsp;
                                 </td>
                             </tr>
                             <tr>
                                 <td align="center" style="width: 50%;">
                                     &nbsp;
                                 </td>
                                 <td align="left" style="width: 50%;">
                                     &nbsp;
                                 </td>
                             </tr>
                         </table>
                     </asp:Panel>
                     <asp:Panel ID="Panel2" runat="server">
                         <table class="styleOrderDetails">
                             <tr>
                                 <td align="center">
                                     <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/CustomerIcon.png" Height="150px" />
                                     <hr />
                                 </td>
                            </tr>
                             <tr>
                                 <td align="center">
                                     <asp:DataList ID="dlProducts" runat="server" Font-Bold="False" Font-Italic="False"
                                         Font-OverLine="False" Font-Strikeout="False" Font-Underline="False" RepeatColumns="3"
                                         Width="500px">
                                         <ItemTemplate>
                                             <div align="center">
                                                 <table cellspacing="1" class="style4" style="border: 1px ridge #9900FF">
                                                     <tr>
                                                         <td style="border-bottom-style: ridge; border-width: 1px; border-color: #000000" colspan="2">
                                                             <asp:Label ID="lblProductName" runat="server" Style="font-weight: 700" Text='<%# Eval("Name")%>'></asp:Label>
                                                         </td>
                                                     </tr>
                                                     <tr>
                                                         <td colspan="2">
                                                             <img alt="" src='<%# Eval("ImageUrl")%>' runat="server" id="imgProductPhoto" style="border: ridge 1px black;
                                                              width: 173px; height: 160px;" />
                                                         </td>
                                                     </tr>
                                                     <tr>
                                                         <td>
                                                              Price:<asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price")%>'></asp:Label>
                                                         </td>
                                                         <td>
                                                             Quantity:<asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("ProductQuantity") %>'></asp:Label>
                                                         </td>
                                                     </tr>
                                                 </table>
                                             </div>
                                         </ItemTemplate>
                                     </asp:DataList>
                                 </td>
                             </tr>
                         </table>
                     </asp:Panel>
                     <asp:Panel ID="Panel3" runat="server">
                         <table class="styleOrderDetails">
                             <tr>
                                 <td align="center">
                                     <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/DeliveryStatus.png" Height="150px" />
                                     <hr />
                                 </td>
                             </tr>
                             <tr>
                                 <td align="center">
                                      <asp:GridView ID="gvOrderStatus" runat="server" CellPadding="4" ForeColor="Black"
                                        GridLines="Horizontal" Width="100%" BackColor="White" 
                                        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                        <RowStyle HorizontalAlign="Center"/>
                                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                        <SortedAscendingHeaderStyle BackColor="#484848" />
                                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                        <SortedDescendingHeaderStyle BackColor="#242121" />
                                        </asp:GridView>
                                 </td>
                             </tr>
                             <tr>
                                 <td align="center">
                                     <asp:TextBox ID="txtStatus" runat="server" Width="300px"></asp:TextBox>
                                     &nbsp;<asp:Button ID="btnAdd" runat="server" Style="font-weight: 700" Text="Add"
                                     Width="36px" OnClick="btnAdd_Click" />
                                 </td>
                             </tr>
                         </table>
                     </asp:Panel>
                     <asp:Panel ID="Panel4" runat ="server">
                         <table class="styleOrderDetails">
                             <tr>
                                 <td align="center">
                                     <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/NoResults.png" Height="150px" />
                                     <hr />
                                 </td>
                             </tr>
                         </table>
                     </asp:Panel>
                 </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>
