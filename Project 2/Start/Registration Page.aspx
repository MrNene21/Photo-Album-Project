﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration Page.aspx.cs" Inherits="Project_2.Start.Registration_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign In Form</title>
    <link rel="stylesheet" type="text/css" href="../StyleSheets/StyleLogin.css" />
    <style type="text/css">     
    </style>
    </head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="Panel1" runat="server" CssClass="panel">
            <br />
            <asp:Label ID="heading" runat="server" Text="Sign in to continue" CssClass="heading" Font-Bold="False" Font-Italic="False"></asp:Label>
            <br />
            <br />
            <br />
            <asp:TextBox ID="txtEmail" placeholder="Email" runat="server" CssClass="txtEmail"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:TextBox ID="txtPassword" placeholder="Password" runat="server" CssClass="txtPassword"></asp:TextBox>
            <asp:Button ID="btnSignIn" runat="server" CssClass="btnSignIn" Text="Sign In" Width="133px" />
            <br />
            <asp:HyperLink runat="server" ForeColor="#000099">HyperLink</asp:HyperLink>
            
        </asp:Panel>
    </form>
    </body>
</html>
