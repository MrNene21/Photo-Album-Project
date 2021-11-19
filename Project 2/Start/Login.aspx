<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project_2.Start.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign In Form</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <link rel="stylesheet" type="text/css" href="../StyleSheets/StyleLogin.css" />
    <style type="text/css">     
    </style>
    </head>
<body>
    <form id="Login" runat="server">
        <asp:Panel ID="Panel1" runat="server" CssClass="panel">
            <br />
            <asp:Label ID="heading" runat="server" Text="Sign in to continue" CssClass="heading" Font-Bold="False" Font-Italic="False"></asp:Label>
            <asp:TextBox ID="txtEmail" placeholder="Email address" runat="server" CssClass="txtEmail"></asp:TextBox>
            <asp:TextBox ID="txtPassword" placeholder="Password" runat="server" CssClass="txtPassword" TextMode="Password"></asp:TextBox>
            <asp:Button ID="btnSignIn" runat="server" CssClass="btnSignIn" Text="Sign In" Width="133px" OnClick="btnSignIn_Click" />
            <asp:HyperLink runat="server" CssClass="hypertext" Text="Create an account." NavigateUrl="~/Start/Registration Page.aspx"></asp:HyperLink>
            <%--<asp:CheckBox runat="server" CssClass="checkbox" ID="checkBoxShow" OnCheckedChanged="checkBoxShow_CheckedChanged"></asp:CheckBox>
            <asp:Label runat="server" Text="Show password" CssClass="lblShowpassword" ID="lblShowPassword"></asp:Label>--%>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid email!" CssClass="regExValidator" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter password!" CssClass="reqFValidator" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
            <asp:Label runat="server" ID="lblMessage" CssClass="lblMessage"></asp:Label>

        </asp:Panel>
    </form>
    </body>
</html>
