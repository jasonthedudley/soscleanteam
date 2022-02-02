<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Update.aspx.vb" Inherits="SOSiQ.Update" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />

    <div class="jumbotron" id="Header">
        <h1>Team Members</h1>
    </div>

    <br />


    <div id="Table">

        <asp:GridView ID="gvUpdateEmployees" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" 
            BorderWidth="1px" CellPadding="3" CssClass="table-condensed" ForeColor="Black" GridLines="Vertical" AutoGenerateEditButton="true" allowediting="true"
            onrowediting="gvUpdateEmployees_RowEditing" onrowupdating="gvUpdateEmployees_RowUpdating" OnRowCancelingEdit="gvUpdateEmployees_RowCancelingEdit"

            >
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>

                <asp:TemplateField HeaderText="Role">

                    <ItemTemplate>
                        <asp:Label ID="lblPhone" runat="server" Text='<%# Bind("RoleName") %>'></asp:Label>
                    </ItemTemplate>

                    <EditItemTemplate>
                        <asp:DropDownList ID="ddRoleName" runat="server" DataSourceID="odsRole" DataTextField="RoleName" DataValueField="RoleID" AppendDataBoundItems="true" selectedvalue='<%# Bind("RoleID") %>'></asp:DropDownList>

                        <asp:ObjectDataSource ID="odsRole" runat="server" OldValuesParameterFormatString="{0}" SelectMethod="GetData" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.EmployeeRoleTableAdapter" >

                        </asp:ObjectDataSource>

                    </EditItemTemplate>

                </asp:TemplateField>
              <asp:TemplateField HeaderText="Last Name">

                    <ItemTemplate>
                        <asp:Label ID="lblLastName" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                    </ItemTemplate>

                    <EditItemTemplate>
                        <asp:TextBox ID="txtLastName" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>

                    </EditItemTemplate>

                </asp:TemplateField>
              <asp:TemplateField HeaderText="First Name">

                    <ItemTemplate>
                        <asp:Label ID="lblFirstName" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                    </ItemTemplate>

                    <EditItemTemplate>
                        <asp:TextBox ID="txtFirstName" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>

                    </EditItemTemplate>

                </asp:TemplateField>
                <asp:TemplateField HeaderText="Phone">

                    <ItemTemplate>
                        <asp:Label ID="lblPhone" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
                    </ItemTemplate>

                    <EditItemTemplate>
                        <asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>

                    </EditItemTemplate>

                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Address">

                    <ItemTemplate>
                        <asp:Label ID="lblAddress" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                    </ItemTemplate>

                    <EditItemTemplate>
                        <asp:TextBox ID="txtAddress" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>

                    </EditItemTemplate>

                </asp:TemplateField>
                 <asp:TemplateField HeaderText="City">

                    <ItemTemplate>
                        <asp:Label ID="lblCity" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                    </ItemTemplate>

                    <EditItemTemplate>
                        <asp:TextBox ID="txtCity" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>

                    </EditItemTemplate>

                </asp:TemplateField>
                <asp:TemplateField HeaderText="State">

                    <ItemTemplate>
                        <asp:Label ID="lblState" runat="server" Text='<%# Bind("State") %>'></asp:Label>
                    </ItemTemplate>

                    <EditItemTemplate>
                        <asp:TextBox ID="txtState" runat="server" Text='<%# Bind("State") %>'></asp:TextBox>

                    </EditItemTemplate>

                </asp:TemplateField>
                <asp:TemplateField HeaderText="Zip">

                    <ItemTemplate>
                        <asp:Label ID="lblZip" runat="server" Text='<%# Bind("Zip") %>'></asp:Label>
                    </ItemTemplate>

                    <EditItemTemplate>
                        <asp:TextBox ID="txtZip" runat="server" Text='<%# Bind("Zip") %>'></asp:TextBox>

                    </EditItemTemplate>

                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status">

                    <ItemTemplate>
                        <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("StatusName") %>'></asp:Label>
                    </ItemTemplate>

                    <EditItemTemplate>


                        <asp:DropDownList ID="ddStatus" runat="server" DataSourceID="odsStatus" DataTextField="StatusName" DataValueField="EmployeeStatusID" AppendDataBoundItems="true" selectedvalue='<%# Bind("EmployeeStatusID") %>'>
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="odsStatus" runat="server" OldValuesParameterFormatString="{0}" SelectMethod="GetData" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.ShowMeTheEmployeeStatusOptionsTableAdapter"></asp:ObjectDataSource>


                    </EditItemTemplate>

                </asp:TemplateField>
                <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" readonly ="true"/>
                <asp:TemplateField HeaderText="Pay">

                    <ItemTemplate>
                        <asp:Label ID="lblPayType" runat="server" Text='<%# Bind("PayTypeName") %>'></asp:Label>
                    </ItemTemplate>

                    <EditItemTemplate>


                        <asp:DropDownList ID="ddPay" runat="server" DataSourceID="odsPayType" DataTextField="PayTypeName" DataValueField="PayTypeID" AppendDataBoundItems="true" selectedvalue='<%# Bind("PayTypeID") %>'>
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="odsPayType" runat="server" OldValuesParameterFormatString="{0}" SelectMethod="GetData" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.EmployeePayTableAdapter"></asp:ObjectDataSource>


                    </EditItemTemplate>

                </asp:TemplateField>
                <asp:BoundField DataField="SiteName" HeaderText="SiteName" SortExpression="SiteName" ReadOnly="true" />
                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" SortExpression="EmployeeID" ReadOnly="true" />
                
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

     <!-- <asp:ObjectDataSource ID="odsUpdateTheTeam" runat="server" OldValuesParameterFormatString="{0}" SelectMethod="GetData" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.ShowMeTheEmployeesForUpdateTableAdapter" UpdateMethod="UpdateTeam"></asp:ObjectDataSource> -->
       

    </div>


                    <!--
                    -->


</asp:Content>
