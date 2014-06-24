<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="AddFee.aspx.cs" Inherits="MacedonianRedCrossYouth.AddFee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentplaceHolder1" runat="server">
    <link href="content/css/select2.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/select2.js"></script>
    <div style="width: 400px; margin: auto; padding-top: 10px;">
        <form runat="server">
            <asp:DropDownList ID="lstUsers" runat="server" OnSelectedIndexChanged="lstUsers_SelectedIndexChanged" AutoPostBack="True" Width="400px"></asp:DropDownList>
            <asp:Panel ID="Panel1" runat="server" Visible="False">
                <br />
                <div style="margin-left: 120px;">
                    Изберете година:<br />
                    <asp:DropDownList ID="lstFees" runat="server" Width="150px"></asp:DropDownList>
                    <br />
                    <br />
                    <asp:Button ID="btnAddFee" runat="server" OnClick="btnAddFee_Click" Text="Додади членарина" Width="150px" />
                </div>
            </asp:Panel>
            <asp:Label ID="lblInfo" runat="server" Text="" Visible="False"></asp:Label>
        </form>
    </div>
    <script type="text/javascript">

        $(function () {
            $("#ContentplaceHolder1_lstUsers").select2();
        });

        $(function () {
            $("#ContentplaceHolder1_lstFees").select2();
        });

    </script>
</asp:Content>
