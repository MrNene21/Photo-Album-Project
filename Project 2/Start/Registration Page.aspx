<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration Page.aspx.cs" Inherits="Project_2.Start.Registration_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Form</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <link rel="stylesheet" type="text/css" href="../StyleSheets/StyleRegistration.css" />
    <style type="text/css">
    </style>
    </head>
<body>
    <form id="Register" runat="server">
        <asp:HiddenField ID="hfUserID" runat="server" />
        <asp:Panel ID="Panel1" runat="server" CssClass="panel">
            <br />
            <asp:Label ID="heading" runat="server" Text="Create an Account" CssClass="heading" Font-Bold="False" Font-Italic="False"></asp:Label>
            <asp:TextBox ID="txtFirstName" placeholder="First Name" runat="server" CssClass="txtFirstName"></asp:TextBox>
            <asp:TextBox ID="txtLastName" placeholder="Last Name" runat="server" CssClass="txtLastName"></asp:TextBox>
            <asp:TextBox ID="txtEmail" placeholder="Email Address" runat="server" CssClass="txtEmail"></asp:TextBox>
            <asp:TextBox ID="txtPassword" placeholder="Password" runat="server" CssClass="txtPassword" TextMode="Password"></asp:TextBox>
            <asp:TextBox ID="txtConfirmPassword" placeholder="Confirm Password" runat="server" CssClass="txtConfirmPassword" TextMode="Password"></asp:TextBox>
            <asp:Button ID="btnRegister" runat="server" CssClass="btnRegister" Text="Register" Width="133px" OnClick="btnRegister_Click"/>
            <asp:HyperLink runat="server" CssClass="hyperlink" NavigateUrl="~/Start/Login.aspx" Text="Back to sign in."></asp:HyperLink>
            <asp:RequiredFieldValidator runat="server" ErrorMessage="Enter First Name" CssClass="reqValidatorFName" ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator runat="server" ErrorMessage="Enter Last Name" CssClass="reqValidatorLName" ControlToValidate="txtLastName"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator runat="server" ErrorMessage="Invalid email!" ControlToValidate="txtEmail" CssClass="regExEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator runat="server" ErrorMessage="Enter password!" CssClass="reqValidatorPassword" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator runat="server" ErrorMessage="Confirm password!" CssClass="reqValidatorConfPass" ControlToValidate="txtConfirmPassword"></asp:RequiredFieldValidator>
            <asp:Label ID="lblMessage" runat="server" Text="" CssClass="lblMessage"></asp:Label>
        </asp:Panel>
    </form>
    </body>
</html>
