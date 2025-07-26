<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AddSite.aspx.vb" Inherits="Admin_AddSite" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Add New Site</title>
    <script type="text/javascript">
        function validateForm() {
            var siteName = document.getElementById("<%= txtSiteName.ClientID %>").value;
            if (siteName == "") {
                alert("Site Name is required.");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Add New Site</h2>
            <asp:Label ID="lblSiteName" runat="server" Text="Site Name:"></asp:Label>
            <asp:TextBox ID="txtSiteName" runat="server"></asp:TextBox><br />
            <asp:Label ID="lblPhone1" runat="server" Text="Phone 1:"></asp:Label>
            <asp:TextBox ID="txtPhone1" runat="server"></asp:TextBox><br />
            <asp:Label ID="lblAddress1" runat="server" Text="Address 1:"></asp:Label>
            <asp:TextBox ID="txtAddress1" runat="server"></asp:TextBox><br />
            <asp:Label ID="lblCity" runat="server" Text="City:"></asp:Label>
            <asp:TextBox ID="txtCity" runat="server"></asp:TextBox><br />
            <asp:Label ID="lblState" runat="server" Text="State:"></asp:Label>
            <asp:TextBox ID="txtState" runat="server"></asp:TextBox><br />
            <asp:Label ID="lblZip" runat="server" Text="Zip:"></asp:Label>
            <asp:TextBox ID="txtZip" runat="server"></asp:TextBox><br />
            <asp:Button ID="btnSubmit" runat="server" Text="Add Site" OnClientClick="return validateForm();" /><br />
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>