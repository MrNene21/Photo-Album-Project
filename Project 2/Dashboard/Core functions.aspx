<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Core functions.aspx.cs" Inherits="Project_2.Dashboard.Edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Core functions</title>
    <style type="text/css">
        .auto-style1 {
            width: 740px;
        }
        .auto-style2 {
            width: 275px;
        }
        .auto-style4 {
            width: 100%;
        }
        .auto-style5 {
            width: 516px;
        }
        .auto-style6 {
            width: 275px;
            height: 49px;
        }
        .auto-style7 {
            width: 516px;
            height: 49px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style4">
            <tr>
                <td class="auto-style1" rowspan="13">
                    <asp:GridView ID="gvImages" runat="server" AutoGenerateColumns="false" OnRowDataBound="grd_RowDataBound">
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
                    </asp:GridView></td>
                <td class="auto-style6">
                    <asp:Label ID="lblEditPrp" runat="server" Font-Size="25px" Font-Underline="True" Text="Edit Properties"></asp:Label>
                </td>
                <td class="auto-style7"></td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:TextBox ID="txtGeolocation" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    <asp:Button ID="btnAdd" runat="server" Text="Add" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:TextBox ID="txtTags" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style5">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:TextBox ID="txtCapturedData" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style5">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label1" runat="server" Text="Enter ImageID to delete image"></asp:Label>
                </td>
                <td class="auto-style5">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:TextBox ID="txtImgID" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label2" runat="server" Text="Enter ImageID to remove properties"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:Button ID="btnRemove" runat="server" Text="Remove properties" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label3" runat="server" Text="Search image by name or tag"></asp:Label>
                </td>
                <td class="auto-style5">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style5">&nbsp;</td>
            </tr>
            </table>
    </form>
</body>
</html>
