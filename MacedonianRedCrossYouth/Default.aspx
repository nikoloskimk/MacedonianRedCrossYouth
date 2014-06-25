<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MacedonianRedCrossYouth.Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentplaceHolder1" runat="server">
    <style>
        tr.highlight td {
            padding-bottom: 10px;
        }

        .auto-style1 {
            height: 20px;
            width: 534px;
        }

        .auto-style2 {
            height: 10px;
        }
        </style>
    <form id="form1" runat="server">
        <div style="width: 550px; margin: auto;">
            <table id="tabela" style="margin: auto;">
                <tr>
                    <td colspan="2" style="background-color: #bcbcbc; text-align: center;">Листа на активности
                    </td>
                </tr>
                <tr class="highlight">
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="tdStyle">Форми на дејстување:</td>
                    <td class="tdStyle">Тип на активности:</td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:DropDownList ID="ddOrganizations" runat="server" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="ddActivityTypes" runat="server" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                </tr>
               <tr class="highlight">
                    <td class="auto-style2">
                        <asp:Label ID="lblFrom" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="lblTo" runat="server" Visible="False"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td class="tdStyle">Почетен датум:</td>
                    <td class="tdStyle">Краен датум:</td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:TextBox ID="tbFromDate" runat="server" TextMode="Date" AutoPostBack="True" CausesValidation="True"></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="tbToDate" runat="server" TextMode="Date" AutoPostBack="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="auto-style2">
                        <asp:Label ID="lblError" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="gvActivnosti" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" OnSelectedIndexChanged="gvActivnosti_SelectedIndexChanged" DataKeyNames="activity_id" HorizontalAlign="Center" Width="550px" ViewStateMode="Disabled" >
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="title" HeaderText="Наслов на активност" >
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="start_time" HeaderText="Време на започнување" >
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="end_time" HeaderText="Време на завршување" >
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:CommandField HeaderText="Детали" SelectImageUrl="~/Content/image/details.png" SelectText="Детали" ShowSelectButton="True">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:CommandField>
                            </Columns>
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <SortedAscendingCellStyle BackColor="#FDF5AC" />
                            <SortedAscendingHeaderStyle BackColor="#4D0000" />
                            <SortedDescendingCellStyle BackColor="#FCF6C0" />
                            <SortedDescendingHeaderStyle BackColor="#820000" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr class="highlight">
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td colspan="2" style="margin:auto">
                        <asp:TextBox ID="tbDetalis" runat="server"  ReadOnly="True" TextMode="MultiLine" Width="550px" Visible="False"></asp:TextBox>
                    </td>
                </tr>
                <tr class="highlight">
                    <td class="auto-style2"></td>
                </tr>
            </table>
            <asp:ImageButton ID="btnAdd" runat="server" Height="24px" ImageUrl="~/Content/image/add.png" Width="24px" OnClick="ImageButton1_Click" ImageAlign="Middle" />
            <asp:ImageButton ID="btnEdit" runat="server" Height="24px" ImageUrl="~/Content/image/edit.png" Width="24px" ImageAlign="Middle" Visible="False" OnClientClick="editActivity(); return true;" OnClick="btnEdit_Click" />
        </div>
    </form>
</asp:Content>
