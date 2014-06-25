<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="AddDocument.aspx.cs" Inherits="MacedonianRedCrossYouth.AddDocument" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentplaceHolder1" runat="server">
    <style>
        td, tr {
            padding: 5px;
            margin-left: 40px;
        }
    </style>
    <form runat="server">
        <div style="width: 600px; margin:auto; padding-top: 10px;">
        <table>
            <tr>
                <td>Име на документот:
                </td>
                <td>
                    <asp:TextBox ID="tbIme" runat="server" Width="300px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Полиса на документот:
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" Width="300px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Избери документ:
                </td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" Width="300px" />
                </td>
            </tr>
            <tr style="text-align: center;">
                <td colspan="2">
                    <asp:Button ID="btnUpload" runat="server" Text="Прикачи документ" Width="250px" OnClick="btnUpload_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblInfo" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table>
            </div>
    </form>
</asp:Content>
