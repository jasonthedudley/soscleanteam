Public Class WorkLog
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            lblEmpID.Text = GetEmpID()
            txtDate.Text = DateTime.Now.ToShortDateString()

        End If

    End Sub



    Public Function GetEmpID() As Integer


        Dim taGetEmpId As New SOSiQsqlDBTableAdapters.SelectEmpIDbyUserNameTableAdapter()
        'holds teh username to be passed into the tableadapter
        Dim sUserName As String = Membership.GetUser.UserName

        Dim dtEmpId As New DataTable

        dtEmpId = taGetEmpId.GetData(sUserName)

        Return dtEmpId.Rows(0)(0)

    End Function

    Public Function CalculateTotal() As Decimal

        Dim Total As Decimal = "0.00"

        If gvWorkLog.Rows.Count > 1 Then

            For Each gvr As GridViewRow In gvWorkLog.Rows

                Total += gvr.Cells(7).Text 'Convert.ToDouble((gvr.Cells(7).Text))

            Next


        End If

        Return Total



    End Function

    Protected Sub btnLoadGridView_Click(sender As Object, e As EventArgs) Handles btnLoadGridView.Click

        gvWorkLog.DataBind()

        lblTotalPay.Text = CalculateTotal().ToString("c2")

    End Sub
End Class