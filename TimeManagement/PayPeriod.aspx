<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="PayPeriod.aspx.vb" Inherits="SOSiQ.PayPeriod" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <div id="header">
        <div class="jumbotron"><h2>Pay Table</h2></div>

    </div>
    <hr />

    <div id="Dates">
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblStart" runat="server" Text="Period Start"></asp:Label>
                </td>
                
                <td>
                    <asp:TextBox ID="txtStart" runat="server" TextMode="Date"></asp:TextBox>
                </td>

            </tr>
            
            <tr><td></td></tr>

            <tr>
                <td>
                    <asp:Label ID="lblEnd" runat="server" Text="Period End"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEnd" runat="server" TextMode="Date"></asp:TextBox>
                </td>

            </tr>

            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn-lg" /> 

                </td>
            </tr>

        </table>

    </div>
    <hr />
    <div id="Table">

        <asp:GridView ID="gvPayTable" runat="server" AutoGenerateColumns="False" DataSourceID="odsPayTable" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" CssClass="table-condensed" ForeColor="Black" GridLines="Vertical" Visible="False">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="Period Start" HeaderText="Period Start" ReadOnly="True" SortExpression="Period Start" DataFormatString="{0:d}" />
                <asp:BoundField DataField="Period End" HeaderText="Period End" ReadOnly="True" SortExpression="Period End" DataFormatString="{0:d}" />
                <asp:BoundField DataField="Total Payout" HeaderText="Total Payout" ReadOnly="True" SortExpression="Total Payout" DataFormatString="{0:C2}" />
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


        <asp:ObjectDataSource ID="odsPayTable" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="SOSiQ.SOSiQsqlDBTableAdapters.ShowMeThePayPeriodTableTableAdapter">
            <SelectParameters>
              <asp:ControlParameter ControlID="lblEmpId" Name="EmpId" />
                <asp:ControlParameter ControlID="txtStart" Name="PeriodStart" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="txtEnd" Name="PeriodEnd" PropertyName="Text" Type="DateTime" />
            </SelectParameters>
        </asp:ObjectDataSource>


    </div>
</asp:Content>
