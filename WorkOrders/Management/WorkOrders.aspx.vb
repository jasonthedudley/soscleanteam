Public Class EditWorkOrder
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Protected Sub btnEditOrder_Click(sender As Object, e As EventArgs) Handles btnEditOrder.Click
        Dim bSelected As Boolean = False

        'LAUNCHES A PAGE THAT EDITS THE SELECTED WORK ORDER
        Dim iWorkOrder As Integer = Nothing

        For Each row As GridViewRow In gvOrdersToEdit.Rows

            If row.RowType = DataControlRowType.DataRow Then

                Dim cbRow As CheckBox = TryCast(row.Cells(0).FindControl("cbSelect"), CheckBox)
                If cbRow.Checked Then
                    iWorkOrder = row.Cells(2).Text
                    bSelected = True
                    Exit For
                End If


            End If

        Next
        If bSelected = True Then
            Response.Redirect("/WorkOrders/Management/EditWorkOrder?orderid=" & iWorkOrder)
        Else
            Response.Write("<script LANGUAGE='JavaScript' >alert('Select Order Before Clicking Edit Order')</script>")
        End If

    End Sub

    Protected Sub btnMarkReadyForInvoice_Click(sender As Object, e As EventArgs) Handles btnMarkReadyForInvoice.Click
        Dim bSelected As Boolean = False

        Dim WorkOrderAdapter As New SOSiQsqlDBTableAdapters.WorkOrderTableAdapter

        Dim iWorkOrderID As Integer = Nothing

        For Each row As GridViewRow In gvOrdersToEdit.Rows

            If row.RowType = DataControlRowType.DataRow Then

                Dim cbRow As CheckBox = TryCast(row.Cells(0).FindControl("cbSelect"), CheckBox)
                If cbRow.Checked Then
                    bSelected = True
                    Try
                        WorkOrderAdapter.Update(CInt(row.Cells(2).Text), Nothing, Nothing, Nothing, Nothing, Nothing, 11, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing)

                        Response.Write("<script LANGUAGE='JavaScript' >alert('Work Order Updated')</script>")
                    Catch ex As Exception

                        Response.Write("<script LANGUAGE='JavaScript' >alert('Could not update order')</script>")
                    End Try

                End If


            End If

        Next

        If bSelected = False Then
            Response.Write("<script LANGUAGE='JavaScript' >alert('Select Order(s) Before Clicking Ready for invoice')</script>")

        End If


        Response.Redirect("~/WorkOrders/Management/WorkOrders.aspx")


    End Sub

    Protected Sub btnSelectAll_Click(sender As Object, e As EventArgs) Handles btnSelectAll.Click

        For Each row As GridViewRow In gvOrdersToEdit.Rows

            If row.RowType = DataControlRowType.DataRow Then

                Dim cbRow As CheckBox = TryCast(row.Cells(0).FindControl("cbSelect"), CheckBox)

                cbRow.Checked = True


            End If

        Next


    End Sub



    Protected Sub btnUnselectAll_Click(sender As Object, e As EventArgs) Handles btnUnselectAll.Click
        For Each row As GridViewRow In gvOrdersToEdit.Rows

            If row.RowType = DataControlRowType.DataRow Then

                Dim cbRow As CheckBox = TryCast(row.Cells(0).FindControl("cbSelect"), CheckBox)

                cbRow.Checked = False


            End If

        Next
    End Sub

    Protected Sub btnResetTable_Click(sender As Object, e As EventArgs) Handles btnResetTable.Click
        Dim taOrdersToEdit As New SOSiQsqlDBTableAdapters.ShowMeWorkOrdersBySiteToEditTableAdapter
        Dim lblSiteID As Label = Page.Master.FindControl("lblSiteID")
        Dim iSiteID As Integer = CInt(lblSiteID.Text)
        gvOrdersToEdit.DataSource = taOrdersToEdit.GetData(iSiteID)
        gvOrdersToEdit.DataSourceID = ""
        gvOrdersToEdit.DataBind()
    End Sub

    Protected Sub btnUpdateTable_Click(sender As Object, e As EventArgs) Handles btnUpdateTable.Click
        Dim sDateBegin As String = txtDateBegin.Text
        Dim sDateEnd As String = txtDateEnd.Text
        Dim iStatusID As Integer = ddOrderStatus.SelectedValue
        Dim dDateBegin As Date = "2021-01-01"
        Dim dDateEnd As Date = "9999-12-31"

        Dim lblSiteID As Label = Page.Master.FindControl("lblSiteID")
        Dim iSiteID As Integer = CInt(lblSiteID.Text)

        Dim taOrdersToEdit As New SOSiQsqlDBTableAdapters.ShowMeWorkOrdersBySiteToEditTableAdapter

        If sDateBegin = "" Then
            gvOrdersToEdit.DataSource = taOrdersToEdit.GetDataByFilter(iSiteID, dDateBegin, dDateEnd, iStatusID)
        Else
            gvOrdersToEdit.DataSource = taOrdersToEdit.GetDataByFilter(iSiteID, sDateBegin, sDateEnd, iStatusID)

        End If


        gvOrdersToEdit.DataSourceID = ""
        gvOrdersToEdit.DataBind()
    End Sub
End Class