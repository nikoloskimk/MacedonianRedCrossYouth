<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="Volonteri.aspx.cs" Inherits="MacedonianRedCrossYouth.Volonteri" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentplaceHolder1" runat="server">
    <link href="content/css/select2.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/select2.js"></script>
    <style>
        td {
            padding: 2px;
        }

        th {
            padding: 2px;
        }
    </style>
    <form runat="server">
        <div style="margin-top: 10px; margin-right: 20px; float: right;">
            <div style="float: left;">
                <asp:ImageButton ID="btnAddVolonter" runat="server" AlternateText="Додади волонтер" Height="32px" ImageUrl="~/Content/image/add.png" OnClick="btnAddVolonter_Click" Width="32px" ToolTip="Додади волонтер"></asp:ImageButton>
            </div>
            <div id="divAdd" style="height: 32px; float: left; padding-top: 7px; padding-left: 5px; cursor: pointer;">
                <asp:Label Text="Додади волонтер" runat="server" ID="lblAddVolonter"></asp:Label>
            </div>
        </div>
        <div id="controlMessage" style="padding: 10px; float: left;">
            <asp:DropDownList ID="ddOrganizations" runat="server" Width="220" AutoPostBack="True" OnSelectedIndexChanged="ddOrganizations_SelectedIndexChanged" Visible="False">
            </asp:DropDownList>
        </div>
        <div style="clear: both">
            <asp:Label ID="lblMessage" runat="server" Visible="False" ForeColor="Green"></asp:Label>
        </div>

        <asp:GridView ID="gvVolonteri" runat="server" AutoGenerateColumns="False" CellPadding="4" AllowPaging="True" DataKeyNames="user_id" OnPageIndexChanging="gvVolonteri_PageIndexChanging" OnSelectedIndexChanged="gvVolonteri_SelectedIndexChanged" HorizontalAlign="Center" ForeColor="#333333" ShowHeaderWhenEmpty="True" PageSize="5">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="Реден број">
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>. 
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:BoundField DataField="first_name" HeaderText="Име" />
                <asp:BoundField DataField="last_name" HeaderText="Презиме" />
                <asp:BoundField DataField="birth_date" DataFormatString="{0:d}" HeaderText="Датум на раѓање">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="organization_name" HeaderText="Организација" Visible="False" />
                <asp:CheckBoxField DataField="is_member" HeaderText="Член">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:CheckBoxField>
                <asp:CheckBoxField DataField="is_active" HeaderText="Активен">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:CheckBoxField>
                <asp:BoundField DataField="hours" HeaderText="Волонтерски часови">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:CommandField HeaderText="Информации" ShowSelectButton="True" SelectText="Прикажи активности" />
            </Columns>
            <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <br />
        <asp:GridView ID="gvAktivnostiVolonter" runat="server" CellPadding="4" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" Visible="False" HorizontalAlign="Center" ForeColor="Black" GridLines="Vertical" EmptyDataText="Волонтерот нема учествувано на ниедна активност">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="Реден број">
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>. 
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:BoundField DataField="title" HeaderText="Наслов на активноста" />
                <asp:BoundField DataField="start_time" HeaderText="Почеток">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="end_time" HeaderText="Крај">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="hours_spent" HeaderText="Волонтерски часови">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
    </form>
    <script type="text/javascript">
       

        $(function () {
            $("#divAdd").click(function (d) {
                window.location = "AddUser.aspx";
            });

            $("#ContentplaceHolder1_ddOrganizations").select2();
        });
    </script>
</asp:Content>

