<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="UsersAndRoles.aspx.vb" Inherits="SOSiQ.UsersAndRoles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />

        <p align="center"> 

         <asp:Label ID="ActionStatus" runat="server" CssClass="Important"> </asp:Label> 

    </p>

    <p> 
     <b>Select a User:</b> 
     <asp:DropDownList ID="UserList" runat="server" AutoPostBack="True" 
          DataTextField="UserName" DataValueField="UserName"> 
     </asp:DropDownList> 
</p> 
<p> 
     <asp:Repeater ID="UsersRoleList" runat="server"> 
          <ItemTemplate> 
               <asp:CheckBox runat="server" ID="RoleCheckBox" AutoPostBack="true" 
                    Text='<%# Container.DataItem %>'
                   OnCheckedChanged="RoleCheckBox_CheckChanged"
                   /> 
               <br /> 
          </ItemTemplate> 
     </asp:Repeater> 

    <h3>Manage Users By Role</h3> 
<p> 
     <b>Select a Role:</b> 
     <asp:DropDownList ID="RoleList" runat="server" AutoPostBack="true"></asp:DropDownList> 
</p> 
<p> 
     <asp:GridView ID="RolesUserList" runat="server" AutoGenerateColumns="False" 
          EmptyDataText="No users belong to this role."> 
          <Columns> 
               <asp:CommandField DeleteText="Remove" ShowDeleteButton="True" />
               <asp:TemplateField HeaderText="Users"> 
                    <ItemTemplate> 
                         <asp:Label runat="server" id="UserNameLabel" 
                              Text='<%# Container.DataItem %>'></asp:Label> 
                    </ItemTemplate> 
               </asp:TemplateField> 
          </Columns> 
     </asp:GridView> 
</p>


    <p> 
     <b>UserName:</b> 
     <asp:TextBox ID="UserNameToAddToRole" runat="server"></asp:TextBox> 
     <br /> 
     <asp:Button ID="AddUserToRoleButton" runat="server" Text="Add User to Role" /> 
</p>


</asp:Content>
