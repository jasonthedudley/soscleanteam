<%@ Page Title="" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="SOSiQ._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

       <asp:LoginView runat="server" ViewStateMode="Disabled">

                <AnonymousTemplate>
                    <div class="jumbotron"><h1>Welcome to SOSiQ! </h1></div>

                    <asp:Login ID="Login1" runat="server" DestinationPageUrl="~/Global/GlobalDefault.aspx" FailureText="Your login attempt was not successful. Please try again. Contact admin@soscleanteam.com for help creating an account." PasswordRecoveryText="Forgot Password?" PasswordRecoveryUrl="~/Recover.aspx">
                    </asp:Login>
                </AnonymousTemplate>

                <LoggedInTemplate>
                    <div class="jumbotron"><h1>Welcome back to SOSiQ! </h1></div>
                </LoggedInTemplate>
        </asp:LoginView>

</asp:Content>
