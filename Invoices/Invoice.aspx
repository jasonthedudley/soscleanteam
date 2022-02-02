<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Invoice.aspx.vb" Inherits="SOSiQ.Invoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     
    <style>

#payeraddress{
    text-align:left    
}
.row {
    width:100%;
   height:100%;
}
.row div {
    width:50%;
    height:100%;
   height:100%;
    float:left;
}

</style>
   
    <br />
    <br />
    <br />
    <br />
    <div id="InvoiceHeader">
        
        <div class="row"><h1>Invoice   <asp:Label ID="lblInvoiceNumber" runat="server" Text=""></asp:Label> </h1></div>

        <div class="row">
            <div id="PayeeAddress">
                <h4>Payee</h4>
                SOS  CLEANTEAM
                <br />P.O. Box 471102
                <br />Tulsa, OK 74146
                <br />918.282.8848
                <br />accountsreceivable@soscleanteam.com

            </div>

            <div id="PayerAddress" dir="auto" align="left">
                <h4>Payer</h4>
                <asp:DetailsView id="dvPayerAddress" runat="server" AutoGenerateRows="False" DataSourceID="gvInvoiceDetailsOds" BorderColor="White" BorderStyle="None" GridLines="None" HorizontalAlign="Left">
                    <EditRowStyle HorizontalAlign="Left" />
                    <Fields>
                        <asp:BoundField DataField="SiteName" SortExpression="SiteName" ShowHeader="False">
                            <FooterStyle HorizontalAlign="Left" />
                        <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>

                        <asp:BoundField DataField="CustomerAddress1" SortExpression="CustomerAddress1" ShowHeader="False">
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>

                        <asp:BoundField DataField="CityStateZip" SortExpression="CityStateZip" ShowHeader="False" HeaderText="CityStateZip" >
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                    </Fields>
                    <RowStyle HorizontalAlign="Left" />
                </asp:DetailsView>
            </div>


        </div>

        <hr />
        
        <div id="InvoiceDetails">
            <asp:GridView ID="gvInvoiceDetails" runat="server" AutoGenerateColumns="False" DataKeyNames="InvoiceNumber" DataSourceID="gvInvoiceDetailsOds" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" HorizontalAlign="Center" CssClass="table-condensed">
                <Columns>
                    <asp:BoundField DataField="VIN" HeaderText="VIN" SortExpression="VIN" />
                    <asp:BoundField DataField="StockNumber" HeaderText="StockNumber" SortExpression="StockNumber" />
                    <asp:BoundField DataField="RoNumber" HeaderText="RoNumber" SortExpression="RoNumber" />
                    <asp:BoundField DataField="Mileage" HeaderText="Mileage" SortExpression="Mileage" />
                    <asp:BoundField DataField="WorkOrderID" HeaderText="SOSCLEANTEAM Work Order" SortExpression="WorkOrderID" >
                    <HeaderStyle HorizontalAlign="Center" Width="500px" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ServiceName" HeaderText="Service" SortExpression="ServiceName" >
                    <HeaderStyle HorizontalAlign="Center" Width="500px" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
                    <asp:BoundField DataField="Amount" DataFormatString="{0:C2}" HeaderText="Price" SortExpression="Amount" >
                    <HeaderStyle HorizontalAlign="Center" Width="500px" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <RowStyle BackColor="White" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>

            <asp:ObjectDataSource ID="gvInvoiceDetailsOds" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="ShowInvoice" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.ShowMeTheInvoiceTableAdapter">
                <SelectParameters>
                    <asp:QueryStringParameter Name="InvoiceID" QueryStringField="InvoiceID" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>

    </div>
</asp:Content>
