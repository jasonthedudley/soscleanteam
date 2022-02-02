<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="LocalDashboard.aspx.vb" Inherits="SOSiQ.LocalDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />

    <div class="jumbotron">
        
        <h1>SOS Cleanteam Dashboard</h1>

    </div>
    <hr />
    <div id="dashboardtable">


        <asp:GridView ID="gvSiteStats" runat="server" AutoGenerateColumns="False" DataSourceID="odsSiteStats" CellPadding="4" CssClass="table-condensed" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="SiteName" HeaderText="Site" SortExpression="SiteName" />
                <asp:BoundField DataField="InQueue" HeaderText="In Queue" SortExpression="InQueue" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="CreatedYesterday" HeaderText="Created Yesterday" SortExpression="CreatedYesterday" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FinishedYesterday" HeaderText="Finished Yesterday" SortExpression="FinishedYesterday" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>

        <asp:ObjectDataSource ID="odsSiteStats" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.ShowMeStatsForLocalPageTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="lblsiteid" Name="SiteID" />
            </SelectParameters>
        </asp:ObjectDataSource>

    </div>

</asp:Content>
