<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="MacedonianRedCrossYouth.AddUser" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentplaceHolder1" runat="server">
    <style>
        tr.highlight td {
            padding-bottom: 10px;
        }

        .tdStyle {
            width: 260px;
            height: 26px;
        }
    </style>
    <script type="text/javascript">
        function ClientValidate(source, arguments)
        {
            console.log('Client validate');
            var isChecked = $('#ContentplaceHolder1_Clen').attr("checked");
            console.log(isChecked + "ischk")
            if(isChecked=="checked")
            {
                // arguments.IsValid = txt.value.length > 0;
                /*
                arguments.IsValid = $("#ContentplaceHolder1_tbMemberSince").text() != "";
                console.log($("#ContentplaceHolder1_tbMemberSince").text());
                console.log($("#ContentplaceHolder1_tbMemberSince").text() != "");
                */
                arguments.IsValid = true;
            }else{
                arguments.IsValid = true;
            }
            console.log(arguments.IsValid);

        }
    </script>
    <form id="form1" runat="server">
        <div style="width: 550px; margin: auto;">
            <asp:ValidationSummary ID="ValidationSummary" runat="server" ForeColor="Red" />
            <asp:Label ID="lblError" runat="server" Text="Настана грешка при додавањето. Корисничкото име мора да е единствено." ForeColor="Red" Visible="False"></asp:Label>

            <table style="margin: auto;">
                <tr>
                    <td colspan="2" style="background-color: #bcbcbc; text-align: center;">Лични податоци
                    </td>
                </tr>
                <tr class="highlight">
                    <td colspan="2">
                        <asp:RequiredFieldValidator ID="rfVFirstName" runat="server" ControlToValidate="tbFirstName" Display="None" ErrorMessage="Полето за име е задолжително" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="rfVLastName" runat="server" ControlToValidate="tbLastName" Display="None" ErrorMessage="Полето за презиме е задолжително" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="rfVGender" runat="server" ControlToValidate="ddlGender" Display="None" ErrorMessage="Полето за пол е задолжително" InitialValue="0"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="rfVNationality" runat="server" ControlToValidate="ddNationalities" Display="None" ErrorMessage="Полето за националност е задолжително" InitialValue="0"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="rfVDateBorn" runat="server" ControlToValidate="tbDatumRaganje" Display="None" ErrorMessage="Полето за датум на раѓање е задолжително"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="rfVDateAccess" runat="server" ControlToValidate="tbDatumPristap" Display="None" ErrorMessage="Полето за датум на пристап е задолжително"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="rfVOccupation" runat="server" ControlToValidate="ddZanimanje" Display="None" ErrorMessage="Полето за занимање е задолжително" InitialValue="0"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="rfVPhone" runat="server" ControlToValidate="tbPhone" Display="None" ErrorMessage="Полето за телефон е задолжително"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="rfVUsername" runat="server" ControlToValidate="tbUsername" Display="None" ErrorMessage="Полето за корисничко име е задолжително"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="rfVPassword" runat="server" ControlToValidate="tbPassword" Display="None" ErrorMessage="Полето за лозинка е задолжително"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="tdStyle">Име:<asp:Label ID="Label1" runat="server" ForeColor="Red" Text="*"></asp:Label>
                    </td>
                    <td class="tdStyle">Презиме:<asp:Label ID="Label2" runat="server" ForeColor="Red" Text="*"></asp:Label>
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
                    <td class="tdStyle">Пол:<asp:Label ID="Label3" runat="server" ForeColor="Red" Text="*"></asp:Label>
                    </td>
                    <td class="tdStyle">Националност:<asp:Label ID="Label4" runat="server" ForeColor="Red" Text="*"></asp:Label>
                    </td>
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
                    <td class="tdStyle">Датум на раѓање:<asp:Label ID="Label5" runat="server" ForeColor="Red" Text="*"></asp:Label>
                    </td>
                    <td class="tdStyle">Датум на пристап:<asp:Label ID="Label6" runat="server" ForeColor="Red" Text="*"></asp:Label>
                    </td>
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
                    <td class="tdStyle">Занимање:<asp:Label ID="Label7" runat="server" ForeColor="Red" Text="*"></asp:Label>
                    </td>
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
                    <td class="tdStyle">Организација:<asp:Label ID="Label8" runat="server" ForeColor="Red" Text="*"></asp:Label>
                    </td>
                    <td class="tdStyle">Активен:<asp:Label ID="Label9" runat="server" ForeColor="Red" Text="*"></asp:Label>
                    </td>

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
                    <td class="tdStyle">Град / Населено место:</td>
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
                    <td class="tdStyle">Мобилен телефон:<asp:Label ID="Label10" runat="server" ForeColor="Red" Text="*"></asp:Label>
                    </td>
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
                    <td class="tdStyle">Корисничко име:<asp:Label ID="Label11" runat="server" ForeColor="Red" Text="*"></asp:Label>
                    </td>
                    <td class="tdStyle">Лозинка:<asp:Label ID="Label12" runat="server" ForeColor="Red" Text="*"></asp:Label>
                    </td>
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
                    <td class="tdStyle">Дали волонтерот е член:<asp:Label ID="Label13" runat="server" ForeColor="Red" Text="*"></asp:Label>
                    </td>
                    <td class="tdStyle">Зачленет од:<asp:Label ID="Label14" runat="server" ForeColor="Red" Text="*"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="tdStyle">
                        <asp:CheckBox ID="Clen" runat="server" Text="Да / Не" AutoPostBack="True" OnCheckedChanged="Clen_CheckedChanged" />
                    </td>
                    <td class="tdStyle">
                        <asp:TextBox ID="tbMemberSince" runat="server" Width="220" Enabled="False" TextMode="Date"></asp:TextBox>
                    </td>
                </tr>
                <tr class="highlight">
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button ID="btnAddUser" runat="server" Text="Додади корисник" OnClick="btnAddUser_Click" Width="300" />
                    </td>
                </tr>
                <tr class="highlight">
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>

    <!-- load datepicker -->
    <style>
        select {
            color: black;
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
