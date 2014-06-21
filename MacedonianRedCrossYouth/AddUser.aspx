<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="MacedonianRedCrossYouth.AddUser" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentplaceHolder1" runat="server">
    <style>
        tr.highlight td {
            padding-bottom: 10px;
        }
    </style>
    <form id="form1" runat="server">
        <div style="width: 650px; margin: auto;">
        <table style="margin: auto;">
            <tr>
                <td colspan="2" style="background-color: #bcbcbc; text-align: center;">Лични податоци
                </td>
            </tr>
            <tr class="highlight">
                <td></td>
            </tr>
             <tr>
                <td style="width: 185px">Username:</td>
                <td class="auto-style1">Password:</td>
            </tr>
            <tr>
                <td style="width: 185px">
                    <asp:TextBox ID="tbUsername" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="tbPassword" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 185px">Име:</td>
                <td class="auto-style1">Презиме:
                </td>
            </tr>
            <tr>
                <td style="width: 185px">
                    <asp:TextBox ID="tbFirstName" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="tbLastName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="height: 20px; width: 185px">Пол:</td>
                <td class="auto-style2">Датум на раѓање</td>
            </tr>
            <tr>
                <td style="width: 185px">
                    <asp:DropDownList ID="ddlGender" runat="server">
                        <asp:ListItem Value="1">Машки</asp:ListItem>
                        <asp:ListItem Value="2">Женски</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="tbDatumRaganje" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 185px">Националност:</td>
                <td class="auto-style1">Занимање:</td>
            </tr>
            <tr>
                <td style="width: 185px">
                    <asp:DropDownList ID="ddNationalities" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="auto-style1">
                    <asp:DropDownList ID="ddZanimanje" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddZanimanje_SelectedIndexChanged">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>вработен</asp:ListItem>
                        <asp:ListItem>студент</asp:ListItem>
                        <asp:ListItem>ученик</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
            </tr>
            <tr>
                <td style="width: 185px">Датум на пристап:</td>
                <td class="auto-style1">
                    <asp:DropDownList ID="ddFakulteti" runat="server" Visible="False" Height="16px" Width="399px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 185px">
                    <asp:TextBox ID="tbDatumPristap" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style1">Организација:</td>
            </tr>
            <tr>
                <td style="width: 185px">
                    <asp:CheckBox ID="Aktiven" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" Text="Активен" TextAlign="Left" />
                </td>
                <td class="auto-style1">
                    <asp:DropDownList ID="ddOrganizations" runat="server">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddOrganizations" Display="None" ErrorMessage="Мора да изберете организација" InitialValue="0" Enabled="False" ></asp:RequiredFieldValidator>
                </td>
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
                <td style="width: 185px">Адреса:</td>
                <td class="auto-style1">Град:</td>
            </tr>
            <tr>
                <td style="width: 185px">
                    <asp:TextBox ID="tbAddress" runat="server" Width="156px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="tbCity" runat="server" Width="156px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 185px">Мобилен телефон:</td>
                <td class="auto-style1">Е-пошта:</td>
            </tr>
            <tr>
                <td style="width: 185px">
                    <asp:TextBox ID="tbPhone" runat="server" Width="156px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="tbEmail" runat="server" Width="156px" TextMode="Email"></asp:TextBox>
                </td>
            </tr>
            <tr class="highlight">
                <td>&nbsp;</td>
            </tr>

            <tr>
                <td colspan="2" style="height: 20px; background-color: #bcbcbc; text-align:center;">Членство</td>
            </tr>
            <tr class="highlight">
                <td></td>
            </tr>

            <tr>
                <td style="height: 25px; width: 185px">
                    <asp:CheckBox ID="Clen" runat="server" Text="Е член" AutoPostBack="True" OnCheckedChanged="Clen_CheckedChanged" />
                </td>
                <td class="auto-style3">Зачленет од:&nbsp;
                    <br />
                    <asp:TextBox ID="tbMemberSince" runat="server" Width="154px" Enabled="False"></asp:TextBox>
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
    </style>
    <script type="text/javascript">
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
    </script>
</asp:Content>
