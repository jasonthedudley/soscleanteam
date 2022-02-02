<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Create.aspx.vb" Inherits="SOSiQ.Create" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />

    <div id="OrderHeader">
     
         <table>

                <tr>
                   
                    <td>&nbsp</td>
                    <td>
                        <asp:Button  ID="btnCreateWorkOrder" runat="server" Text="Create" CssClass="btn-lg" />
                    </td>
                    <td></td> 
                    <td>
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn-lg" />

                    </td>


               </tr>
             <tr>
                  <td colspan="5"><h4>Order Header</h4></td>
             </tr>

            </table>

        <table>

               <tr>
            <td>
                <asp:Label ID="lblVIN" runat="server" Text="VIN: "></asp:Label>
            </td>
        
            <td>
                <asp:TextBox ID="txtVIN" runat="server" MaxLength="8" ToolTip="Last 8 digits" AutoPostBack="True"></asp:TextBox>
            </td>
        
            <td style="width: 4px">
                &nbsp;</td>

            <td>Mileage:</td>
            <td><asp:TextBox ID="txtMileage" runat="server"></asp:TextBox></td>

        </tr>

        <tr>
            
            <td>
                <asp:Label ID="lblStock" runat="server" Text="Stock No:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtStockNo" runat="server"></asp:TextBox>
            </td>
                        
            <td style="width: 4px">
                &nbsp;</td>
                        
            <td>
                <asp:Label ID="lblRoNo" runat="server" Text="RO No:"></asp:Label>
            </td>

            <td>
                <asp:TextBox ID="txtRoNo" runat="server"></asp:TextBox>

            </td>

        </tr>

               <tr>
                
            <td>
                Initial Rating:
            </td>

            <td>
                 <asp:DropDownList ID="ddInitialRating" runat="server" DataSourceID="ddRatingsods" DataTextField="RatingName" DataValueField="InitialRatingID"></asp:DropDownList>
                    <asp:ObjectDataSource ID="ddRatingsods" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetRatings" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.ShowMeTheRatingsTableAdapter"></asp:ObjectDataSource>
            </td>

            <td style="width: 4px">
                 &nbsp;</td>

            <td>
               Notes:
            </td>

            <td>
                <asp:TextBox ID="txtNotes" runat="server" TextMode="MultiLine" Width="178px"></asp:TextBox>
            </td>

        </tr>

        </table>

    </div>  

    <hr />

  <div id="UserInputs" class="table">
     <h4>Service Details</h4>
    <Table runat="server" BorderStyle="Solid" BorderWidth="1px" CellSpacing="1" CssClass="table" BackColor="White" Font-Italic="False" ForeColor="Black">

     

        <tr id="ServiceAndPriceRow">

            <td>
                <asp:Label ID="lblService" runat="server" Text="Service: "></asp:Label>
            </td>

            <td>
                <asp:DropDownList ID="ddService" runat="server" DataSourceID="odsServices" DataTextField="ServiceName" DataValueField="ServiceID" AutoPostBack="True" AppendDataBoundItems="true"><asp:ListItem Value="">Make a selection...</asp:ListItem> </asp:DropDownList>
                <asp:ObjectDataSource ID="odsServices" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.ShowMeTheServicesAndPricesWithIDbyLocationTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lblSiteID" Name="CustomerID" PropertyName="Text" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <br />
               <asp:CheckBox ID="CbDelivery" runat="server" Visible="false" /> <asp:Label ID="lblIncludeDelivery" runat="server" Text="Include Delivery" Visible="false"></asp:Label>


            </td>

            <td style="width: 4px">
                &nbsp;</td>

            <td>
                <asp:Label ID="lblPrice" runat="server" Text="Price: "></asp:Label>
            </td>

            <td>
                    <asp:FormView ID="fvServicePrice" runat="server" DataSourceID="dsPriceLookup">
                        <ItemTemplate>
                            <asp:Label ID="ServicePriceLabel" runat="server" Text='<%#String.Format("{0:C}", Eval("ServicePrice")) %>' />
                        </ItemTemplate>
                    </asp:FormView>
                    <asp:ObjectDataSource ID="dsPriceLookup" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetPrice" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.ShowMeThePricebyLocationIDAndServiceIDTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lblSiteID" Name="CustomerID" Type="Int32" />
                            <asp:ControlParameter ControlID="ddService" Name="ServiceID" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
            </td>


        </tr>

        <tr id="PanelBuffPriceMultiplierRow" visible="false">

            <td># of Panels Buffed:</td>
            <td>                <asp:TextBox ID="txtPriceMultiplier" runat="server" MaxLength="1" TextMode="Number" ToolTip="Only use this for Panel Buff" Width="48px">1</asp:TextBox> <asp:Button ID="btnUpdateCharge" runat="server" Text="Update" /></td>
            <td></td>
            <td>Total Charge:</td>
            <td>    <asp:Label ID="lblTotalCharge" runat="server" Text=""></asp:Label>        </td>

        </tr>

        <tr>
          
            <td>Employee Assigned: </td>
            <td>
                    <asp:DropDownList ID="ddEmployee" runat="server" DataSourceID="ddEmployeeOds" DataTextField="DisplayName" DataValueField="EmployeeID" AppendDataBoundItems="True"><asp:ListItem Value="">Make a selection...</asp:ListItem></asp:DropDownList>
                    <asp:ObjectDataSource ID="ddEmployeeOds" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetEmployees" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.ShowMeActiveEmployeesBySiteTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lblSiteID" Name="siteID" Type="Int32" />
                            <asp:ControlParameter ControlID="cbAllEmployees" DefaultValue="0" Name="bAllEmployees" PropertyName="Checked" Type="Boolean" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
            </td>
            <td style="width: 4px">
                    &nbsp;</td>
              <td>
                    All Employees?:
            </td>
            <td>
                <asp:CheckBox ID="cbAllEmployees" runat="server" AutoPostBack="True" />
            </td>

        </tr>

    </Table>
</div>


    <hr />

  <div id="Vin Lookup">

            <h4>Vin History</h4>

            <asp:GridView ID="gvVinHistory" runat="server" AutoGenerateColumns="False" CellPadding="4" CssClass="table-condensed" DataSourceID="odsVinHistory" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="VIN" HeaderText="VIN" SortExpression="VIN" />
                    <asp:BoundField DataField="ServiceName" HeaderText="Service" SortExpression="ServiceName" />
                    <asp:BoundField DataField="FirstName" HeaderText="First" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="Last" SortExpression="LastName" />
                    <asp:BoundField DataField="customer name" HeaderText="Site" SortExpression="customer name"></asp:BoundField>
                    <asp:BoundField DataField="Date Recieved" HeaderText="Date Recieved" SortExpression="Date Recieved" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="CompleteDate" DataFormatString="{0:d}" HeaderText="Date Complete" SortExpression="CompleteDate" />
                    <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />

                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>

            <asp:ObjectDataSource ID="odsVinHistory" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.ShowMeTheVinHistoryTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtVIN" Name="VIN" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>

        </div>


    
</asp:Content>
