<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ClockStatusByEmployee.aspx.vb" Inherits="SOSiQ.ClockStatusByEmployee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">

        <h2>Time clock status by employee</h2>

    </div>
    <hr />

    <div>
        <asp:GridView ID="gvClockStatus" runat="server" AutoGenerateColumns="False" DataSourceID="odsTeamClockStatus" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="table-condensed" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" SortExpression="EmployeeID" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:BoundField DataField="Last Activity" HeaderText="Last Activity" SortExpression="Last Activity" />
                <asp:BoundField DataField="Clock Status" HeaderText="Clock Status" ReadOnly="True" SortExpression="Clock Status" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>

        <asp:ObjectDataSource ID="odsTeamClockStatus" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.ShowTeamClockStatusTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="lblSiteID" Name="SiteID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>

    </div>

</asp:Content>
