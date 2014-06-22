<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="Volonteri.aspx.cs" Inherits="MacedonianRedCrossYouth.Volonteri" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentplaceHolder1" runat="server">
    <form runat="server">
        <div style="margin-top: 10px; margin-right: 20px; float: right;">
            <div style="float: left;">
                <asp:ImageButton ID="btnAddVolonter" runat="server" AlternateText="Додади волонтер" Height="32px" ImageUrl="~/Content/image/1403062270_circle_add_plus.png" OnClick="btnAddVolonter_Click" Width="32px" ToolTip="Додади волонтер"></asp:ImageButton>
            </div>
            <div id="divAdd" style="height: 32px; float: left; padding-top: 7px; padding-left: 5px; cursor: pointer;">
                <asp:Label Text="Додади волонтер" runat="server" ID="lblAddVolonter"></asp:Label>
            </div>
        </div>
        <div id="controlMessage" style="padding: 10px;">
            <asp:Label ID="lblMessage" runat="server" Visible="False" ForeColor="Green"></asp:Label>
        </div>
        <asp:GridView ID="gvVolonteri" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnSelectedIndexChanging="gvVolonteri_SelectedIndexChanging">
            <Columns>
                <asp:BoundField DataField="first_name" HeaderText="Име" />
                <asp:BoundField DataField="last_name" HeaderText="Презиме" />
                <asp:BoundField DataField="organization_name" HeaderText="Организација" SortExpression="organization_name" />
                <asp:CheckBoxField DataField="is_member" HeaderText="Член" />
                <asp:CheckBoxField DataField="is_active" HeaderText="Активен" />
                <asp:CommandField HeaderText="Информации" ShowSelectButton="True" SelectText="Прикажи детали" />
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>
    </form>
    <script type="text/javascript">
        $("#divAdd").click(function (d) {
            window.location = "AddUser.aspx";
        });
    </script>
</asp:Content>

