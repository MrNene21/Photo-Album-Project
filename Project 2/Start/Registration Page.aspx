<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration Page.aspx.cs" Inherits="Project_2.Start.Registration_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Form</title>
    <link rel="stylesheet" type="text/css" href="../StyleSheets/StyleRegistration.css" />
    <style type="text/css">
    </style>
    </head>
<body>
    <form id="Register" runat="server">
        <asp:Panel ID="Panel1" runat="server" CssClass="panel">
            <br />
            <asp:Label ID="heading" runat="server" Text="Create an Account" CssClass="heading" Font-Bold="False" Font-Italic="False"></asp:Label>
            <asp:TextBox ID="txtFirstName" placeholder="First Name" runat="server" CssClass="txtFirstName"></asp:TextBox>
            <asp:TextBox ID="txtLastName" placeholder="Last Name" runat="server" CssClass="txtLastName"></asp:TextBox>
            <asp:TextBox ID="txtEmail" placeholder="Email Address" runat="server" CssClass="txtEmail"></asp:TextBox>
            <asp:TextBox ID="txtPassword" placeholder="Password" runat="server" CssClass="txtPassword" TextMode="Password"></asp:TextBox>
            <asp:TextBox ID="txtConfirmPassword" placeholder="Confirm Password" runat="server" CssClass="txtConfirmPassword" TextMode="Password"></asp:TextBox>
            <asp:Button ID="btnRegister" runat="server" CssClass="btnRegister" Text="Register" Width="133px" />
        </asp:Panel>
    </form>
    </body>
</html>
