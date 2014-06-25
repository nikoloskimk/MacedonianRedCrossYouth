<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="Dokumenti.aspx.cs" Inherits="MacedonianRedCrossYouth.Dokumenti" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentplaceHolder1" runat="server">
    <form runat="server">
        <div style="margin-top: 10px; margin-right: 20px; float: right;">
            <div style="float: left;">
                <asp:ImageButton ID="btnAddDocument" runat="server" AlternateText="Додади документ" Height="32px" ImageUrl="~/Content/image/add.png" OnClick="btnAddDocument_Click" Width="32px" ToolTip="Додади документ" Visible="False"></asp:ImageButton>
            </div>
            <div id="divAdd" style="height: 32px; float: left; padding-top: 7px; padding-left: 5px; cursor: pointer;">
                <asp:Label Text="Додади документ" runat="server" ID="lblAddDocument" Visible="False"></asp:Label>
            </div>
        </div>
        <div style="clear: both;"></div>
        <div>
            <asp:Panel ID="pnlDocuments" runat="server">
                
            </asp:Panel>
        </div>
    </form>
        <script type="text/javascript">
            $(function () {
                $("#divAdd").click(function (d) {
                    window.location = "AddDocument.aspx";
                });
            });
    </script>
</asp:Content>
