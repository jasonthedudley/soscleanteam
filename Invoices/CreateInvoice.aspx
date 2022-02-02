<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="CreateInvoice.aspx.vb" Inherits="SOSiQ.CreateInvoice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <br />
    <br />
    <div>

             

        <div class="jumbotron">
            <h3>Work Orders that have not been invoiced: </h3>
        </div>


<table>

    <tr>

        <th>Generate Invoice</th>
        <td>&nbsp</td>
        <td><asp:Button ID="btnGenerate" runat="server" Text="Submit" CssClass="btn-lg" /></td>


    </tr>

</table>


        <div style="overflow:scroll"  >

            <asp:GridView ID="gvWorkOrdersToInvoice" runat="server" DataSourceID="gvOrdersReadyForInvoiceOds" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" CssClass="table-condensed">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="WorkOrderID" HeaderText="Order #" SortExpression="WorkOrderID" />
                    <asp:BoundField DataField="CreateDate" DataFormatString="{0:d}" HeaderText="Created on" SortExpression="CreateDate" />
                    <asp:BoundField DataField="CompleteDate" DataFormatString="{0:d}" HeaderText="Completed On" SortExpression="CompleteDate" />
                    <asp:BoundField DataField="VIN" HeaderText="VIN" SortExpression="VIN" />
                    <asp:BoundField DataField="StockNumber" HeaderText="Stock No" SortExpression="StockNumber" />
                    <asp:BoundField DataField="RoNumber" HeaderText="Ro No" SortExpression="RoNumber" />
                    <asp:BoundField DataField="ServiceName" HeaderText="Service" SortExpression="ServiceName" />
                    <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" />
                    <asp:BoundField DataField="ServicePrice" HeaderText="Service Price" SortExpression="ServicePrice" DataFormatString="{0:C2}" />
                    <asp:BoundField DataField="Adder" DataFormatString="{0:C2}" HeaderText="Adder" SortExpression="Adder" />
                    <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" DataFormatString="{0:C2}" />
                    <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#3399FF" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>

            <asp:ObjectDataSource ID="gvOrdersReadyForInvoiceOds" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetOrdersReadyForInvoice" TypeName="SOSiQ.SOSiQSQLDBTableAdapters.ViewOrdersReadyForInvoiceTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblsiteid" Name="SiteID" />
                </SelectParameters>
            </asp:ObjectDataSource>

        </div>

    </div>

</asp:Content>
