<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="TimeClock.aspx.vb" Inherits="SOSiQ.Clocking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="jumbotron" id="Header">

        <h1>Team Member Time Keeping</h1>

        <h3>Todays Date: <asp:Label ID="lblToday" runat="server" Text=""></asp:Label></h3>

        
    </div>
    <br />
    <div id="status">

        <table>
            <tr>
                <td align="right"><h4>Status:</h4></td>
                <td>&nbsp<asp:Label ID="lblStatus" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td><h4>Last Punch:</h4></td>
                <td>&nbsp<asp:Label ID="lblLastDateTimePunched" runat="server" Text=""></asp:Label></td>
            </tr>
        </table>

    </div>

    <br />

    <div id="table">

        <table>

            <tr>

                <td><asp:Button ID="btnClockIn" runat="server" Text="Clock In" CssClass="btn-lg" width="150px"/></td>
                
            </tr>
            <tr>
                <td><br /></td>
            </tr>

            <tr>

                <td><asp:Button ID="btnClockOut" runat="server" Text="Clock Out" CssClass="btn-lg" Width="150px" /></td>

            </tr>
        </table>


    </div>

</asp:Content>
