<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="EditInvoice.aspx.vb" Inherits="SOSiQ.EditInvoice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />

    <asp:FormView ID="fvEditInvoice" runat="server" DataKeyNames="InvoiceNumber" DataSourceID="odsEditInvoiceView" DefaultMode="Edit" CssClass="table-condensed" Width="464px">
        <EditItemTemplate>
            <table>
                <tr>
                    <th>Invoice Number:</th>
                    <td><asp:Label ID="lblInvoiceNumber" runat="server" Text='<%# Eval("InvoiceNumber") %>' /></td>

                </tr>
                <tr>
                    <th>Work Order:</th>
                    <td><asp:TextBox ID="WorkOrderIDTextBox" runat="server" Text='<%# Bind("WorkOrderID") %>' ReadOnly="true" /></td>
                </tr>
                <tr>
                    <th>Date Created:</th>
                    <td><asp:TextBox ID="DateCreatedTextBox" runat="server" Text='<%# Bind("DateCreated", "{0:d}") %>' ReadOnly="true" /></td>
                </tr>
                <tr>
                    <th>Date Paid:</th>
                    <td><asp:TextBox ID="txtDatePaid" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "DatePaid", "{0:yyyy-MM-dd}") %>' TextMode="Date"></asp:TextBox></td>
                </tr>
                <tr>
                    <th>Service:</th>
                    <td><asp:TextBox ID="ServiceNameTextBox" runat="server" Text='<%# Bind("ServiceName") %>' ReadOnly="true" /></td>
                </tr>
                <tr>
                    <th>Site:</th>
                    <td><asp:TextBox ID="SiteNameTextBox" runat="server" Text='<%# Bind("SiteName") %>' ReadOnly="true" /></td>
                </tr>
                <tr>
                    <th> Status:</th>
                    <td>

                         <asp:DropDownList ID="ddStatus" runat="server" DataSourceID="odsInvoiceStatus"  AppendDataBoundItems="True" DataTextField="Name" DataValueField="StatusID" SelectedValue='<%# Bind("StatusID", "{0}") %>'></asp:DropDownList>
                        <asp:ObjectDataSource ID="odsInvoiceStatus" runat="server" OldValuesParameterFormatString="{0}" SelectMethod="ShowMeTheInvoiceStatus" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.InvoiceStatusTableAdapter"></asp:ObjectDataSource>

                    </td>
                </tr>
              
                <tr>
                    <th>Invoice Notes:</th>
                    <td><asp:TextBox ID="txtInvoiceNotes" runat="server" Text='<%# Bind("Notes") %>' TextMode="MultiLine" /></td>
                </tr>
                <tr>
                    <th>TotalCharge:</th>
                    <td><asp:TextBox ID="TotalChargeTextBox" runat="server" Text='<%# Bind("TotalCharge") %>' ReadOnly="true" TextMode="Number" /></td>
                </tr>
                <tr>
                    <th>Amount:</th>
                    <td><asp:TextBox ID="AmountTextBox" runat="server" Text='<%# Bind("Amount") %>' ReadOnly="true" /></td>
                </tr>
                <tr>
                    <th>VIN:</th>
                    <td><asp:TextBox ID="VINTextBox" runat="server" Text='<%# Bind("VIN") %>' ReadOnly="true" /></td>
                </tr>
                <tr>
                    <th>StockNumber:</th>
                    <td> <asp:TextBox ID="StockNumberTextBox" runat="server" Text='<%# Bind("StockNumber") %>' ReadOnly="true" /></td>
                </tr>
                <tr>
                    <th>WorkOrder Notes:</th>
                    <td> <asp:TextBox ID="WorkOrder_NotesTextBox" runat="server" Text='<%# Bind("[WorkOrder Notes]") %>' ReadOnly="true" /></td>
                </tr>


            </table>


   
      
      <hr />
           
        </EditItemTemplate>


    </asp:FormView>

     <Table> 
        <tr>
            <td><asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn-lg" /></td>
            <td width="100px"></td>
            <td><asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn-lg" /></td>
            <td width="100px"></td>
            <td></td>
        </tr>
    </Table>


    <asp:ObjectDataSource ID="odsEditInvoiceView" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy1" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.ShowMeTheInvoicesBySiteTableAdapter" UpdateMethod="Update">
        <SelectParameters>
            <asp:QueryStringParameter Name="InvoiceID" QueryStringField="InvoiceID" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="InvoiceNumber" Type="Int32" />
            <asp:Parameter Name="StatusID" Type="Int32" />
            <asp:Parameter Name="DatePaid" Type="DateTime" />
            <asp:Parameter Name="Notes" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>





</asp:Content>
