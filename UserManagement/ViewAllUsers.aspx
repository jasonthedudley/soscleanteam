<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ViewAllUsers.aspx.vb" Inherits="SOSiQ.ViewAllUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />

<asp:GridView ID="gvAllUsers" runat="server" DataKeyNames="UserName" AutoGenerateColumns="False" AutoGenerateEditButton="True" CellPadding="1" CellSpacing="1">

<Columns>

    <asp:BoundField DataField="UserName" HeaderText="Username" >

        <ItemStyle HorizontalAlign="Center" />
    
    </asp:BoundField>

    <asp:BoundField DataField="Email" HeaderText="Email" />

                 

</Columns>

        <SelectedRowStyle BackColor="#99CCFF" />

</asp:GridView>

    

</asp:Content>
