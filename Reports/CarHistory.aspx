<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="CarHistory.aspx.vb" Inherits="SOSiQ.Vin_History" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron"><h2>Vehicle History</h2></div>


        <div id="Vin Lookup">

  

        <hr />
        
            <div>
                <h4>Search By Entering Either the RO Number, Stock Number or VIN Below</h4>

            </div>

            <hr />
    <table>
        <tr>
            <td>
                <asp:Label ID="lblVin" runat="server" Text="Enter Number"></asp:Label></td>
            <td>&nbsp</td>
            <td>
                <asp:TextBox ID="txtVin" runat="server" ToolTip="Press enter to search"></asp:TextBox></td>
        </tr>
        <tr>
            <td>&nbsp</td>
            <td>&nbsp</td>
            <td>
                <asp:Button ID="btnSearch" runat="server" Text="Click to Search" Width="100%" CssClass="btn-lg" Font-Size="Small" /></td>
        </tr>
    </table>

            <hr />

    </div>

    <div style="overflow:scroll">

        <asp:GridView ID="gvCarHistory" runat="server" AutoGenerateColumns="False" DataSourceID="odsViewCarHistory" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="table-condensed" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="VIN" HeaderText="VIN" SortExpression="VIN" />
                <asp:BoundField DataField="ServiceName" HeaderText="Service" SortExpression="ServiceName" />
                <asp:BoundField DataField="customer name" HeaderText="Site" SortExpression="customer name" />
                <asp:BoundField DataField="Date Recieved" HeaderText="Date Received" SortExpression="Date Recieved" DataFormatString="{0:d}" />
                <asp:BoundField DataField="CompleteDate" HeaderText="Date Complete" SortExpression="CompleteDate" DataFormatString="{0:d}" />
                <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
                <asp:BoundField DataField="FirstName" HeaderText="First" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="Last" SortExpression="LastName" />
                <asp:BoundField DataField="RoNumber" HeaderText="Ro Number" SortExpression="RoNumber" />
                <asp:BoundField DataField="Stock Number" HeaderText="Stock Number" SortExpression="Stock Number" />
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


        <asp:ObjectDataSource ID="odsViewCarHistory" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.ShowMeTheCarHistoryTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtVin" Name="SearchNumber" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>


    </div>

</asp:Content>
