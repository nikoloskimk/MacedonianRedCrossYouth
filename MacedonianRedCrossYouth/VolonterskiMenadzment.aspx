<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="VolonterskiMenadzment.aspx.cs" Inherits="MacedonianRedCrossYouth.VolonterskiMenadzment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentplaceHolder1" runat="server">
    <form runat="server">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" id="myTab">
            <li class="active"><a href="#home" data-toggle="tab">Волонтери</a></li>
            <li><a href="#profile" data-toggle="tab">Членови</a></li>
            <li><a href="#messages" data-toggle="tab">Форми на дејствување</a></li>
            <li>
<asp:ImageButton ID="ImageButton1" runat="server" Height="32px" ImageUrl="~/Content/image/1403062270_circle_add_plus.png" OnClick="ImageButton1_Click" Width="32px" ImageAlign="Bottom" />
            </li>
        </ul>

        <div class="tab-content">
            <div class="tab-pane active" id="home">Волонтерите са супер дечки и онак то.</div>
            <div class="tab-pane" id="profile">Членовите са уште по супер, они плаќат чланарина.</div>
            <div class="tab-pane" id="messages">Формите паат активности да ги занимават членовите и волонтерите.</div>
        </div>

        <script>
            $(function () {
                $('#myTab a:first').tab('show')
            })
        </script>
        </form>
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
