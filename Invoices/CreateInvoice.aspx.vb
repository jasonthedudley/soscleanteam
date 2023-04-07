Imports SOSiQ.SOSiQsqlDBTableAdapters



Public Class CreateInvoice

    Inherits System.Web.UI.Page

    Protected Sub btnGenerate_Click(sender As Object, e As EventArgs) Handles btnGenerate.Click

        If gvWorkOrdersToInvoice.SelectedIndex = -1 Then

            Response.Write("<script LANGUAGE='JavaScript' >alert('Please select invoice')</script>")
            Exit Sub

        End If

        Dim iOrderNumber As Integer = gvWorkOrdersToInvoice.SelectedRow.Cells(1).Text
        Dim lAmount As Long = gvWorkOrdersToInvoice.SelectedRow.Cells(11).Text
        Dim cSiteLabel As Label = Master.FindControl("lblSiteID")

        Dim iLocation As Integer = CInt(cSiteLabel.text) 'gvWorkOrdersToInvoice.SelectedRow.Cells(1).Text
        Dim iInvoiceNumber As Integer

        'create invoice record based on workorder
        Dim CreateNewInvoiceAdapter As New SOSiQsqlDBTableAdapters.CreateInvoiceTableAdapter()
        'stores the invoicenumber returned from the stored proc into the iInvoiceNumber variable
        'also the stored proc updates the workorder status to closed

        'Need to check if the work order has already been invoiced or not



        Try
            'needs to double check that the workorder has not already been invoiced

            CreateNewInvoiceAdapter.Insert(iLocation, iOrderNumber, lAmount, iInvoiceNumber)

            Dim sPageURL As String = "/invoices/invoice?invoiceid="

            'open invoice in new tab and refreshes the page with the list of orders ready to invoice
            Page.ClientScript.RegisterClientScriptBlock(GetType(Page), "SCRIPT", "window.open('" & sPageURL & iInvoiceNumber & "','','');window.location = 'CreateInvoice.aspx';", True)
        Catch ex As Exception


            Response.Write("<script LANGUAGE='JavaScript' >alert('there was an error creating the invoice - please note the work order number and contact admin@soscleanteam.com')</script>")

        End Try





    End Sub
End Class