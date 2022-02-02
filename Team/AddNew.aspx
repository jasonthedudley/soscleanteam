<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="AddNew.aspx.vb" Inherits="SOSiQ.AddNew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="jumbotron" id="Title">
    <h1>Add New Team Member</h1>
    </div>

    <div id="EntryForm">

        <table>

            <tr>
                <td>First Name:</td>
                <td><asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox></td>
                <td>&nbsp</td>
                <td>Last Name:</td>
                <td><asp:TextBox ID="txtLastName" runat="server"></asp:TextBox></td>
                <td>&nbsp</td>
                <td>Phone Number:</td>
                <td><asp:TextBox ID="txtPhone" runat="server" TextMode="Phone"></asp:TextBox></td>

            </tr>

            
            <tr>
                <td>&nbsp</td>
                <td>&nbsp</td>
                <td>&nbsp</td>
            </tr>

            
            <tr>
                <td>Mailing Address:</td>
                <td><asp:TextBox ID="txtAddress1" runat="server"></asp:TextBox></td>
                <td>&nbsp</td>
                <td>City:</td>
                <td><asp:TextBox ID="txtCity" runat="server"></asp:TextBox></td>
                <td>&nbsp</td>
                <td>State:</td>
                <td><asp:TextBox ID="txtState" runat="server"></asp:TextBox></td>
                <td>&nbsp</td>
                <td>Zip:</td>
                <td><asp:TextBox ID="txtZIP" runat="server"></asp:TextBox></td>

            </tr>

            <tr>
                               <td>&nbsp</td>
                <td>&nbsp</td>
                <td>&nbsp</td>
            </tr>
                        
            <tr>
                <td>Role:</td>
                <td><asp:DropDownList ID="ddRoles" runat="server" DataSourceID="odsRoles" DataTextField="RoleName" DataValueField="RoleID" AppendDataBoundItems="true"><asp:ListItem>Make a selection...</asp:ListItem></asp:DropDownList>
                    <asp:ObjectDataSource ID="odsRoles" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.EmployeeRoleTableAdapter"></asp:ObjectDataSource>
                </td>
                <td>&nbsp</td>
                <td>Pay Type:</td>
                <td><asp:DropDownList ID="ddPayTypes" runat="server" DataSourceID="odsPayTypes" DataTextField="PayTypeName" DataValueField="PayTypeID" AppendDataBoundItems="true"><asp:ListItem>Make a selection...</asp:ListItem></asp:DropDownList>
                    <asp:ObjectDataSource ID="odsPayTypes" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.EmployeePayTableAdapter"></asp:ObjectDataSource>
                </td>
                <td>&nbsp</td>
                <td>Location:</td>
                <td><asp:DropDownList ID="ddLocation" runat="server" DataSourceID="odsLocations" DataTextField="SiteName" DataValueField="CustomerID" AppendDataBoundItems="true"><asp:ListItem>Make a selection...</asp:ListItem></asp:DropDownList>
                    <asp:ObjectDataSource ID="odsLocations" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.CustomerTableAdapter"></asp:ObjectDataSource>
                </td>


            </tr>

            <tr>
                <td>
                    <asp:Button ID="btnAddNew" runat="server" Text="Submit" CssClass="btn-lg" /></td>
                <td>&nbsp</td>
                <td>
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn-lg" /></td>
            </tr>

        </table>


    </div>
    <br />

    <h4>Active Team Members</h4>
    <div id="ViewEmployees">

        <asp:GridView ID="gvActiveEmployees" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" CssClass="table-condensed" DataSourceID="odsEmployees" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="RoleName" HeaderText="RoleName" SortExpression="RoleName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" />
                <asp:BoundField DataField="StatusName" HeaderText="StatusName" SortExpression="StatusName" />
                <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                <asp:BoundField DataField="PayTypeName" HeaderText="PayTypeName" SortExpression="PayTypeName" />
                <asp:BoundField DataField="SiteName" HeaderText="SiteName" SortExpression="SiteName" />
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


        <asp:ObjectDataSource ID="odsEmployees" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBySiteName" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.SelectAllEmployeesWithDetailsTableAdapter">
            <SelectParameters>
              <asp:ControlParameter ControlID="lblSiteName" Name="P_SiteName" />
            </SelectParameters>
          
        </asp:ObjectDataSource>


    </div>


</asp:Content>
