<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Core functions.aspx.cs" Inherits="Project_2.Dashboard.Edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="assets/css/flax/styleControls(pro&pImg).css" />
    <title>Core functions</title>
    <style type="text/css">
        .auto-style1 {
            width: 740px;
        }
        .auto-style4 {
            width: 100%;
        }
        .auto-style5 {
            width: 988px;
        }
        .auto-style6 {
            height: 49px;
            width: 204px;
        }
        .auto-style7 {
            width: 988px;
            height: 49px;
        }
        .auto-style8 {
            width: 204px;
        }
        .auto-style9 {
            width: 26%;
        }
        .auto-style10 {
            height: 66px;
            width: 204px;
        }
        .auto-style11 {
            width: 988px;
            height: 66px;
        }
        .auto-style12 {
            width: 204px;
            height: 43px;
        }
        .auto-style13 {
            width: 988px;
            height: 43px;
        }
        .auto-style14 {
            width: 204px;
            height: 44px;
        }
        .auto-style15 {
            width: 988px;
            height: 44px;
        }
        .auto-style16 {
            margin-left: 2%;
            position: absolute;
            margin-bottom: 100vh;
            left: 475px;
            top: 21px;
        }
        .auto-style17 {
            width: 204px;
            height: 26px;
        }
        .auto-style18 {
            width: 988px;
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style9">
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="lblEditPrp" runat="server" Font-Underline="False" Text="Edit Properti for image with ImageID:" Font-Bold="True"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtEdit" runat="server" Width="45px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:TextBox ID="txtName" runat="server" placeholder="Enter name"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" />
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:TextBox ID="txtGeolocation" runat="server" placeholder="Enter geolocation"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    <asp:Button ID="btnAdd" runat="server" Text="Add" />
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:TextBox ID="txtTags" runat="server" placeholder="Enter tags"></asp:TextBox>
                </td>
                <td class="auto-style5">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:TextBox ID="txtCapturedDate" runat="server" placeholder="Enter captured date"></asp:TextBox>
                </td>
                <td class="auto-style5">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10"></td>
                <td class="auto-style11"></td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="Label1" runat="server" Text="Enter ImageID to delete image" Font-Bold="True"></asp:Label>
                </td>
                <td class="auto-style5">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:TextBox ID="txtImgID" runat="server" Width="45px"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style12"></td>
                <td class="auto-style13"></td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="Label2" runat="server" Text="Enter ImageID to remove properties" Font-Bold="True"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:Button ID="btnRemove" runat="server" Text="Remove properties" />
                </td>
            </tr>
            <tr>
                <td class="auto-style14">
                    <asp:TextBox ID="TextBox1" runat="server" Width="45px"></asp:TextBox>
                </td>
                <td class="auto-style15"></td>
            </tr>
            <tr>
                <td class="auto-style17">
                </td>
                <td class="auto-style18"></td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="Label3" runat="server" Text="Search image by name or tag" Font-Bold="True"></asp:Label>
                </td>
                <td class="auto-style5">&nbsp;</td>
            </tr>
            </table>
        <table class="auto-style4">
            <tr>
                <td class="auto-style1" rowspan="13">
                    <asp:GridView ID="gvImages" runat="server" AutoGenerateColumns="False" OnRowDataBound="grd_RowDataBound" CellPadding="4" CssClass="auto-style16" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>      
                        <asp:BoundField DataField="ImageID" HeaderText="Image Id" />
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:BoundField DataField="Geolocation" HeaderText="Geolocation" />
                        <asp:BoundField DataField="Tags" HeaderText="Tags" />
                        <asp:BoundField DataField="CapturedDate" HeaderText="Captured Date" />
                        <asp:BoundField DataField="UserID" HeaderText="UserID" />
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <img src='<%# Eval("ImageData") %>' id="imageControl" runat="server" height="100" width="100" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LUYANDAConnectionString %>" SelectCommand="SELECT * FROM [Images]"></asp:SqlDataSource>
                    <asp:TextBox ID="txtSearch" runat="server" OnTextChanged="txtSearch_TextChanged" Width="148px"></asp:TextBox>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
