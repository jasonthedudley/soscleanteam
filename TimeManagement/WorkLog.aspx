<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="WorkLog.aspx.vb" Inherits="SOSiQ.WorkLog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Work Log</h1>
    </div>
    <div class="div.line"></div>

    <div id="Date">
        <table>
            <tr>
                <td><h3>Choose a date:</h3></td>
                <td>
                    <asp:TextBox ID="txtDate" runat="server" TextMode="Date"></asp:TextBox></td>
                <td></td>
                <td>
                    <asp:Button ID="btnLoadGridView" runat="server" Text="Update Table" /></td>


            </tr>
            <tr><td>Employee ID:</td><td>
                <asp:Label ID="lblEmpID" runat="server" Text="Label"></asp:Label></td></tr>

        </table>

    </div>
    <div class="div.line"></div>

    <div id="Table">

        <asp:GridView ID="gvWorkLog" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" CssClass="table-condensed" DataSourceID="odsWorkLogTable" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="Employee Number" HeaderText="Employee Number" SortExpression="Employee Number" />
                <asp:BoundField DataField="Last" HeaderText="Last" SortExpression="Last" />
                <asp:BoundField DataField="First" HeaderText="First" SortExpression="First" />
                <asp:BoundField DataField="Date Time WO Completed" HeaderText="Date Time WO Completed" SortExpression="Date Time WO Completed" />
                <asp:BoundField DataField="Work Order Number" HeaderText="Work Order Number" SortExpression="Work Order Number" />
                <asp:BoundField DataField="VIN" HeaderText="VIN" SortExpression="VIN" />
                <asp:BoundField DataField="Service" HeaderText="Service" SortExpression="Service" />
                <asp:BoundField DataField="Payout" HeaderText="Payout" SortExpression="Payout" DataFormatString="{0:C2}" />
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

        <asp:ObjectDataSource ID="odsWorkLogTable" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.ShowMeTheWorkLogTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="lblEmpID" Name="EmpId" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="txtDate" Name="_Date" PropertyName="Text" Type="DateTime" />
            </SelectParameters>
        </asp:ObjectDataSource>

      <hr />

        <div id="TotalPay">

            <table>
                <tr>
                    <td>Total Payout:</td>
                    <td>
                        <asp:Label ID="lblTotalPay" runat="server" Text=""></asp:Label></td>
                </tr>
            </table>


        </div>

    </div>
</asp:Content>
