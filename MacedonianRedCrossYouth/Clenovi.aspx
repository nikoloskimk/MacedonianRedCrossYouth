<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="Clenovi.aspx.cs" Inherits="MacedonianRedCrossYouth.Clenovi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentplaceHolder1" runat="server">
    <link href="content/css/select2.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/select2.js"></script>

    <form runat="server">
        <div style="margin-top: 10px; margin-right: 20px; float: right;">
            <div style="float: left;">
                <asp:ImageButton ID="btnAddFee" runat="server" AlternateText="Евидентирај членарина" Height="32px" ImageUrl="~/Content/image/add.png" OnClick="btnAddFee_Click" Width="32px" ToolTip="Евидентирај членарина"></asp:ImageButton>
            </div>
            <div id="divAddFee" style="height: 32px; float: left; padding-top: 7px; padding-left: 5px; cursor: pointer;">
                <asp:Label Text="Евидентирај членарина" runat="server" ID="lblAddFee"></asp:Label>
            </div>
        </div>
        <div style="margin-top: 10px; margin-right: 20px; float: right;">
            <div style="float: left;">
                <asp:ImageButton ID="btnAddMember" runat="server" AlternateText="Додади член" Height="32px" ImageUrl="~/Content/image/add.png" OnClick="btnAddMember_Click" Width="32px" ToolTip="Додади член"></asp:ImageButton>
            </div>
            <div id="divAddMember" style="height: 32px; float: left; padding-top: 7px; padding-left: 5px; cursor: pointer;">
                <asp:Label Text="Додади член" runat="server" ID="lblAddMember"></asp:Label>
            </div>
        </div>
        <div id="controlMessage" style="padding: 10px; float: left;">
            <asp:DropDownList ID="ddOrganizations" runat="server" Width="220" AutoPostBack="True" OnSelectedIndexChanged="ddOrganizations_SelectedIndexChanged" Visible="False">
            </asp:DropDownList>
        </div>
        <div style="clear: both"></div>
        <div>
            <asp:GridView ID="gvClenovi" runat="server" AutoGenerateColumns="False" DataKeyNames="user_id" OnSelectedIndexChanged="gvClenovi_SelectedIndexChanged" ShowHeaderWhenEmpty="True" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
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
                    <asp:BoundField DataField="member_since" DataFormatString="{0:d}" HeaderText="Датум на зачленување">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>

                    <asp:CommandField HeaderText="Членарина" SelectText="Прикажи членарина" ShowSelectButton="True" />
                </Columns>

                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

            </asp:GridView>
            <br />
            <asp:GridView ID="gvClenarina" runat="server" ShowHeaderWhenEmpty="True" Visible="False" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="year" HeaderText="Година" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </div>
    </form>
    <script type="text/javascript">


        $(function () {
            $("#divAddFee").click(function (d) {
                window.location = "AddFee.aspx";
            });

            $("#divAddMember").click(function (d) {
                window.location = "AddMember.aspx";
            });

            $("#ContentplaceHolder1_ddOrganizations").select2();
        });
    </script>
</asp:Content>
