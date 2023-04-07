Public Class OpenInvoices
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnExport_Click(sender As Object, e As EventArgs) Handles btnExport.Click

        Dim sSiteName As String = ddSites.SelectedItem.Text
        Response.Clear()
        Response.Buffer = True
        Response.AddHeader("content-disposition", "attachment;filename=OpenInvoices_" & sSiteName & "_" & DateAndTime.Today().ToShortDateString & ".csv")
        Response.Charset = ""
        Response.ContentType = "application/text"
        Dim sBuilder As StringBuilder = New System.Text.StringBuilder()
        For index As Integer = 1 To gvOpenInvoices.Columns.Count - 1
            sBuilder.Append(gvOpenInvoices.Columns(index).HeaderText + ","c)
        Next
        sBuilder.Append(vbCr & vbLf)
        For i As Integer = 0 To gvOpenInvoices.Rows.Count - 1
            For k As Integer = 1 To gvOpenInvoices.HeaderRow.Cells.Count - 1
                sBuilder.Append(gvOpenInvoices.Rows(i).Cells(k).Text.Replace(",", "") + ",")
            Next
            sBuilder.Append(vbCr & vbLf)
        Next
        Response.Output.Write(sBuilder.ToString())
        Response.Flush()
        Response.[End]()
    End Sub
End Class