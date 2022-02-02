Public Class SiteMaster
    Inherits MasterPage

    Public sSiteID As String = ""
    Public sUserName As String = ""
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

        If System.Web.HttpContext.Current.User.Identity.IsAuthenticated Then

            sUserName = Membership.GetUser().UserName
            'declare a new instance of the appropriate tableadapter 
            Dim taSiteData As New SOSiQsqlDBTableAdapters.ShowMeTheSiteOfTheCurrentUserTableAdapter
            'then declare a new datatable to store the results in
            Dim dtSiteData As New DataTable
            'then run the getdata method from the table adapter to get that yummy data - using the public variable sUsername
            dtSiteData = taSiteData.GetData(sUserName)
            'then assign them data joints to the appropriate fields on the page and BAM!  we are cooking with peanut butter
            Dim taEmployeeByUserName As New SOSiQsqlDBTableAdapters.SelectEmpIDbyUserNameTableAdapter
            Dim dtEmpId As New DataTable
            dtEmpId = taEmployeeByUserName.GetData(sUserName)
            lblSiteID.Text = dtSiteData.Rows(0)(0).ToString
            lblSiteName.Text = dtSiteData.Rows(0)(1).ToString
            lblEmpId.Text = dtEmpId.Rows(0)(0).ToString
        End If


    End Sub
End Class