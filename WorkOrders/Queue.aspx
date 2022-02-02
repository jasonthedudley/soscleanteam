<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Queue.aspx.vb" Inherits="SOSiQ.Queue" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron"><h2>Work Orders in Queue</h2></div>


    <hr />

    <div style="overflow:scroll">

        
        <asp:GridView ID="gvOrdersInQueue" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" CssClass="table-condensed" DataSourceID="odsOrdersInQueue" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="WorkOrderID" HeaderText="WorkOrderID" SortExpression="WorkOrderID" />
                <asp:BoundField DataField="VIN" HeaderText="VIN" SortExpression="VIN" />
                <asp:BoundField DataField="ServiceName" HeaderText="ServiceName" SortExpression="ServiceName" />
                <asp:BoundField DataField="RatingName" HeaderText="RatingName" SortExpression="RatingName" />
                <asp:BoundField DataField="SiteName" HeaderText="SiteName" SortExpression="SiteName" />
                <asp:BoundField DataField="StatusName" HeaderText="StatusName" SortExpression="StatusName" />
                <asp:BoundField DataField="Created On" HeaderText="Created On" ReadOnly="True" SortExpression="Created On" DataFormatString="{0:d}" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="ClockReasonDescription" HeaderText="ClockReasonDescription" SortExpression="ClockReasonDescription" />
                <asp:BoundField DataField="StatusID" HeaderText="StatusID" SortExpression="StatusID" />
                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" SortExpression="EmployeeID" />
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
                <asp:BoundField DataField="Latest Activity" DataFormatString="{0:d}" HeaderText="Latest Activity" ReadOnly="True" SortExpression="Latest Activity" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>

        <asp:ObjectDataSource ID="odsOrdersInQueue" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.ViewWorkOrderQueueTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="lblSiteID" Name="SiteID" Type="Int32" />
                <asp:ControlParameter ControlID="lblEmpID" Name="EmpID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>

    </div>


</asp:Content>
