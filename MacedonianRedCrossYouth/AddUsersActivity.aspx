<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="AddUsersActivity.aspx.cs" Inherits="MacedonianRedCrossYouth.AddUsersActivity" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentplaceHolder1" runat="server">
        <link href="content/css/select2.css" rel="stylesheet" type="text/css" />
        <script src="Scripts/select2.js"></script>

     <style>
        tr.highlight td {
            padding-bottom: 10px;
        }

        .tdStyle {
            height: 26px;
        }
    </style>

    <form id="form1" runat="server">
        <div style="width: 550px; margin: auto;">

            <table style="margin: auto;" >
                <tr>
                    <td colspan="2" style="background-color: #bcbcbc; text-align: center;">Извештај за активност
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Panel ID="Panel1" runat="server" Width="548px">
                            На активноста присуствуваа:<br />
                            <asp:ListBox ID="ddVolonteri" runat="server" SelectionMode="Multiple" Height="32px" Width="500px"></asp:ListBox>
                            <br />
                            Волонтерски часови:<br />
                            <asp:TextBox ID="tbHoursSpent" runat="server" TextMode="Time" ></asp:TextBox>
                            <asp:ImageButton ID="btnDetails" runat="server" Height="24px" ImageAlign="Right" ImageUrl="~/Content/image/down_arrow.png" Width="24px" OnClick="btnDetails_Click" />
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:GridView ID="gvUsersActivity" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" HorizontalAlign="Center">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="first_name" HeaderText="Ime" />
                                <asp:BoundField DataField="last_name" HeaderText="Prezime" />
                                <asp:BoundField DataField="hours_spent" HeaderText="Casovi" />
                            </Columns>
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EE8580" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <SortedAscendingCellStyle BackColor="#FDF5AC" />
                            <SortedAscendingHeaderStyle BackColor="#4D0000" />
                            <SortedDescendingCellStyle BackColor="#FCF6C0" />
                            <SortedDescendingHeaderStyle BackColor="#820000" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr class="highlight">
                    <td class="auto-style4">&nbsp;</td>
                </tr>
                <tr>
                    <td align="center" class="auto-style5">
                        <asp:Button ID="btnAddUser" runat="server" Text="Зачувај" Width="300" OnClick="btnAddUser_Click" />
                    </td>
                </tr>
                <tr class="highlight">
                    <td class="auto-style4">&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>

    <!-- load datepicker -->
    <style>
        select {
            color: black;
        }
        .auto-style3 {
            height: 30px;
            width: 507px;
        }
        .auto-style4 {
            width: 550px;
        }
        .auto-style5 {
            width: 507px;
            height: 26px;
        }
    </style>
    <script type="text/javascript">
 
        $(function () {
            $("#ContentplaceHolder1_ddVolonteri").select2();
        });

    </script>
</asp:Content>
