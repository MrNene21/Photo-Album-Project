<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project_2.Start.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign In Form</title>
    <link rel="stylesheet" type="text/css" href="../StyleSheets/StyleLogin.css" />
    <style type="text/css">
        .auto-style1 {
            background-color: white;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translateX(-50%) translateY(-50%);
            width: 502px;
            height: 272px;
        }
        .auto-style2 {
            width: 187px;
            margin: 0 auto;
            position: absolute;
            text-align: center;
            left: 147px;
            top: 76px;
            right: 160px;
            height: 30px;
        }
        .auto-style3 {
            width: 187px;
            margin: 0 auto;
            position: absolute;
            text-align: center;
            left: 148px;
            top: 119px;
            height: 30px;
        }
        .auto-style4 {
            color: lightblue;
            border-style: none;
            border-color: inherit;
            border-width: medium;
            background-color: deepskyblue;
            color: black;
            padding: 9px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 18px;
            margin: 4px 2px 4px 182px;
            border-radius: 18px;
            font-family: 'Times New Roman', Times, serif;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="Panel1" runat="server" CssClass="auto-style1">
            <br />
            <asp:Label ID="heading" runat="server" Text="Sign in to continue" CssClass="heading" Font-Bold="True"></asp:Label>
            <br />
            <br />
            <br />
            <br />
            <asp:TextBox ID="txtUsername" placeholder="Username" runat="server" CssClass="auto-style2"></asp:TextBox>
            <br />
            <br />
            <asp:TextBox ID="txtPassword" placeholder="Password" runat="server" CssClass="auto-style3"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnSignIn" runat="server" CssClass="auto-style4" Text="Sign In" Width="133px" />
            <br />
            
        </asp:Panel>
    </form>
    </body>
</html>
