<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddNewProducts.aspx.cs" Inherits="Shop.Administrator.AddNewProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">        
            <asp:Label ID="lblTitle" runat="server" Style="font-weight: 700">Add New Products</asp:Label>
        <hr />
    </div>
    <table align="center" cellspacing="1" style="width: 100%; background-color: #FFFFFF;">
        <tr>
            <td style="width: 50%; padding-left: 100px;" align="left">
                Product Name :
            </td>
            <td style="width: 50%;" align="left">
                <asp:TextBox ID="txtProductName" runat="server" Width="212px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="txtProductName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
              <tr>
            <td style="width: 50%; padding-left: 100px;" align="left">
                &nbsp;
            </td>
            <td style="width: 50%;" align="left">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td style="width: 50%; padding-left: 100px;" align="left">
                Product Category :
            </td>
            <td style="width: 50%;" align="left">
                <asp:DropDownList ID="ddlCategory" runat="server" Width="212px" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
              <tr>
            <td style="width: 50%; padding-left: 100px;" align="left">
                &nbsp;
            </td>
            <td style="width: 50%;" align="left">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td style="width: 50%; padding-left: 100px;" align="left">
                Product Description :
            </td>
            <td style="width: 50%;" align="left">
                <asp:TextBox ID="txtProductDescription" runat="server" Width="212px" Height="80px" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
          <tr>
            <td style="width: 50%; padding-left: 100px;" align="left">
                Product Image :
            </td>
            <td style="width: 50%;" align="left">
                <asp:FileUpload ID="uploadProductPhoto" runat="server" />
            </td>
        </tr>
              <tr>
            <td style="width: 50%;" align="right">
                &nbsp;
            </td>
            <td style="width: 50%;" align="left">
                &nbsp;
            </td>
        </tr>
         <tr>
            <td style="width: 50%; padding-left: 100px;" align="left">
                Product Price :
            </td>
            <td style="width: 50%;" align="left">
                <asp:TextBox ID="txtProductPrice" runat="server" Width="212px"></asp:TextBox>
            </td>
        </tr>
              <tr>
            <td style="width: 50%;" align="right">
                &nbsp;
            </td>
            <td style="width: 50%;" align="left">
                &nbsp;
            </td>
        </tr>
         <tr>
             <td style="width: 50%; padding-left: 100px;" align="left">
                 Product Quantity :
             </td>
             <td style="width: 50%;" align="left">
                 <asp:TextBox ID="txtProductQuantity" runat="server" Width="212px"></asp:TextBox>
             </td>
         </tr>
        <tr>
            <td style="width: 50%;" align="right">
                &nbsp;
            </td>
            <td style="width: 50%;" align="left">
                &nbsp;
            </td>
        </tr>       
        <tr>
            <td style="width: 50%;" align="right">
                &nbsp;
            </td>
            <td style="width: 50%;" align="left">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" Width="100px" Height="30px"
                    OnClick="btnSubmit_Click" />
            </td>
        </tr>
        </table>
</asp:Content>
