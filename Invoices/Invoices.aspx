<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Invoices.aspx.vb" Inherits="SOSiQ.Invoices" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />

    <div class="" id="header"><h1>Invoices for your site:</h1></div>

    
    <hr />
    <table CssClass="table-condensed" style="padding: 10px; margin: 10px;">
        <tr>
            <th style="height: 22px">Date Paid:</th>
            <td style="height: 22px"><asp:TextBox ID="txtDatePaid" runat="server" TextMode="Date"></asp:TextBox></td>
            <th style="text-align:right";"height: 22px">Check Amount:</th>
            <td style="height: 22px"><asp:TextBox ID="txtAmount" runat="server"></asp:TextBox></td>
        </tr>
     

        <tr>
            <td></td>
            <td style="text-align: right">
                <asp:Button ID="btnSubtotal" runat="server" Text="Calculate Total" />
            </td>
                <th>Selected Invoices Total:</th>
                <td><asp:Label ID="lblSelectionTotal" runat="server" Text=""></asp:Label></td>
        </tr>

           <tr>
               <td></td>
               <td></td>
                <td colspan="2" style="text-align: right"><asp:Button ID="btnMarkPaid" runat="server" Text="Mark Selected Invoices As Paid" Font-Size="Small" /></td>        


        </tr>
        </table>
    <hr />



    <div id="gridviewcontrols">
        <table CssClass="table-condensed" >
            <tr>
                <th>Date Begin:</th>
                <td><asp:TextBox ID="txtDateBegin" runat="server" TextMode="Date" Width="100%"></asp:TextBox></td>
                <th>Date End:</th>
                <td><asp:TextBox ID="txtDateEnd" runat="server" TextMode="Date"></asp:TextBox></td>
                <td>&nbsp</td>
                <td >  <asp:Button ID="btnFilter" runat="server" Text="Update Table" /></td>

               
            </tr>
            <tr>
                <th>Filter by status:</th>
                <td><asp:DropDownList ID="ddInvoiceStatus" runat="server" Width="100%" DataSourceID="odsInvoiceStatusFilter" DataTextField="Name" DataValueField="StatusID" AppendDataBoundItems="true"><asp:ListItem Text="Select a status..." Value=0></asp:ListItem> </asp:DropDownList>
                    <asp:ObjectDataSource ID="odsInvoiceStatusFilter" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="ShowMeTheInvoiceStatus" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.InvoiceStatusTableAdapter"></asp:ObjectDataSource>
                </td>
                <td>&nbsp</td>
                <td>&nbsp</td>
                <td>&nbsp</td>
                <td><asp:Button ID="btnClearFilter" runat="server" Text="Reset Table" /></td>
            </tr>
            </table>
        <hr />  
        <table>
            <tr>
                <td><asp:Button ID="btnSelectAll" runat="server" Text="Select All" /></td>
                <td width="30px">&nbsp</td>
                <td>&nbsp</td>
                <td>&nbsp</td>
                <td><asp:Button ID="btnUnselectAll" runat="server" Text="Unselect All"/></td>
                <td width="30px">&nbsp</td>
                <td>&nbsp</td>
                <td>&nbsp</td>
          
                <td><asp:Button ID="btnPrintInvoice" runat="server" Text="Reprint"  /></td>
                <td width="30px">&nbsp</td>
                <td>&nbsp</td>
                <td>&nbsp</td>
                <td>
                    <asp:Button ID="btnExportData" runat="server" Text="Export data" />
                </td>
                <td></td>

            </tr>
            
        </table>
        <hr />
    </div>
    <div id="GridView" style="overflow:scroll">
        <asp:GridView ID="gvInvoices" runat="server" AutoGenerateColumns="False" CssClass="table-condensed" 
            DataKeyNames="InvoiceNumber" DataSourceID="odsUpdatingInvoice" BackColor="White" BorderColor="#999999" 
            BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" AutoGenerateEditButton="True" AllowSorting="True">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
            
                 <asp:templatefield HeaderText="Select">
                    <itemtemplate>
                        <asp:checkbox ID="cbSelect" CssClass="gridCB" runat="server" AutoPostBack="True" OnCheckedChanged="cbSelect_CheckedChanged"></asp:checkbox>
                    </itemtemplate>
                </asp:templatefield>
                
                <asp:BoundField DataField="InvoiceNumber" HeaderText="Invoice No." ReadOnly="True" SortExpression="InvoiceNumber" />
                <asp:BoundField DataField="WorkOrderID" HeaderText="Work Order"  ReadOnly="True" SortExpression="WorkOrderID" />
                <asp:BoundField DataField="DateCreated" HeaderText="Date Created"  ReadOnly="True" SortExpression="DateCreated" DataFormatString="{0:d}" />

                <asp:TemplateField HeaderText="DatePaid" SortExpression="DatePaid">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DatePaid", "{0:d}") %>' TextMode="Date"></asp:TextBox>

                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("DatePaid", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="VIN" HeaderText="VIN" SortExpression="VIN" readonly="true"/>
                 <asp:BoundField DataField="StockNumber" HeaderText="StockNumber" SortExpression="StockNumber" readonly="true"/>
                <asp:BoundField DataField="ServiceName" HeaderText="Service"  ReadOnly="True" SortExpression="ServiceName" />
                <asp:TemplateField HeaderText="Status">
                    <ItemTemplate>
                        <%# Eval("Name") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddStatus" runat="server" DataSourceID="odsInvoiceStatus"  AppendDataBoundItems="True" DataTextField="Name" DataValueField="StatusID" SelectedValue='<%# Bind("StatusID", "{0}") %>'></asp:DropDownList>
                        <asp:ObjectDataSource ID="odsInvoiceStatus" runat="server" OldValuesParameterFormatString="{0}" SelectMethod="ShowMeTheInvoiceStatus" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.InvoiceStatusTableAdapter"></asp:ObjectDataSource>
                    </EditItemTemplate>
                </asp:TemplateField>
             <asp:TemplateField HeaderText="Notes">
                    <ItemTemplate>
                        <asp:label ID="lblNotes" runat="server" text='<%# Eval("Notes") %>'>></asp:label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtNotes" runat="server" TextMode="MultiLine" Text='<%# Bind("Notes")%>'></asp:TextBox>  
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="SiteName" HeaderText="SiteName" SortExpression="SiteName" ReadOnly="true" />

                 <asp:BoundField DataField="WorkOrder Notes" HeaderText="WorkOrder Notes" SortExpression="WorkOrder Notes" readonly="true"/>

                 <asp:BoundField DataField="Amount" DataFormatString="{0:c}" HeaderText="Amount" SortExpression="Amount" ReadOnly="true " />

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

        <asp:ObjectDataSource ID="odsUpdatingInvoice" runat="server" OldValuesParameterFormatString="{0}" SelectMethod="GetData" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.ShowMeTheInvoicesBySiteTableAdapter" UpdateMethod="Update">
            <SelectParameters>
              <asp:ControlParameter ControlID="lblsiteid" Name="SiteID" />
      
            </SelectParameters>

            <UpdateParameters>
                <asp:Parameter Name="InvoiceNumber" Type="Int32" />
                <asp:Parameter Name="StatusID" Type="Int32" />
                <asp:Parameter Name="DatePaid" Type="DateTime" />
                <asp:Parameter Name="Notes" Type="String" />
            </UpdateParameters>

        </asp:ObjectDataSource>

   


    </div>

</asp:Content>
