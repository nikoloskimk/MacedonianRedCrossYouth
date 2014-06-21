<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="MacedonianRedCrossYouth.AddUser" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentplaceHolder1" runat="server">
    <style>
        tr.highlight td {
            padding-bottom: 10px;
        }

        .tdStyle {
            width: 260px;
            height:26px;
        }
    </style>
    <form id="form1" runat="server">
        <div style="width:550px; margin: auto;">
            <table style="margin: auto;">
                <tr>
                    <td colspan="2" style="background-color: #bcbcbc; text-align: center;">Лични податоци
                    </td>
                </tr>
                <tr class="highlight">
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <td class="tdStyle">Име:<asp:RequiredFieldValidator ID="rfVFirstName" runat="server" ControlToValidate="tbFirstName" Display="None" ErrorMessage="Полето за име е празно" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td class="tdStyle">Презиме:<asp:RequiredFieldValidator ID="rfVLastName" runat="server" ControlToValidate="tbLastName" Display="None" ErrorMessage="Полето за презиме е празно" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="tdStyle">
                        <asp:TextBox ID="tbFirstName" runat="server" Width="220"></asp:TextBox>
                    </td>
                    <td class="tdStyle">
                        <asp:TextBox ID="tbLastName" runat="server" Width="220"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="tdStyle">Пол:<asp:RequiredFieldValidator ID="rfVGender" runat="server" ControlToValidate="ddlGender" Display="None" ErrorMessage="rfGender" InitialValue="0"></asp:RequiredFieldValidator>
                    </td>
                    <td class="tdStyle">Националност:</td>
                </tr>
                <tr>
                    <td class="tdStyle">
                        <asp:DropDownList ID="ddlGender" runat="server" Width="220">
                            <asp:ListItem Value="0" Text=""></asp:ListItem>
                            <asp:ListItem Value="1">Машки</asp:ListItem>
                            <asp:ListItem Value="2">Женски</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="tdStyle">
                        <asp:DropDownList ID="ddNationalities" runat="server" Width="220">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="tdStyle">Датум на раѓање:</td>
                    <td class="tdStyle">Датум на пристап:</td>
                </tr>
                <tr>
                    <td class="tdStyle">
                        <asp:TextBox ID="tbDatumRaganje" runat="server" TextMode="Date" Width="220"></asp:TextBox>
                    </td>
                    <td class="tdStyle">
                        <asp:TextBox ID="tbDatumPristap" runat="server" TextMode="Date" Width="220"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="tdStyle">Занимање:</td>
                    <td class="tdStyle">
                        <asp:Label ID="lblFakultet" runat="server" Visible="False">Факултет:</asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="tdStyle">
                        <asp:DropDownList ID="ddZanimanje" Width="220" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddZanimanje_SelectedIndexChanged">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>вработен</asp:ListItem>
                            <asp:ListItem>студент</asp:ListItem>
                            <asp:ListItem>ученик</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="tdStyle">
                        <asp:DropDownList ID="ddFakulteti" runat="server" Visible="False" Width="220">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="tdStyle">Организација:</td>
                    <td class="tdStyle">Активен:</td>
                    
                </tr>
                <tr>
                <td class="tdStyle">
                        <asp:DropDownList ID="ddOrganizations" Width="220" runat="server" Enabled="false">
                        </asp:DropDownList>
                    </td>
                    <td class="tdStyle">
                        <asp:CheckBox ID="Aktiven" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" Text="Да / Не" TextAlign="Right" />
                    </td>
                    
                </tr>
                <tr class="highlight">
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <td colspan="2">Прикачи фотографија (180px X 240px):</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </td>
                </tr>
                <tr class="highlight">
                    <td></td>
                </tr>

                <tr>
                    <td colspan="2" style="background-color: #bcbcbc; height: 20px; text-align: center;">Контакт</td>
                </tr>
                <tr class="highlight">
                    <td></td>
                </tr>

                <tr>
                    <td class="tdStyle">Адреса:</td>
                    <td class="tdStyle">Град:</td>
                </tr>
                <tr>
                    <td class="tdStyle">
                        <asp:TextBox ID="tbAddress" runat="server" Width="220"></asp:TextBox>
                    </td>
                    <td class="tdStyle">
                        <asp:TextBox ID="tbCity" runat="server" Width="220"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="tdStyle">Мобилен телефон:</td>
                    <td class="tdStyle">Е-пошта:</td>
                </tr>
                <tr>
                    <td class="tdStyle">
                        <asp:TextBox ID="tbPhone" runat="server" Width="220"></asp:TextBox>
                    </td>
                    <td class="tdStyle">
                        <asp:TextBox ID="tbEmail" runat="server" Width="220" TextMode="Email"></asp:TextBox>
                    </td>
                </tr>
                <tr class="highlight">
                    <td>&nbsp;</td>
                </tr>

                <tr>
                    <td colspan="2" style="height: 20px; background-color: #bcbcbc; text-align: center;">Членство</td>
                </tr>
                <tr class="highlight">
                    <td></td>
                </tr>
                <tr>
                    <td class="tdStyle">Корисничко име:</td>
                    <td class="tdStyle">Лозинка:</td>
                </tr>
                <tr>
                    <td class="tdStyle">
                        <asp:TextBox ID="tbUsername" runat="server" Width="220"></asp:TextBox>
                    </td>
                    <td class="tdStyle">
                        <asp:TextBox ID="tbPassword" runat="server" Width="220"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="height: 25px; width: 185px">
                        <asp:CheckBox ID="Clen" runat="server" Text="Е член" AutoPostBack="True" OnCheckedChanged="Clen_CheckedChanged" />
                    </td>
                    <td class="auto-style3">Зачленет од:&nbsp;
                    <br />
                        <asp:TextBox ID="tbMemberSince" runat="server" Width="154px" Enabled="False" TextMode="Date"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                        <asp:Button ID="btnAddUser" runat="server" Text="Додади корисник" OnClick="btnAddUser_Click" />

                        <br />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                        <asp:Label ID="lblError" runat="server" Text="Настана грешка при додавањето. Корисничкото име мора да е единствено." ForeColor="Red" Visible="False"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>

    <!-- load datepicker -->
    <style>
        select {
            color: black;
        }

        .auto-style1 {
            width: 400px;
        }

        .auto-style2 {
            height: 20px;
            width: 400px;
        }

        .auto-style3 {
            height: 25px;
            width: 400px;
        }
        .auto-style4 {
            width: 185px;
            height: 22px;
        }
        .auto-style5 {
            width: 400px;
            height: 22px;
        }
    </style>
    <script type="text/javascript">
        /*
        $(function () {
            $("#ContentplaceHolder1_tbDatumRaganje").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'dd.mm.yy'
            });

            $("#ContentplaceHolder1_tbDatumPristap").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'dd.mm.yy'
            });
            $('#tbPhone').mask('(999)/999-999');
        });
        */
    </script>
</asp:Content>
