Imports System.Web.Security
Public Class ChangeEmail
    Inherits System.Web.UI.Page

    Dim myusers As MembershipUserCollection

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        myusers = Membership.GetAllUsers()

        UsersGridView.DataSource = myusers

        If Not Page.IsPostBack Then

            UsersGridView.DataBind()

        End If

    End Sub

    Private Sub DisplayUserDetailsInGrid()
        Dim users As MembershipUserCollection = Membership.GetAllUsers


    End Sub



    Protected Sub UsersGridView_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles UsersGridView.RowEditing

        UsersGridView.EditIndex = e.NewEditIndex
        UsersGridView.DataBind()


    End Sub

    Protected Sub UsersGridView_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles UsersGridView.RowUpdating

        Dim index As Integer = UsersGridView.EditIndex
        Dim gvrow As GridViewRow = UsersGridView.Rows(index)
        Dim sUsername As String
        Dim sEmail As String

        sUsername = DirectCast(gvrow.Cells(1).Controls(0), TextBox).Text
        sEmail = DirectCast(gvrow.Cells(2).Controls(0), TextBox).Text
        Dim user As MembershipUser = Membership.GetUser(sUsername)
        If user IsNot Nothing Then
            user.Email = sEmail
            Membership.UpdateUser(user)
            lblResult.Text = String.Format("{0} Details updated Successfully", sUsername)
        Else
            lblResult.Text = String.Format("{0} Update Failed", sUsername)
        End If
        UsersGridView.EditIndex = -1
        UsersGridView.DataBind()



    End Sub
End Class