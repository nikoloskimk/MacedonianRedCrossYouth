<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="AddMember.aspx.cs" Inherits="MacedonianRedCrossYouth.AddMember" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentplaceHolder1" runat="server">
    <link href="content/css/select2.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/select2.js"></script>
    <div style="width: 400px; margin:auto; padding-top: 10px;">
    <form runat="server">
        <asp:DropDownList ID="lstUsers" runat="server" AutoPostBack="True" OnSelectedIndexChanged="lstUsers_SelectedIndexChanged" Width="400px"></asp:DropDownList>
        <br />
        <br />
        <asp:Panel ID="Panel1" runat="server" Visible="False">
            Датум на зачленување:
            <asp:TextBox ID="tbYear" runat="server" TextMode="Date"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbYear" Display="Dynamic" ErrorMessage="Ве молиме внесете датум на зачленување" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Button ID="btnAddMember" runat="server" Text="Додади член" OnClick="btnAddMember_Click" Width="220px" />
            <br />
            <br />
        </asp:Panel>
        <asp:Label ID="lblInfo" runat="server" Text="" Visible="False"></asp:Label>
    </form>
        </div>
    <script type="text/javascript">

        $(function () {
            $("#ContentplaceHolder1_lstUsers").select2();
        });

    </script>
</asp:Content>
