<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="Volonteri.aspx.cs" Inherits="MacedonianRedCrossYouth.Volonteri" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentplaceHolder1" runat="server">
    <form runat="server">
        <table style="width: 100%">
            <tr>
                <td>
        <asp:Button ID="addUser" runat="server" Text="Додади волонтер" OnClick="addUser_Click" />
                </td>
                <td>
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="32px" ImageUrl="~/Content/image/1403062270_circle_add_plus.png" OnClick="ImageButton1_Click" Width="32px" />
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
    </form>

</asp:Content>

