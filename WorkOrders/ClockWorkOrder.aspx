<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ClockWorkOrder.aspx.vb" Inherits="SOSiQ.ClockWorkOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron" id="header">
        <h1>Select Work Order to Clock</h1>
        <h5>Use this to clock on to or clock off of a work order</h5>

    </div>

    <div class="divline"></div>
    <table>
        <tr>
    <td><asp:Button ID="btnClockOnWO" runat="server" Text="Clock On" CssClass="btn-lg" /></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>

            
            <td>
                <asp:Button ID="btnClockOffWO" runat="server" Text="Clock Off" CssClass="btn-lg" /></td>

            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btnPause" runat="server" Text="Pause"  CssClass="btn-lg" /></td>
              <th style="word-wrap:normal">Select reason if pausing work:</th>
            <td colspan="12">
                <asp:DropDownList ID="ddPauseReason" runat="server" Width="100%" DataSourceID="odsPauseReasons" DataTextField="ClockReasonDescription" DataValueField="ClockReasonID" AppendDataBoundItems="true"><asp:ListItem Text="Select..." Value=999></asp:ListItem></asp:DropDownList>
                <asp:ObjectDataSource ID="odsPauseReasons" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.ShowPauseReasonsTableAdapter"></asp:ObjectDataSource>
            </td>
     </tr>
                    
   </table>
        
        <div class="divline"></div>
    <div id="Table" style="overflow:scroll">


        <asp:GridView ID="gvOrdersToClock" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" CssClass="table-condensed" DataSourceID="odsWorkOrdersToClock" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="WorkOrderID" HeaderText="WorkOrderID" SortExpression="WorkOrderID" />
                <asp:BoundField DataField="VIN" HeaderText="VIN" SortExpression="VIN" />
                <asp:BoundField DataField="ServiceName" HeaderText="ServiceName" SortExpression="ServiceName" />
                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" SortExpression="EmployeeID" />
                <asp:BoundField DataField="StatusName" HeaderText="StatusName" SortExpression="StatusName" />
                <asp:BoundField DataField="PunchDateTime" HeaderText="PunchDateTime" SortExpression="PunchDateTime" />
                <asp:BoundField DataField="PunchTypeDesc" HeaderText="PunchTypeDesc" SortExpression="PunchTypeDesc" />
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

        <asp:ObjectDataSource ID="odsWorkOrdersToClock" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.ShowMeTheWorkOrdersForClockingTableAdapter">
            <SelectParameters>
                
                <asp:ControlParameter ControlID="lblsiteid" Name="SiteID" />
                <asp:ControlParameter ControlID="lblEmpID" Name="EmpID" />
            </SelectParameters>
        </asp:ObjectDataSource>

    </div>

</asp:Content>
