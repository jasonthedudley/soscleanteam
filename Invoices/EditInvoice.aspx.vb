Public Class EditInvoice
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnUpdate_Click(sender As Object, e As EventArgs) Handles btnUpdate.Click
        Dim InvoiceTableAdapater As New SOSiQ.SOSiQsqlDBTableAdapters.ShowMeTheInvoicesBySiteTableAdapter



        Dim iInvoiceID As Integer = Request.QueryString("invoiceID")
        Dim ddStatus As DropDownList = fvEditInvoice.FindControl("ddStatus")
        Dim iStatusID As Integer = ddStatus.SelectedValue
        Dim dDatePaid As TextBox = fvEditInvoice.FindControl("txtDatePaid")
        Dim sNotes As String = Nothing
        Dim cNotes As TextBox = fvEditInvoice.FindControl("txtInvoiceNotes")
        Dim DatePaid As Date = Nothing

        If dDatePaid.Text = "" Then DatePaid = Nothing Else DatePaid = CDate(dDatePaid.Text).ToShortDateString
        If cNotes.Text = "" Then sNotes = Nothing

        Try
            If dDatePaid.Text = "" Then
                InvoiceTableAdapater.Update(iInvoiceID, iStatusID, Nothing, sNotes)
            Else
                InvoiceTableAdapater.Update(iInvoiceID, iStatusID, DatePaid, sNotes)

            End If
            Response.Write("<script LANGUAGE='JavaScript' >alert('Invoice updated, you can close this tab')</script>")
            Response.Redirect(Request.RawUrl)
        Catch ex As Exception
            Response.Write("<script LANGUAGE='JavaScript' >alert('Error Updating Invoice')</script>")
        End Try


    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "Close", "window.close()", True)
    End Sub

    Private Sub EditInvoice_Unload(sender As Object, e As EventArgs) Handles Me.Unload

    End Sub
End Class