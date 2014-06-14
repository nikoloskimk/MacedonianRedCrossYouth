﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="MacedonianRedCrossYouth.AddUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentplaceHolder1" runat="server">
    <form id="form1" runat="server">
        <table style="width: auto; margin: auto;">
            <tr>
                <td colspan="2" style="background-color: #bcbcbc">Лични податоци</td>
            </tr>
            <tr>
                <td style="width: 185px">Име:</td>
                <td>Презиме:</td>
            </tr>
            <tr>
                <td style="width: 185px">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="height: 20px; width: 185px">Пол:</td>
                <td style="height: 20px">Датум на раѓање</td>
            </tr>
            <tr>
                <td style="width: 185px">
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem Value="1">Машки</asp:ListItem>
                        <asp:ListItem Value="2">Женски</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:TextBox ID="tbDatumRaganje" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 185px">Националност:</td>
                <td>Занимање:</td>
            </tr>
            <tr>
                <td style="width: 185px">
                    <asp:DropDownList ID="DropDownList2" runat="server">
                        <asp:ListItem>македонец</asp:ListItem>
                        <asp:ListItem>влав</asp:ListItem>
                        <asp:ListItem>албанец</asp:ListItem>
                        <asp:ListItem>србин</asp:ListItem>
                        <asp:ListItem>бошњак</asp:ListItem>
                        <asp:ListItem>останато</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:DropDownList ID="ddZanimanje" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddZanimanje_SelectedIndexChanged">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>вработен</asp:ListItem>
                        <asp:ListItem>студент</asp:ListItem>
                    </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="ddFakulteti" runat="server" Visible="False">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 185px">Датум на пристап:</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 185px">
                    <asp:TextBox ID="tbDatumPristap" runat="server"></asp:TextBox>
                </td>
                <td>Организација:</td>
            </tr>
            <tr>
                <td style="width: 185px">
                    <asp:CheckBox ID="Aktiven" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" Text="Активен" TextAlign="Left" />
                </td>
                <td>
                    <asp:DropDownList ID="ddOrganizations" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="background-color: #bcbcbc; height: 20px;">Контакт</td>
            </tr>
            <tr>
                <td style="width: 185px">Адреса:</td>
                <td>Град:</td>
            </tr>
            <tr>
                <td style="width: 185px">
                    <asp:TextBox ID="TextBox5" runat="server" Width="156px"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="Grad" runat="server" Width="156px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Grad" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 185px">Мобилен телефон:</td>
                <td>Е-пошта:</td>
            </tr>
            <tr>
                <td style="width: 185px">
                    <asp:TextBox ID="TextBox9" runat="server" Width="156px"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="TextBox11" runat="server" Width="156px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: 20px; background-color: #bcbcbc;">Членство</td>
            </tr>
            <tr>
                <td style="height: 25px; width: 185px">
                    <asp:CheckBox ID="Clen" runat="server"  Text="Е член" />
                </td>
                <td style="height: 25px">Зачленет од:&nbsp; <br />
                    <asp:TextBox ID="TextBox12" runat="server" Width="154px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <br />
                     <asp:Button ID="Button1" runat="server" Text="Додади корисник" />

                </td>
            </tr>
        </table>

    </form>

        <!-- load datepicker -->
    <style>
        select {
            color: black;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $("#ContentplaceHolder1_tbDatumRaganje").datepicker({
                changeMonth: true,
                changeYear: true
            });

            $("#ContentplaceHolder1_tbDatumPristap").datepicker({
                changeMonth: true,
                changeYear: true
            });
        });
    </script>
</asp:Content>
