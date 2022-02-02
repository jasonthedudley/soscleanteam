<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ChangeEmail.aspx.vb" Inherits="SOSiQ.ChangeEmail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h2>User Emails:</h2>
    </div>

    <div>

    <asp:GridView ID="UsersGridView" runat="server" DataKeyNames="UserName" AutoGenerateColumns="False" AutoGenerateEditButton="true">

<Columns>

    <asp:BoundField DataField="UserName" HeaderText="Username" />

    <asp:BoundField DataField="Email" HeaderText="Email" />

     

</Columns>

        <SelectedRowStyle BackColor="#99CCFF" />

</asp:GridView>

    </div>

    <div>
        <br />

        <p>
            <asp:Label ID="lblResult" runat="server" Text=""></asp:Label>
        </p>

    </div>
    <br />
    <div>
    </div>


</asp:Content>
