<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MacedonianRedCrossYouth.Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentplaceHolder1" runat="server">
    <form id="form1" runat="server">
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <table style="width: 100%">
                    <tr>
                        <td style="height: 22px">
                            <asp:DropDownList ID="ddOrganizations" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td style="height: 22px">
                            <asp:DropDownList ID="ddActivityTypes" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="tbFromDate" runat="server" TextMode="Date"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="tbToDate" runat="server" TextMode="Date"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:GridView ID="gvActivnosti" runat="server" AutoGenerateColumns="False">
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
                <asp:Label ID="lblError" runat="server" Text="Label"></asp:Label>
                <br />
                Администратор
                <asp:Button ID="Button2" runat="server" Text="Button" />
            </asp:View>
            <asp:View ID="View2" runat="server">
                Клуб

            </asp:View>
        </asp:MultiView>
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="32px" ImageUrl="~/Content/image/1403062270_circle_add_plus.png"  Width="32px" OnClick="ImageButton1_Click" />
    </form>
</asp:Content>
