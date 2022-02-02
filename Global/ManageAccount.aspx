<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ManageAccount.aspx.vb" Inherits="SOSiQ.ManageAccount" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div> 

      </div>
    <br />
    
           
 
      <asp:ChangePassword ID="ChangePassword1" runat="server" CancelDestinationPageUrl="~/Global/GlobalDefault.aspx" ContinueDestinationPageUrl="~/Global/GlobalDefault.aspx" PasswordRecoveryUrl="~/Recover.aspx"></asp:ChangePassword>
 

</asp:Content>
