<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/AdminMaster.Master" AutoEventWireup="true" CodeBehind="CustomerOrders.aspx.cs" Inherits="Shop.Administrator.CustomerOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
        <asp:Label ID="lblTitle" runat="server" Style="font-weight: 700">Customer Orders</asp:Label>
        <hr />
    </div>
    <table align="center" cellspacing="1" style="width: 100%; background-color: #FFFFFF;">
        <tr>
            <td align="center">
                <asp:GridView ID="gvCustomerOrders" runat="server" BackColor="White"
                BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3"
                CellSpacing="1" GridLines="None" Width="100%" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" ItemStyle-Width="100" />
                    <asp:BoundField DataField="CustomerName" HeaderText="Name" ItemStyle-Width="150" />
                    <asp:BoundField DataField="CustomerPhoneNo" HeaderText="PhoneNo" ItemStyle-Width="20" />
                    <asp:BoundField DataField="TotalProducts" HeaderText="Products" ItemStyle-Width="150" />
                    <asp:BoundField DataField="TotalPrice" HeaderText="Price" ItemStyle-Width="150" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Id", "~/Administrator/OrderDetails.aspx?Id={0}") %>'
                                Text="View Details" Target="_blank" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="true" ForeColor="#E7E7FF" />
                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#DEDFDE" ForeColor="Black" HorizontalAlign="Center"/>
                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#59489C" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#33276A" />
                </asp:GridView>
            </td>
        </tr>
    </table> 
</asp:Content>
