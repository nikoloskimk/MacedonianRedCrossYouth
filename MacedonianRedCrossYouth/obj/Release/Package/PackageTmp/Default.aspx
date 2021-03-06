﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MacedonianRedCrossYouth.Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentplaceHolder1" runat="server">
    <form id="form1" runat="server">
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <table style="width: 100%">
                    <tr>
                        <td style="height: 22px">
                            <asp:DropDownList ID="ddOrganizations" runat="server" AutoPostBack="True">
                            </asp:DropDownList>
                        </td>
                        <td style="height: 22px">
                            <asp:DropDownList ID="ddActivityTypes" runat="server" AutoPostBack="True">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="tbFromDate" runat="server" TextMode="Date" AutoPostBack="True"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="tbToDate" runat="server" TextMode="Date" AutoPostBack="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:GridView ID="gvActivnosti" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" OnSelectedIndexChanged="gvActivnosti_SelectedIndexChanged" DataKeyNames="activity_id">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="title" HeaderText="Наслов на активност" />
                                    <asp:BoundField DataField="start_time" HeaderText="Време на започнување" />
                                    <asp:BoundField DataField="end_time" HeaderText="Време на завршување" />
                                    <asp:CommandField HeaderText="Детали" SelectImageUrl="~/Content/image/details.png" SelectText="Детали" ShowSelectButton="True">
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
                </table>
                <asp:Label ID="lblError" runat="server" Text="Label"></asp:Label>
                <asp:Panel ID="pnlDetalis" runat="server" Visible="False">
                    <asp:TextBox ID="tbDetalis" runat="server" ReadOnly="True" TextMode="MultiLine"></asp:TextBox>
                </asp:Panel>
                <br />
                Администратор
                <asp:Button ID="Button2" runat="server" Text="Button" />
            </asp:View>
            <asp:View ID="View2" runat="server">
                Клуб

            </asp:View>
        </asp:MultiView>
                    <asp:ImageButton ID="btnAdd" runat="server" Height="24px" ImageUrl="~/Content/image/add.png"  Width="24px" OnClick="ImageButton1_Click" ImageAlign="Middle" />
                    <asp:ImageButton ID="btnEdit" runat="server" Height="24px" ImageUrl="~/Content/image/edit.png"  Width="24px" OnClick="btnRefresh_Click" ImageAlign="Middle" />
    </form>
</asp:Content>
