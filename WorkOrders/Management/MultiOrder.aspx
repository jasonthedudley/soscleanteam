<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="MultiOrder.aspx.vb" Inherits="SOSiQ.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />

    Enter multiple orders at once:
    <br />
    <asp:Button ID="Button1" runat="server" Text="Add row" />
    <br />
&nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false">

 <Columns>

        <asp:BoundField DataField="RowNumber" HeaderText="Row Number" />

        <asp:TemplateField HeaderText="Header 1">

            <ItemTemplate>

                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

            </ItemTemplate>

        </asp:TemplateField>

        <asp:TemplateField HeaderText="Header 2">

            <ItemTemplate>

                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>

            </ItemTemplate>

        </asp:TemplateField>

        <asp:TemplateField HeaderText="Header 3">

            <ItemTemplate>

                 <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>

            </ItemTemplate>

            <FooterStyle HorizontalAlign="Right" />

            <FooterTemplate>

             <asp:Button ID="ButtonAdd" runat="server" Text="Add New Row" />

            </FooterTemplate>

        </asp:TemplateField>

        </Columns>


    </asp:GridView>

</asp:Content>
