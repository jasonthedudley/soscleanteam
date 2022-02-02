<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="WorkOrdersInProcess.aspx.vb" Inherits="SOSiQ.WorkOrdersInProcess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h2>Work orders in process</h2>
    </div>

    <hr />

    <div>


        <asp:GridView ID="gvTeamWorkOrders" runat="server" AutoGenerateColumns="False" DataSourceID="odsTeamWorkOrders" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="table-condensed" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="WorkOrderID" HeaderText="WorkOrderID" SortExpression="WorkOrderID" />
                <asp:BoundField DataField="VIN" HeaderText="VIN" SortExpression="VIN" />
                <asp:BoundField DataField="ServiceName" HeaderText="ServiceName" SortExpression="ServiceName" />
                <asp:BoundField DataField="RatingName" HeaderText="RatingName" SortExpression="RatingName" />
                <asp:BoundField DataField="SiteName" HeaderText="SiteName" SortExpression="SiteName" />
                <asp:BoundField DataField="StatusName" HeaderText="StatusName" SortExpression="StatusName" />
                <asp:BoundField DataField="Created On" HeaderText="Created On" ReadOnly="True" SortExpression="Created On" />
                <asp:BoundField DataField="Latest Activity" HeaderText="Latest Activity" ReadOnly="True" SortExpression="Latest Activity" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="ClockReasonDescription" HeaderText="ClockReasonDescription" SortExpression="ClockReasonDescription" />
                <asp:BoundField DataField="StatusID" HeaderText="StatusID" SortExpression="StatusID" />
                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" SortExpression="EmployeeID" />
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
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


        <asp:ObjectDataSource ID="odsTeamWorkOrders" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.TeamWorkOrderQueueTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="lblSiteID" Name="SiteID"  Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>


    </div>

</asp:Content>
