<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="EditWorkOrder.aspx.vb" Inherits="SOSiQ.EditWorkOrder1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<br />
 
    <asp:FormView ID="fvEditWorkOrder" runat="server" DataSourceID="odsEditWorkOrder" DefaultMode="Edit" Width="75%" >
        <EditItemTemplate>
            <table>
                <tr>
                    <th>WorkOrderID:</th>
                    <td>&nbsp</td>

                    <td>
                        <asp:Label ID="WorkOrderIDTextBox" runat="server" Text='<%# Bind("WorkOrderID") %>'></asp:Label></td>
                </tr>


                <tr>
                    <th>VIN:</th>
                    <td>&nbsp</td>
                    <td>
                        <asp:TextBox ID="VINTextBox" runat="server" Text='<%# Bind("VIN") %>' /></td>

                </tr>
                
                <tr>
                    <th>Mileage:</th>
                    <td> &nbsp</td>
                    <td>  <asp:TextBox ID="txtMileage" runat="server" Text='<%# Bind("Mileage") %>' /></td>
                </tr>
                <tr>
                    <th>Vehicle Rating/Adders:</th>
                    <td> &nbsp</td>
                    <td>  <asp:DropDownList ID="ddRating" runat="server" DataTextField="RatingName" DataValueField="InitialRatingID" DataSourceID="odsRatings" AppendDataBoundItems="True">
                        </asp:DropDownList>

                        <asp:ObjectDataSource ID="odsRatings" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetRatings" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.ShowMeTheRatingsTableAdapter">

                        </asp:ObjectDataSource></td>
                </tr>

                <tr>
                    <th>Service:</th>
                    <td>&nbsp</td>
                    <td>
                        <asp:DropDownList ID="ddService" runat="server" DataTextField="ServiceName" DataValueField="ServiceID" DataSourceID="odsServices" AppendDataBoundItems="True">
                        </asp:DropDownList>

                        <asp:ObjectDataSource ID="odsServices" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.ShowMeTheServicesAndPricesWithIDbyLocationTableAdapter">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="lblsiteid" Name="CustomerID" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </td>

                </tr>
                
                <tr>
                    <th> <asp:Label ID="lblDeliveryIncluded" runat="server" Text="Delivery Included:"></asp:Label></th>
                    <td>&nbsp</td>
                    <td><asp:CheckBox ID="cbDeliveryIncluded" runat="server" />  </td>
                     
                </tr>

                <tr>


                </tr>
                 <tr>
                     <th>Qty:</th>
                     <td>&nbsp</td>
                     <td>
                         <asp:TextBox ID="txtQty" runat="server" Text='<%# Eval("Qty") %>' TextMode="Number"></asp:TextBox></td>


                 </tr>

                <tr>
                    <th>Stock No.</th>
                    <td>&nbsp</td>
                    <td>
                        <asp:TextBox ID="txtStockNumber" runat="server" Text='<%# Eval("StockNumber") %>'></asp:TextBox></td>


                </tr>
                <tr>
                    <th>RO No.</th>
                    <td>&nbsp</td>
                    <td>
                        <asp:TextBox ID="RoNumberTextBox" runat="server" Text='<%# Bind("RoNumber") %>' /></td>


                </tr>
                <tr>
                    <th>Status:</th>
                    <td>&nbsp</td>
                    <td>
                        <asp:DropDownList ID="ddStatus" runat="server" DataTextField="StatusName" DataValueField="StatusID" DataSourceID="odsStatuses"></asp:DropDownList>

                        <asp:ObjectDataSource ID="odsStatuses" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetStatuses" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.ShowMeTheWorkOrderStatusesTableAdapter"></asp:ObjectDataSource>
                    </td>


                </tr>

                <tr>
                    <th>Employee:</th>
                    <td>&nbsp</td>
                    <td>
                        <asp:CheckBox ID="cbShowAllEmployees" runat="server" AutoPostBack="True" />
                        &nbsp;Show All<asp:ObjectDataSource ID="odsEmployees" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetEmployees" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.ShowMeActiveEmployeesBySiteTableAdapter">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="lblsiteid" Name="siteID" />
                                <asp:ControlParameter ControlID="cbShowAllEmployees" Name="bAllEmployees" PropertyName="Checked" Type="Boolean" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        <br />
                        <asp:DropDownList ID="ddEmployees" runat="server" DataSourceID="odsEmployees" DataTextField="LastName" DataValueField="EmployeeID">
                        </asp:DropDownList></td>


                </tr>
                <tr>
                    <th>Created on:</th>
                    <td>&nbsp</td>
                    <td>
                        <asp:TextBox ID="CreateDateTextBox" runat="server" Text='<%# Bind("CreateDate") %>' /></td>



                    <tr>
                        <th>Notes:</th>
                        <td>&nbsp</td>
                        <td>
                            <asp:TextBox ID="txtNotes" runat="server" Text='<%# Eval("Notes") %>' TextMode="MultiLine"></asp:TextBox></td>


                    </tr>

            </table>

       
        </EditItemTemplate>
     

    </asp:FormView>

    <asp:ObjectDataSource ID="odsEditWorkOrder" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetOrder" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.ViewOrderForChangeTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="WorkOrderID" QueryStringField="OrderID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

    <Table> 
        <tr>
            <td><asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn-lg" /></td>
            <td width="100px"></td>
            <td><asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn-lg" /></td>
        </tr>
    </Table>
</asp:Content>
