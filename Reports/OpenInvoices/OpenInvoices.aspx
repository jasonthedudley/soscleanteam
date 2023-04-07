<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="OpenInvoices.aspx.vb" Inherits="SOSiQ.OpenInvoices" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <br />
    <table>
        <tr>
            <td>
                Select Site: 
            </td>
            <td>
                <asp:DropDownList ID="ddSites" runat="server" DataSourceID="OdsSites" DataTextField="SiteName" DataValueField="CustomerID" AppendDataBoundItems="true" AutoPostBack="True">
                    <asp:ListItem Text="All" Value="9999"></asp:ListItem>

                </asp:DropDownList>
                <asp:ObjectDataSource ID="OdsSites" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.CustomerTableAdapter"></asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="btnExport" runat="server" Text="Export Data" Width="100%" /></td>
        </tr>
    </table>

    <hr />

    <div id="data">


        <asp:GridView ID="gvOpenInvoices" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" CssClass="table-condensed" DataKeyNames="InvoiceNumber" DataSourceID="odsInvoices" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="SiteName" HeaderText="SiteName" SortExpression="SiteName" />
                <asp:BoundField DataField="InvoiceNumber" HeaderText="InvoiceNumber" ReadOnly="True" SortExpression="InvoiceNumber" />
                <asp:BoundField DataField="DateCreated" DataFormatString="{0:d}" HeaderText="DateCreated" SortExpression="DateCreated" />
                <asp:BoundField DataField="ServicePrice" HeaderText="ServicePrice" SortExpression="ServicePrice" DataFormatString="{0:c}" />
                <asp:BoundField DataField="RatingAdder" HeaderText="RatingAdder" SortExpression="RatingAdder" DataFormatString="{0:c}" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" DataFormatString="{0:c}" />
                <asp:BoundField DataField="ServiceName" HeaderText="ServiceName" ReadOnly="True" SortExpression="ServiceName" />
                <asp:BoundField DataField="WorkOrderID" HeaderText="WorkOrderID" SortExpression="WorkOrderID" />
                <asp:BoundField DataField="VIN" HeaderText="VIN" SortExpression="VIN" />
                <asp:BoundField DataField="StockNumber" HeaderText="StockNumber" SortExpression="StockNumber" />
                <asp:BoundField DataField="RoNumber" HeaderText="RoNumber" SortExpression="RoNumber" />
                <asp:BoundField DataField="Mileage" HeaderText="Mileage" SortExpression="Mileage" />
                <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
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


        <asp:ObjectDataSource ID="odsInvoices" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.CorporateInvoiceViewTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddSites" Name="SiteID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>

    </div>

</asp:Content>
