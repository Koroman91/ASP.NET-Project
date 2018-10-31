<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="Shop.Administrator.OrderDetails" %>

<%@ Register Src="../ucCustomerOrder.ascx" TagName="ucCustomerOrder" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .styleOrderDetails
        {
            width: 600px;
            border: 1px ridge red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
        <asp:Button ID="btnClear" runat="server"
            Text="Clear & Search Other Transaction" OnClick="btnClear_Click" Width="247px"
            Height="30px" Style="font-weight: 700" />
    </div>
        <hr />
        <br />
        <uc1:ucCustomerOrder ID="ucCustomerOrder1" runat="server" />
    </form>
</body>
</html>
