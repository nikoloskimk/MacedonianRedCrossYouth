<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="Ulogi.aspx.cs" Inherits="MacedonianRedCrossYouth.Ulogi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentplaceHolder1" runat="server">
    <link href="content/css/select2.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/select2.js"></script>
    <style>
        table, td, tr, th {
            border: 1px solid black;
        }

        .tdChk {
            text-align: center;
        }
    </style>
    <form runat="server">

        <asp:DropDownList ID="lstUsers" runat="server" AutoPostBack="True" OnSelectedIndexChanged="lstUsers_SelectedIndexChanged" Width="400px">
        </asp:DropDownList>
        <br />
        <br />
        <asp:Panel ID="panelUlogi" runat="server" Visible="false">
            <table>
                <thead>
                    <tr>
                        <th>Улога</th>
                        <th>Да / Не</th>
                    </tr>
                </thead>
                <tr>
                    <td>Администратор</td>
                    <td class="tdChk">
                        <asp:CheckBox ID="chk1" runat="server" /></td>
                </tr>
                <tr>
                    <td>Претседател на Совет на млади на ЦКРМ</td>
                    <td class="tdChk">
                        <asp:CheckBox ID="chk2" runat="server" /></td>
                </tr>
                <tr>
                    <td>Потпретседател на Совет на млади на ЦКРМ</td>
                    <td class="tdChk">
                        <asp:CheckBox ID="chk3" runat="server" /></td>
                </tr>
                <tr>
                    <td>Член на координативно тело во Совет на млади на ЦКРМ</td>
                    <td class="tdChk">
                        <asp:CheckBox ID="chk4" runat="server" /></td>
                </tr>
                <tr>
                    <td>Лидер на клуб на млади</td>
                    <td class="tdChk">
                        <asp:CheckBox ID="chk5" runat="server" /></td>
                </tr>
                <tr>
                    <td>Заменик лидер на клуб на млади</td>
                    <td class="tdChk">
                        <asp:CheckBox ID="chk6" runat="server" /></td>
                </tr>
                <tr>
                    <td>Член на координативно тело на клуб на млади</td>
                    <td class="tdChk">
                        <asp:CheckBox ID="chk7" runat="server" /></td>
                </tr>
                <tr>
                    <td>Претставник во совет на млади на ЦКРМ</td>
                    <td class="tdChk">
                        <asp:CheckBox ID="chk8" runat="server" /></td>
                </tr>
                <tr>
                    <td>Волонтер</td>
                    <td class="tdChk">
                        <asp:CheckBox ID="chk9" runat="server" Enabled="False" /></td>
                </tr>
            </table>
            <br />
            <asp:Button ID="btnSaveRoles" runat="server" Text="Зачувај улоги" OnClick="btnSaveRoles_Click" />

            <br />
            <br />
            <asp:Label ID="lblInfo" runat="server" Text="Улогите се зачувани успешно" ForeColor="Green" Visible="False"></asp:Label>
        </asp:Panel>
    </form>
    <script type="text/javascript">

        $(function () {
            $("#ContentplaceHolder1_lstUsers").select2();
        });

    </script>
</asp:Content>
