Public Class Invoice
    Inherits System.Web.UI.Page
    Public iInvoiceNumber As Integer = Nothing
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        iInvoiceNumber = Request.QueryString("Invoiceid")
        lblInvoiceNumber.Text = iInvoiceNumber



    End Sub






End Class