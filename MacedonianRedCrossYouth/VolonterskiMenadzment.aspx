<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="VolonterskiMenadzment.aspx.cs" Inherits="MacedonianRedCrossYouth.VolonterskiMenadzment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentplaceHolder1" runat="server">
    <div style="width: 800px; margin:auto;">
        <form runat="server">
            <!-- Nav tabs -->
            <ul class="nav nav-tabs" id="myTab">
                <li class="active"><a href="#volonteri" data-toggle="tab">Волонтери</a></li>
                <li><a href="#clenovi" data-toggle="tab">Членови</a></li>
                <li><a href="#formi" data-toggle="tab">Форми на дејствување</a></li>
                <li></li>
            </ul>

            <div class="tab-content">
                <div class="tab-pane active" id="volonteri">
                    <div style="margin-top:10px; margin-right: 20px;">
                    <asp:ImageButton ID="ImageButton1" runat="server" AlternateText="Додади волонтер" Height="32px" ImageUrl="~/Content/image/1403062270_circle_add_plus.png" OnClick="ImageButton1_Click" Width="32px" ImageAlign="Right" ToolTip="Додади волонтер" />
                    </div>
                    <asp:GridView ID="gvVolonteri" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnSelectedIndexChanging="gvVolonteri_SelectedIndexChanging">
                        <Columns>
                            <asp:BoundField DataField="first_name" HeaderText="Име" />
                            <asp:BoundField DataField="last_name" HeaderText="Презиме" />
                            <asp:BoundField DataField="organization_name" HeaderText="Организација" SortExpression="organization_name" />
                            <asp:CheckBoxField DataField="is_member" HeaderText="Член" />
                            <asp:CheckBoxField DataField="is_active" HeaderText="Активен" />
                            <asp:CommandField HeaderText="Избери" ShowSelectButton="True" />
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
                    <br />
                    <asp:Label ID="Label1" runat="server" Text="Лабела" Visible="False"></asp:Label>
                </div>
                <div class="tab-pane" id="clenovi">
                    <asp:GridView ID="gvClenovi" runat="server"></asp:GridView>
                </div>
                <div class="tab-pane" id="formi">Формите паат активности да ги занимават членовите и волонтерите.</div>
            </div>
            
            <script>
                $(function () {
                    $('#myTab a:first').tab('show')
                })
            </script>
        </form>
    </div>
    <script type="text/javascript">
        $('#myTab a').click(function (e) {
            e.preventDefault()
            $(this).tab('show')
        });
        $('#myTab a[href="#profile"]').tab('show') // Select tab by name
        $('#myTab a:first').tab('show') // Select first tab
        $('#myTab a:last').tab('show') // Select last tab
        $('#myTab li:eq(2) a').tab('show') // Select third tab (0-indexed)
        $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
            e.target // activated tab
            e.relatedTarget // previous tab
        })
    </script>
</asp:Content>
