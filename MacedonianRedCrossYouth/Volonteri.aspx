<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="Volonteri.aspx.cs" Inherits="MacedonianRedCrossYouth.Volonteri" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentplaceHolder1" runat="server">
    <form runat="server">
        Volonteurs
            <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
    </form>

    <!-- load datepicker -->
    <script type="text/javascript">
        $(function () {
            $("#ContentplaceHolder1_txtDate").datepicker();
        });
    </script>
</asp:Content>

