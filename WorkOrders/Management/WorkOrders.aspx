<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="WorkOrders.aspx.vb" Inherits="SOSiQ.EditWorkOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div id="header">

    <h4>
        <asp:Label ID="lblPageHeader" runat="server" Text="Work Orders" ></asp:Label></h4>
  
</div>

    <hr />
    <table>

        <tr>
            <th>Date Begin:</th>
            <td><asp:TextBox ID="txtDateBegin" runat="server" TextMode="Date"></asp:TextBox></td>
            <th>Date End:</th>
            <td><asp:TextBox ID="txtDateEnd" runat="server" TextMode="Date"></asp:TextBox></td>
            <td>&nbsp</td>
            <td >
                <asp:Button ID="btnUpdateTable" runat="server" Text="Update Table" /></td>
        </tr>
        <tr>
            <th>Filter By Status:</th>
            <td>
                <asp:DropDownList ID="ddOrderStatus" runat="server" Width="100%" DataSourceID="odsOrderStatusFilter" DataTextField="StatusName" DataValueField="StatusID" AppendDataBoundItems="true"><asp:ListItem Text="Select..." Value="999"></asp:ListItem></asp:DropDownList>
                <asp:ObjectDataSource ID="odsOrderStatusFilter" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetStatuses" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.ShowMeTheWorkOrderStatusesTableAdapter"></asp:ObjectDataSource>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td >
                <asp:Button ID="btnResetTable" runat="server" Text="Reset Table  " /></td>
        </tr>
    </table>
    <hr />
    <table>
        <tr>
            <td><asp:Button ID="btnSelectAll" runat="server" Text="Select All" /></td>
            <td>&nbsp</td>
            <td><asp:Button ID="btnUnselectAll" runat="server" Text="Unselect All" /></td>
            <td>&nbsp</td>
            <td><asp:Button ID="btnMarkReadyForInvoice" runat="server" Text="Ready for Invoice" /></td>
            <td>&nbsp</td>
                <td><asp:Button ID="btnEditOrder" runat="server" Text="Edit Order"  /></td>
        </tr>
    </table>


    <div class="ex1">

        <asp:GridView  ID="gvOrdersToEdit" runat="server" DataSourceID ="odsOrdersToEdit" AutoGenerateColumns="False" DataKeyNames="WorkOrderID" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" CssClass="table-condensed" AllowSorting="True" Height="250px" AllowPaging="True" PageSize="15" >
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:templatefield HeaderText="Select">
                    <itemtemplate>
                        <asp:checkbox ID="cbSelect" CssClass="gridCB" runat="server" AutoPostBack="True"></asp:checkbox>
                    </itemtemplate>
                </asp:templatefield>

                <asp:BoundField DataField="SiteName" HeaderText="SiteName" SortExpression="SiteName" />
                <asp:BoundField DataField="WorkOrderID" HeaderText="Work Order" InsertVisible="False" ReadOnly="True" SortExpression="WorkOrderID" />
                <asp:BoundField DataField="CreateDate" HeaderText="Create Date" SortExpression="CreateDate" DataFormatString="{0:d}" ApplyFormatInEditMode="True" />
                <asp:BoundField DataField="StartDate" HeaderText="Start Date" SortExpression="StartDate" DataFormatString="{0:d}" ApplyFormatInEditMode="True"  />
                <asp:BoundField DataField="CompleteDate" HeaderText="Complete Date" SortExpression="CompleteDate" DataFormatString="{0:d}" ApplyFormatInEditMode="True" />
                <asp:BoundField DataField="CloseDate" HeaderText="Close Date" SortExpression="CloseDate" DataFormatString="{0:d}" ApplyFormatInEditMode="True"  />
                <asp:BoundField DataField="VIN" HeaderText="VIN" SortExpression="VIN" />
                
                <asp:TemplateField  HeaderText="StockNumber">
                    <ItemTemplate>
                        <asp:Label ID="lblStockNum" runat="server" Text='<%# Eval("StockNumber") %>'></asp:Label>
                    </ItemTemplate>

                

                </asp:TemplateField>
          
                <asp:BoundField DataField="RoNumber" HeaderText="RO Number" SortExpression="RoNumber" />
                <asp:templatefield HeaderText="Notes"  >
                    <ItemTemplate>
                        <asp:Label ID="lblNotes" runat="server" Text='<%# Eval("Notes") %>'></asp:Label>
                    </ItemTemplate>

                </asp:templatefield>

                <asp:templatefield HeaderText="Status"  >

                    <ItemTemplate>
                        <asp:label ID="lblStatus" runat="server" text='<%# Eval("StatusName") %>'>></asp:label>
                    </ItemTemplate>


                </asp:templatefield>
                
                  <asp:templatefield HeaderText="Service"  >

                    <ItemTemplate>
                        <asp:label ID="lblService" runat="server" text='<%# Eval("ServiceName") %>'>></asp:label>
                    </ItemTemplate>


                </asp:templatefield>

                   <asp:templatefield HeaderText="Employee"  >

                    <ItemTemplate>
                        <asp:label ID="lblEmployee" runat="server" text='<%# Eval("LastName") %>'>></asp:label>
                    </ItemTemplate>

                </asp:templatefield>

                <asp:BoundField DataField="RatingName" HeaderText="Rating" SortExpression="RatingName" />
                <asp:BoundField DataField="Delivery" HeaderText="Delivery" SortExpression="Delivery" />
            </Columns>
            <EditRowStyle CssClass="table-condensed" />
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
  
        <asp:ObjectDataSource ID="odsOrdersToEdit" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.ShowMeWorkOrdersBySiteToEditTableAdapter">
            <SelectParameters>
              <asp:ControlParameter ControlID="lblsiteid" Name="SiteID" />
      
            </SelectParameters>
        </asp:ObjectDataSource>
  
    </div>

</asp:Content>
