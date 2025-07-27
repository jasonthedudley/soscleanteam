<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AddNewSite.aspx.vb" Inherits="SOSiQ.AddNewSite" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Add New Site</title>
    <!-- Assume Bootstrap in Content/css; add link if needed -->
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Add New Site</h1>
            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
            <div class="form-group">
                <asp:Label ID="lblSiteName" runat="server" Text="Site Name:"></asp:Label>
                <asp:TextBox ID="txtSiteName" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvSiteName" runat="server" ControlToValidate="txtSiteName" ErrorMessage="Required" CssClass="text-danger" />
            </div>
            <div class="form-group">
                <asp:Label ID="lblAddress" runat="server" Text="Address:"></asp:Label>
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group">
                <asp:Label ID="lblCity" runat="server" Text="City:"></asp:Label>
                <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group">
                <asp:Label ID="lblState" runat="server" Text="State:"></asp:Label>
                <asp:TextBox ID="txtState" runat="server" CssClass="form-control" MaxLength="2" />
            </div>
            <div class="form-group">
                <asp:Label ID="lblZip" runat="server" Text="ZIP:"></asp:Label>
                <asp:TextBox ID="txtZip" runat="server" CssClass="form-control" TextMode="Number" />
            </div>
            <div class="form-group">
                <asp:Label ID="lblPhone" runat="server" Text="Phone:"></asp:Label>
                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" TextMode="Phone" />
            </div>
            <asp:Button ID="btnSubmit" runat="server" Text="Add Site" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
        </div>
    </form>
</body>
</html>