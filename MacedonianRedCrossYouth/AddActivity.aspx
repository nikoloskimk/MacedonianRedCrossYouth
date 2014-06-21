<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="AddActivity.aspx.cs" Inherits="MacedonianRedCrossYouth.AddActivity" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentplaceHolder1" runat="server">
    <style>
        tr.highlight td {
            padding-bottom: 10px;
        }
        .auto-style1 {
            width: 185px;
            height: 20px;
        }
    </style>
    <form id="form1" runat="server">
        <div style="width: 650px; margin: auto;">
        <table id="tabela" style="margin: auto;">
            <tr>
                <td colspan="2" style="background-color: #bcbcbc; text-align: center;">Нова активности
                </td>
            </tr>
            <tr class="highlight">
                <td>
                    <asp:RequiredFieldValidator ID="title" runat="server" ControlToValidate="tbTitile" Display="None" ErrorMessage="Мора да внесете наслов на активноста" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="sd" runat="server" ControlToValidate="tbStartTime" Display="None" ErrorMessage="Внесете време за почеток на активноста !" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="ed" runat="server" ControlToValidate="tbEndTime" Display="None" ErrorMessage="Внесете време за завршување на активноста"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cv" runat="server" ControlToCompare="tbStartTime" ControlToValidate="tbEndTime" Display="None" ErrorMessage="Времето на завршување на активноста мора да е поголемо од времето за почеток!" Operator="GreaterThan" SetFocusOnError="True"></asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="des" runat="server" ControlToValidate="tbDescription" Display="None" ErrorMessage="Внесете опис за активноста!" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="c" runat="server" ControlToValidate="tbCosts" Display="None" ErrorMessage="Внесете трошоци!" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="rv" runat="server" ControlToValidate="tbCosts" Display="None" ErrorMessage="Трошоците мора да бидат поголеми или еднакви на 0!" MinimumValue="0" SetFocusOnError="True" Type="Integer" MaximumValue="1000000"></asp:RangeValidator>
                    <asp:RequiredFieldValidator ID="p" runat="server" ControlToValidate="tbPlace" Display="None" ErrorMessage="Внесете место на одржување на активноста" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
             <tr>
                <td colspan="2">Наслов на активност:</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:TextBox ID="tbTitile" runat="server" Width="450px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 185px">Почеток на активност:</td>
                <td class="auto-style1">Крај на активност:
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:TextBox ID="tbStartTime" runat="server" TextMode="DateTimeLocal"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="tbEndTime" runat="server" TextMode="DateTimeLocal"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="height: 20px; width: 185px">Опис:</td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:TextBox ID="tbDescription" runat="server" Rows="5" TextMode="MultiLine" Width="450px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 185px">Трошоци:</td>
                <td class="auto-style1">Место на одржување:</td>
            </tr>
            <tr>
                <td style="width: 185px">
                    <asp:TextBox ID="tbCosts" runat="server" TextMode="Number"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="tbPlace" runat="server"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
            </tr>
            <tr>
                <td style="width: 185px">Организација:</td>
                <td class="auto-style1">
                    Тип на активност</td>
            </tr>
            <tr>
                <td style="width: 185px">
                    <asp:DropDownList ID="ddOrganizations" runat="server" Height="26px">
                    </asp:DropDownList>
                </td>
                <td class="auto-style1">
                    <asp:DropDownList ID="ddActivityTypes" runat="server" Height="26px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    </td>
                <td class="auto-style1">
                    </td>
            </tr>
            <tr>
                <td colspan="2" class="auto-style4">Прикачи фотографии (180px X 240px):</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="True" />
                </td>
            </tr>
            <tr class="highlight">
                <td>&nbsp;</td>
            </tr>

            <tr>
                <td colspan="2">
                    <asp:Button ID="btnAddActivity" runat="server" Text="Додади активност" OnClick="btnAddActivity_Click" />

                    <asp:Button ID="btnAddAnotherActivity" runat="server" Text="Додади уште активности" OnClick="btnAddAnotherActivity_Click" />

                    <br />
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />

                </td>
            </tr>
        </table>
        </div>
    </form>
   
    <!-- load datepicker -->
     <!--
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

        .auto-style4 {
            height: 20px;
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
    //-->
</asp:Content>
