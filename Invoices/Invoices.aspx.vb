Public Class Invoices
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Public Sub UpdateInvoice()

        Response.Write("<script LANGUAGE='JavaScript' >alert('Updated')</script>")


        Response.Redirect(Request.RawUrl)
    End Sub

    Protected Sub btnPrintInvoice_Click(sender As Object, e As EventArgs) Handles btnPrintInvoice.Click

        Dim iInvoiceNumber As Integer = 0

        For Each row As GridViewRow In gvInvoices.Rows

            If row.RowType = DataControlRowType.DataRow Then

                Dim cbRow As CheckBox = TryCast(row.Cells(0).FindControl("cbSelect"), CheckBox)
                If cbRow.Checked Then
                    iInvoiceNumber = row.Cells(2).Text
                    Exit For
                End If


            End If

        Next

        Dim sPageURL As String = "/invoices/invoice?invoiceid="

        'open invoice in new tab and refreshes the page with the list of orders ready to invoice
        Page.ClientScript.RegisterClientScriptBlock(GetType(Page), "SCRIPT", "window.open('" & sPageURL & iInvoiceNumber & "','','');window.location = 'Invoices.aspx';", True)

    End Sub

    Protected Sub btnSelectAll_Click(sender As Object, e As EventArgs) Handles btnSelectAll.Click

        Dim dTotal As Decimal = 0

        For Each row As GridViewRow In gvInvoices.Rows

            If row.RowType = DataControlRowType.DataRow Then

                Dim cbRow As CheckBox = TryCast(row.Cells(0).FindControl("cbSelect"), CheckBox)

                cbRow.Checked = True

                dTotal += CDec(row.Cells(13).Text)


            End If

        Next

        lblSelectionTotal.Text = dTotal

    End Sub

    Protected Sub btnUnselectAll_Click(sender As Object, e As EventArgs) Handles btnUnselectAll.Click

        lblSelectionTotal.Text = "0"

        For Each row As GridViewRow In gvInvoices.Rows

            If row.RowType = DataControlRowType.DataRow Then

                Dim cbRow As CheckBox = TryCast(row.Cells(0).FindControl("cbSelect"), CheckBox)

                cbRow.Checked = False


            End If

        Next
    End Sub

    Protected Sub btnMarkPaid_Click(sender As Object, e As EventArgs) Handles btnMarkPaid.Click
        'check amount against total of invoices selected, if they do not match alert the user and cancel the operation

        If txtAmount.Text = "" Or txtDatePaid.Text = "" Then

            Response.Write("<script LANGUAGE='JavaScript' >alert('You must fill out Amount, Date and Remittance to mark invoices paid')</script>")

        Else
            If txtAmount.Text = lblSelectionTotal.Text Then
                'update the invoices with the remittance number and mark them as paid
                Dim taInvoiceUpdater As New SOSiQsqlDBTableAdapters.ShowMeTheInvoicesBySiteTableAdapter

                For Each row As GridViewRow In gvInvoices.Rows

                    If row.RowType = DataControlRowType.DataRow Then

                        Dim cbRow As CheckBox = TryCast(row.Cells(0).FindControl("cbSelect"), CheckBox)
                        If cbRow.Checked Then
                            taInvoiceUpdater.MarkInvoicesAsPaid(CInt(row.Cells(2).Text), txtDatePaid.Text)

                        End If


                    End If

                Next

                Response.Write("<script LANGUAGE='JavaScript' >alert('Invoices marked as paid')</script>")

                Response.Redirect(Request.RawUrl)
            Else
                Response.Write("<script LANGUAGE='JavaScript' >alert('Selected invoices do not add up to entered amount.  Please double check and try again')</script>")

            End If


        End If
    End Sub

    Protected Sub btnFilter_Click(sender As Object, e As EventArgs) Handles btnFilter.Click
        'this will filter the gridview for invoices that fall inside the date range

        Dim sDateBegin As String = txtDateBegin.Text
        Dim sDateEnd As String = txtDateEnd.Text
        Dim iStatusID As Integer = ddInvoiceStatus.SelectedValue
        Dim dDateBegin As Date = "2021-01-01"
        Dim dDateEnd As Date = "9999-12-31"

        Dim lblSiteID As Label = Page.Master.FindControl("lblSiteID")
        Dim iSiteID As Integer = CInt(lblSiteID.Text)

        Dim taInvoices As New SOSiQsqlDBTableAdapters.ShowMeTheInvoicesBySiteTableAdapter

        If sDateBegin = "" Or sDateEnd = "" Then
            If Not sDateBegin = "" And Not sDateEnd = "" Then
                Response.Write("<script LANGUAGE='JavaScript' >alert('Please enter both a beginning and an ending date.')</script>")
            Else

                gvInvoices.DataSource = taInvoices.GetDataByDateRange(iSiteID, dDateBegin, dDateEnd, iStatusID)
            End If

        Else
                gvInvoices.DataSource = taInvoices.GetDataByDateRange(iSiteID, sDateBegin, sDateEnd, iStatusID)

        End If


        gvInvoices.DataSourceID = ""
        gvInvoices.DataBind()


    End Sub

    Protected Sub cbSelect_CheckedChanged(sender As Object, e As EventArgs)

        Dim dTotal As Decimal = 0

        For Each row As GridViewRow In gvInvoices.Rows

            If row.RowType = DataControlRowType.DataRow Then

                Dim cbRow As CheckBox = TryCast(row.Cells(0).FindControl("cbSelect"), CheckBox)

                If cbRow.Checked Then
                    dTotal += CDec(row.Cells(14).Text)

                End If


            End If

        Next

        lblSelectionTotal.Text = dTotal

    End Sub

    Protected Sub btnClearFilter_Click(sender As Object, e As EventArgs) Handles btnClearFilter.Click
        Dim taInvoices As New SOSiQsqlDBTableAdapters.ShowMeTheInvoicesBySiteTableAdapter
        Dim lblSiteID As Label = Page.Master.FindControl("lblSiteID")
        Dim iSiteID As Integer = CInt(lblSiteID.Text)
        gvInvoices.DataSource = taInvoices.GetData(iSiteID)
        gvInvoices.DataSourceID = ""
        gvInvoices.DataBind()
    End Sub
    Public Overrides Sub VerifyRenderingInServerForm(ByVal control As Control)
        'Tell the compiler that the control is rendered
        'explicitly by overriding the VerifyRenderingInServerForm event.
    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles btnExportData.Click
        Dim lblSiteName As Label = Page.Master.FindControl("lblSiteName")
        Dim sSiteName As String = lblSiteName.Text
        Response.Clear()
        Response.Buffer = True
        Response.AddHeader("content-disposition", "attachment;filename=OpenInvoices_" & sSiteName & "_" & DateAndTime.Today().ToShortDateString & ".csv")
        Response.Charset = ""
        Response.ContentType = "application/text"
        Dim sBuilder As StringBuilder = New System.Text.StringBuilder()
        For index As Integer = 1 To gvInvoices.Columns.Count - 1
            sBuilder.Append(gvInvoices.Columns(index).HeaderText + ","c)
        Next
        sBuilder.Append(vbCr & vbLf)
        For i As Integer = 0 To gvInvoices.Rows.Count - 1
            For k As Integer = 2 To gvInvoices.HeaderRow.Cells.Count - 1
                sBuilder.Append(gvInvoices.Rows(i).Cells(k).Text.Replace(",", "") + ",")
            Next
            sBuilder.Append(vbCr & vbLf)
        Next
        Response.Output.Write(sBuilder.ToString())
        Response.Flush()
        Response.[End]()
    End Sub

End Class