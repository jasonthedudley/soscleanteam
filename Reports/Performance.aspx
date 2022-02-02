<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Performance.aspx.vb" Inherits="SOSiQ.Performance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron"><h2>Coming soon</h2></div>


    <div>

        <asp:GridView ID="gvYesterday" runat="server"></asp:GridView>

    </div>

    <hr />

    <div>

        <asp:GridView ID="gvMonthly" runat="server"></asp:GridView>

    </div>

</asp:Content>
