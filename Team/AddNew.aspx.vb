Imports SOSiQ.SOSiQsqlDBTableAdapters
Imports System.Data.SqlClient
Imports System.Configuration
Public Class AddNew
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnAddNew_Click(sender As Object, e As EventArgs) Handles btnAddNew.Click





        Dim sFirstName As String = txtFirstName.Text
        Dim sLastName As String = txtLastName.Text
        Dim sPhoneNo As String = txtPhone.Text
        Dim sAddress1 As String = txtAddress1.Text
        Dim sCity As String = txtCity.Text
        Dim sState As String = txtState.Text
        Dim sZip As String = txtZIP.Text

        'using this to quickly check if all fields have been filled out
        Dim los As New List(Of String)

        los.Add(txtFirstName.Text)
        los.Add(txtLastName.Text)
        los.Add(txtPhone.Text)
        los.Add(txtAddress1.Text)
        los.Add(txtCity.Text)
        los.Add(txtState.Text)
        los.Add(txtZIP.Text)

        For Each item In los

            If item.ToString = "" Then

                Response.Write("<script LANGUAGE='JavaScript' >alert('Please fill out all fields')</script>")
                Exit Sub

            End If

        Next

        If ddRoles.SelectedValue = "Make a selection..." Or ddPayTypes.SelectedValue = "Make a selection..." Or ddLocation.SelectedValue = "Make a selection..." Then

            Response.Write("<script LANGUAGE='JavaScript' >alert('Please fill out all fields')</script>")
            Exit Sub

        End If



        Dim iRoleId As Integer = ddRoles.SelectedValue
        Dim iPayId As Integer = ddPayTypes.SelectedValue
        Dim lblSiteID As Label = Page.Master.FindControl("lblSiteID")
        Dim iSiteID As Integer = CInt(lblSiteID.Text)
        Dim iLocation As Integer = ddLocation.SelectedValue
        Dim taEmployees As New SOSiQsqlDBTableAdapters.SelectAllEmployeesWithDetailsTableAdapter



        Try
                taEmployees.Insert(sFirstName, sLastName, sPhoneNo, sAddress1, sCity, sState, sZip, iPayId, iRoleId, iLocation)


                Response.Write("<script LANGUAGE='JavaScript' >alert('Team Member Added')</script>")

            Catch ex As Exception



                Response.Write("<script LANGUAGE='JavaScript' >alert('Error Adding New Team Member, Please try again.  If the issue persists please contact tech support at techsupport@soscleanteam.com')</script>")

            End Try

            Response.Redirect("~/Team/AddNew.aspx")




    End Sub
End Class