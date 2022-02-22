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

        Dim cNotes As TextBox = fvEditInvoice.FindControl("txtInvoiceNotes")



        Try

            InvoiceTableAdapater.Update(iInvoiceID, iStatusID, CDate(dDatePaid.Text).ToShortDateString, cNotes.Text)
            Response.Redirect(Request.RawUrl)

        Catch ex As Exception
            Response.Write("<script LANGUAGE='JavaScript' >alert('Error Updating Invoice')</script>")
        End Try


    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "Close", "window.close()", True)
    End Sub


End Class