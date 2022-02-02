Imports Microsoft.AspNet.Web
Public Class ViewAllUsers
    Inherits System.Web.UI.Page

    Dim myusers As MembershipUserCollection
    Dim Currentuser As MembershipUser





    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        myusers = Membership.GetAllUsers()


        gvAllUsers.DataSource = myusers

        If Not Page.IsPostBack Then

            gvAllUsers.DataBind()

        End If

    End Sub








End Class