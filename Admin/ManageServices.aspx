<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ManageServices.aspx.vb" Inherits="Admin_ManageServices" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Manage Services and Prices</title>
    <script type="text/javascript">
        function validateForm() {
            var serviceName = document.getElementById("<%= txtServiceName.ClientID %>").value;
            if (serviceName == "") {
                alert("Service Name is required.");
                return false;
            }
            return true;
        }
        function validatePriceForm() {
            var price = document.getElementById("<%= txtPrice.ClientID %>").value;
            if (price == "" || isNaN(price)) {
                alert("Valid Price is required.");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Add/Edit Service</h2>
            <asp:Label ID="lblServiceID" runat="server" Text="Existing Service:"></asp:Label>
            <asp:DropDownList ID="ddlServices" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlServices_SelectedIndexChanged"></asp:DropDownList><br />
            <asp:Label ID="lblServiceName" runat="server" Text="Service Name:"></asp:Label>
            <asp:TextBox ID="txtServiceName" runat="server"></asp:TextBox><br />
            <asp:Label ID="lblDescription" runat="server" Text="Description:"></asp:Label>
            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine"></asp:TextBox><br />
            <asp:Label ID="lblHours" runat="server" Text="Hours:"></asp:Label>
            <asp:TextBox ID="txtHours" runat="server"></asp:TextBox><br />
            <asp:Label ID="lblInvoiced" runat="server" Text="Invoiced:"></asp:Label>
            <asp:CheckBox ID="chkInvoiced" runat="server" Checked="true" /><br />
            <asp:Label ID="lblVehicleType" runat="server" Text="Vehicle Type:"></asp:Label>
            <asp:DropDownList ID="ddlVehicleType" runat="server"></asp:DropDownList><br />
            <asp:Button ID="btnSaveService" runat="server" Text="Save Service" OnClientClick="return validateForm();" /><br />
            
            <h2>Set Price for Service at Site</h2>
            <asp:Label ID="lblSite" runat="server" Text="Site:"></asp:Label>
            <asp:DropDownList ID="ddlSites" runat="server"></asp:DropDownList><br />
            <asp:Label ID="lblPrice" runat="server" Text="Price:"></asp:Label>
            <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox><br />
            <asp:Label ID="lblCommision" runat="server" Text="Commision:"></asp:Label>
            <asp:TextBox ID="txtCommision" runat="server"></asp:TextBox><br />
            <asp:Button ID="btnSavePrice" runat="server" Text="Save Price" OnClientClick="return validatePriceForm();" /><br />
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>