Public Class SiteMaster
    Inherits MasterPage

    Public sSiteID As String = ""
    Public sUserName As String = ""
    Protected lblSiteID As Label
    Protected lblSiteName As Label
    Protected lblEmpId As Label
    Protected lblMessage As Label

    Protected Sub Page_Load(ByVal sender As Object, e As EventArgs) Handles Me.Load
        If System.Web.HttpContext.Current.User.Identity.IsAuthenticated Then
            sUserName = Membership.GetUser()?.UserName
            If Not String.IsNullOrEmpty(sUserName) Then
                Try
                    ' Initialize TableAdapter for site data
                    Dim taSiteData As New SOSiQsqlDBTableAdapters.ShowMeTheSiteOfTheCurrentUserTableAdapter
                    Dim dtSiteData As New SOSiQsqlDB.ShowMeTheSiteOfTheCurrentUserDataTable
                    dtSiteData = taSiteData.GetData(sUserName)

                    If dtSiteData IsNot Nothing AndAlso dtSiteData.Rows.Count > 0 Then
                        lblSiteID.Text = dtSiteData.Rows(0).Item(0).ToString()  ' First column (e.g., SiteID)
                        lblSiteName.Text = dtSiteData.Rows(0).Item(1).ToString()  ' Second column (e.g., SiteName)
                    Else
                        lblMessage.Text = "No site data found for user: " & sUserName
                    End If

                    ' Initialize TableAdapter for employee data
                    Dim taEmployeeByUserName As New SOSiQsqlDBTableAdapters.SelectEmpIDbyUserNameTableAdapter
                    Dim dtEmpId As New SOSiQsqlDB.SelectEmpIDbyUserNameDataTable
                    dtEmpId = taEmployeeByUserName.GetData(sUserName)

                    If dtEmpId IsNot Nothing AndAlso dtEmpId.Rows.Count > 0 Then
                        lblEmpId.Text = dtEmpId.Rows(0).Item(0).ToString()  ' First column (e.g., EmployeeID)
                    Else
                        lblEmpId.Text = "No employee ID found for user: " & sUserName
                    End If
                Catch ex As Exception
                    lblMessage.Text = "Error loading data: " & ex.Message
                End Try
            Else
                lblMessage.Text = "Username not available."
            End If
        Else
            Response.Redirect("~/default.aspx")  ' Redirect to login if not authenticated
        End If
    End Sub
End Class