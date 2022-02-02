<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ManageRoles.aspx.vb" Inherits="SOSiQ.ManageRoles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<b>Create a New Role:</b>
<asp:TextBox ID="RoleName" runat="server"></asp:TextBox>
<br />
<asp:Button ID="CreateRoleButton" runat="server" Text="Create Role" />

    <br /><br />

    <asp:GridView ID="RoleList" runat="server" AutoGenerateColumns="False">

        <Columns>
             <asp:CommandField DeleteText="Delete Role" ShowDeleteButton="True" />
             <asp:TemplateField HeaderText="Role">
             <ItemTemplate>
             <asp:Label runat="server" ID="RoleNameLabel" Text='<%# Container.DataItem %>' />
             </ItemTemplate>
             </asp:TemplateField>
        </Columns>

    </asp:GridView>



</asp:Content>
