<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="UserAndEmployeeManagement.aspx.vb" Inherits="SOSiQ.UserAndEmployeeManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div><h2>Employees and Users</h2></div>

    <hr />

    <div style="max-height:600px;overflow-y:auto;overflow-x:auto" >


        <asp:GridView ID="gvUserManagement" runat="server" AutoGenerateColumns="False" DataKeyNames="EmployeeID" AutoGenerateEditButton="True" CssClass="table-condensed"  HeaderStyle-CssClass="FixedHeader" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:TemplateField HeaderText="EmployeeID" SortExpression="EmployeeID">
                    <ItemTemplate>
                        <asp:Label ID="lblEmpID" runat="server" Text='<%# Bind("EmployeeID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="First Name" HeaderText="First Name"  ReadOnly="True"  SortExpression="First Name" />
                <asp:BoundField DataField="Last Name" HeaderText="Last Name" ReadOnly="True"  SortExpression="Last Name" />
                <asp:TemplateField HeaderText="UserName" SortExpression="UserName">
                    <EditItemTemplate>

                        <asp:DropDownList ID="ddUser" runat="server" DataSourceID="odsAvailableUsers" DataTextField="UserName" DataValueField="UserId" AppendDataBoundItems="True"><asp:ListItem>No Change</asp:ListItem></asp:DropDownList>



                        <asp:ObjectDataSource ID="odsAvailableUsers" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.ShowMeAvailableUsersTableAdapter"></asp:ObjectDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="AppRole" SortExpression="RoleName">
                    <EditItemTemplate>

                        <asp:DropDownList ID="ddAppRole" runat="server" DataSourceID="odsAppRoles" DataTextField="RoleName" DataValueField="RoleID" AppendDataBoundItems="True"><asp:ListItem>No Change</asp:ListItem></asp:DropDownList>



                        <asp:ObjectDataSource ID="odsAppRoles" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.ShowMeTheAppRolesTableAdapter"></asp:ObjectDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("RoleName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>




                <asp:TemplateField HeaderText="Site" SortExpression="Site">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddSite" runat="server" DataSourceID="odsSite" DataTextField="SiteName" DataValueField="CustomerID" AppendDataBoundItems="True"><asp:ListItem>No Change</asp:ListItem>

                        </asp:DropDownList>

                                <asp:ObjectDataSource ID="odsSite" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.ShowMeTheListOfLocationsTableAdapter"></asp:ObjectDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Site") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Role" SortExpression="Role">
                    <EditItemTemplate>

                        <asp:DropDownList ID="ddRole" runat="server" DataSourceID="odsRole" DataTextField="RoleName" DataValueField="RoleID" AppendDataBoundItems="True"><asp:ListItem>No Change</asp:ListItem></asp:DropDownList>


                        <asp:ObjectDataSource ID="odsRole" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.EmployeeRoleTableAdapter"></asp:ObjectDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Role") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Pay Type" SortExpression="Pay Type">
                    <EditItemTemplate>

                        <asp:DropDownList ID="ddPayType" runat="server" DataSourceID="odsPayType" DataTextField="PayTypeName" DataValueField="PayTypeID" AppendDataBoundItems="True"><asp:ListItem>No Change</asp:ListItem></asp:DropDownList>

                        <asp:ObjectDataSource ID="odsPayType" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.EmployeePayTableAdapter"></asp:ObjectDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("[Pay Type]") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status" SortExpression="Status">
                    <EditItemTemplate>

                                <asp:DropDownList ID="ddStatus" runat="server" DataSourceID="odsStatus" DataTextField="StatusName" DataValueField="EmployeeStatusID" AppendDataBoundItems="True"><asp:ListItem>No Change</asp:ListItem></asp:DropDownList>


                                 <asp:ObjectDataSource ID="odsStatus" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.ShowMeTheEmployeeStatusOptionsTableAdapter"></asp:ObjectDataSource>


                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>




            </Columns>
            <FooterStyle BackColor="#CCCCCC" />

<HeaderStyle CssClass="FixedHeader" BackColor="Black" Font-Bold="True" ForeColor="White"></HeaderStyle>
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        
    </div>



</asp:Content>
