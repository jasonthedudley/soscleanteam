Imports SOSiQ.SOSiQsqlDBTableAdapters
Imports System.Web.Security

Public Class Clocking
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then



            Dim taGetEmpId As New SOSiQsqlDBTableAdapters.SelectEmpIDbyUserNameTableAdapter()
            Dim taGetEmpClockStatus As New SOSiQsqlDBTableAdapters.EmployeeClockStatusTableAdapter()

            Dim dtEmpId As New DataTable
            Dim dtStatus As New DataTable

            'label on page to show user the current date
            lblToday.Text = Today.ToShortDateString

            'holds the string results from the tableadapter on the clocked in or out status of the employee
            Dim sStatus As String = ""
            'holds the time of the last activity of the employee
            Dim datetimeLastPunch As DateTime = Nothing
            'holds the employeeid as an integer to be passed into the tableadapter
            Dim iEmployeeID As Integer = 0
            'holds teh username to be passed into the tableadapter
            Dim sUserName As String = Membership.GetUser.UserName

            dtEmpId = taGetEmpId.GetData(sUserName)

            Dim iEmpId As Integer = dtEmpId.Rows(0)(0)
            dtStatus = taGetEmpClockStatus.GetData(iEmpId)
            sStatus = dtStatus.Rows(0)(0)
            Try

                datetimeLastPunch = dtStatus.Rows(0)(1)
                lblLastDateTimePunched.Text = datetimeLastPunch.ToString
            Catch

                lblLastDateTimePunched.Text = ""

            End Try

            'update the label with the clocked status of the employee, clocked in or clocked out
            lblStatus.Text = sStatus

            If lblStatus.Text = "Clocked Out" Then
                btnClockOut.Enabled = False
                btnClockIn.Enabled = True
            Else
                btnClockOut.Enabled = True
                btnClockIn.Enabled = False
            End If

        End If
    End Sub

    Protected Sub btnClockIn_Click(sender As Object, e As EventArgs) Handles btnClockIn.Click
        Dim taGetEmpId As New SOSiQsqlDBTableAdapters.SelectEmpIDbyUserNameTableAdapter()
        Dim dtEmpId As New DataTable
        Dim sUserName As String = Membership.GetUser.UserName
        dtEmpId = taGetEmpId.GetData(sUserName)
        Dim iEmpId As Integer = dtEmpId.Rows(0)(0)

        Dim taEmployeePunch As New SOSiQsqlDBTableAdapters.ShowMeTheTimeClockTableTableAdapter

        Dim tPunchDateTime As DateTime = Now

        taEmployeePunch.Insert(iEmpId, tPunchDateTime, 1)

        Response.Redirect(Request.RawUrl)

    End Sub

    Protected Sub btnClockOut_Click(sender As Object, e As EventArgs) Handles btnClockOut.Click

        Dim taGetEmpId As New SOSiQsqlDBTableAdapters.SelectEmpIDbyUserNameTableAdapter()
        Dim dtEmpId As New DataTable
        Dim sUserName As String = Membership.GetUser.UserName
        dtEmpId = taGetEmpId.GetData(sUserName)
        Dim iEmpId As Integer = dtEmpId.Rows(0)(0)

        Dim taEmployeePunch As New SOSiQsqlDBTableAdapters.ShowMeTheTimeClockTableTableAdapter
        Dim tPunchDateTime As DateTime = Now

        taEmployeePunch.Insert(iEmpId, tPunchDateTime, 0)

        Response.Redirect(Request.RawUrl)

    End Sub


End Class