<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project_2.Start.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign In Form</title>
    <link rel="stylesheet" type="text/css" href="../StyleSheets/StyleLogin.css" />
    <style type="text/css">     
    </style>
    </head>
<body>
    <form id="Login" runat="server">
        <asp:Panel ID="Panel1" runat="server" CssClass="panel">
            <br />
            <asp:Label ID="heading" runat="server" Text="Sign in to continue" CssClass="heading" Font-Bold="False" Font-Italic="False"></asp:Label>
            <asp:TextBox ID="txtEmail" placeholder="Username" runat="server" CssClass="txtEmail"></asp:TextBox>
            <asp:TextBox ID="txtPassword" placeholder="Password" runat="server" CssClass="txtPassword" TextMode="Password"></asp:TextBox>
            <asp:Button ID="btnSignIn" runat="server" CssClass="btnSignIn" Text="Sign In" Width="133px" />
            <asp:HyperLink runat="server" CssClass="hypertext" Text="Create an account."></asp:HyperLink>     
        </asp:Panel>
    </form>
    </body>
</html>
