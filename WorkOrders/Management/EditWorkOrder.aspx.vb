Imports SOSiQ.SOSiQsqlDBTableAdapters
Public Class EditWorkOrder1
    Inherits System.Web.UI.Page

    Public iOrderID As Integer

    Private Sub EditWorkOrder1_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete

        If Not IsPostBack Then

            Dim iEmpID As Integer

            Dim taWorkOrderSelected As New ShowMeTheCurrentTextAndValueForTheDesignatedTableForADropDownOrderEditorTableAdapter

            Dim dtOGdropDownData As New DataTable

            iOrderID = Request.QueryString("OrderID")

            dtOGdropDownData = taWorkOrderSelected.GetData(iOrderID)

            Dim iServiceID As Integer = dtOGdropDownData.Rows(0)(1).ToString

            Dim sServiceName As String = dtOGdropDownData.Rows(0)(2).ToString

            Dim iStatusID As Integer = dtOGdropDownData.Rows(0)(3).ToString

            Dim sStatusName As String = dtOGdropDownData.Rows(0)(4).ToString

            Dim iRatingID As Integer = dtOGdropDownData.Rows(0)(8).ToString

            Dim sRatingName As String = dtOGdropDownData.Rows(0)(9).ToString

            If Not IsDBNull(dtOGdropDownData.Rows(0)(5)) Then
                iEmpID = dtOGdropDownData.Rows(0)(5)

            End If

            Dim sEmpName As String = dtOGdropDownData.Rows(0)(6).ToString

            Dim ddService As DropDownList = fvEditWorkOrder.FindControl("ddService")
            Dim ddStatus As DropDownList = fvEditWorkOrder.FindControl("ddStatus")
            Dim ddEmployee As DropDownList = fvEditWorkOrder.FindControl("ddEmployees")
            Dim cbDelivery As CheckBox = fvEditWorkOrder.FindControl("cbDeliveryIncluded")
            Dim ddRating As DropDownList = fvEditWorkOrder.FindControl("ddRating")
            Dim cbPanelBuff As CheckBox = fvEditWorkOrder.FindControl("cbIncludePanelBuff")

            ddService.SelectedIndex = ddService.Items.IndexOf(ddService.Items.FindByValue(iServiceID))
            ddStatus.SelectedIndex = ddStatus.Items.IndexOf(ddStatus.Items.FindByValue(iStatusID))
            ddEmployee.SelectedIndex = ddEmployee.Items.IndexOf(ddEmployee.Items.FindByValue(iEmpID))
            ddRating.SelectedIndex = ddRating.Items.IndexOf(ddRating.Items.FindByValue(iRatingID))


            If dtOGdropDownData.Rows(0)(7).ToString = "True" And dtOGdropDownData.Rows(0)(7).ToString <> "" Then
                cbDelivery.Checked = True
            Else
                cbDelivery.Checked = False
            End If

            If dtOGdropDownData.Rows(0)(11).ToString = "True" And dtOGdropDownData.Rows(0)(11).ToString <> "" Then
                cbPanelBuff.Checked = True
            Else
                cbPanelBuff.Checked = False

            End If

        End If

    End Sub


    Protected Sub btnUpdate_Click(sender As Object, e As EventArgs) Handles btnUpdate.Click

        'below code is from create work order page

        Dim WorkOrderAdapter As New WorkOrderTableAdapter

        'find the drop down controls on the edit work order form
        Dim ddService As DropDownList = fvEditWorkOrder.FindControl("ddService")
        Dim ddStatus As DropDownList = fvEditWorkOrder.FindControl("ddStatus")
        Dim ddEmployee As DropDownList = fvEditWorkOrder.FindControl("ddEmployees")
        Dim ddRating As DropDownList = fvEditWorkOrder.FindControl("ddRating")
        'assign the selected values to variables to later move into the DAL call
        Dim iServiceID As Integer = ddService.SelectedValue
        Dim iStatusID As Integer = ddStatus.SelectedValue
        Dim iEmpID As Integer = ddEmployee.SelectedValue
        Dim iRatingID As Integer = ddRating.SelectedValue

        Dim cVIN As TextBox = fvEditWorkOrder.FindControl("vintextbox")
        Dim cCreateDate As TextBox = fvEditWorkOrder.FindControl("CreateDateTextBox")
        Dim cQty As TextBox = fvEditWorkOrder.FindControl("txtQty")
        Dim cStockNo As TextBox = fvEditWorkOrder.FindControl("txtStockNumber")
        Dim cRoNo As TextBox = fvEditWorkOrder.FindControl("RoNumberTextBox")
        Dim cNotes As TextBox = fvEditWorkOrder.FindControl("txtNotes")
        Dim cbDelivery As CheckBox = fvEditWorkOrder.FindControl("cbDeliveryIncluded")
        Dim cbPanelBuff As CheckBox = fvEditWorkOrder.FindControl("cbIncludePanelBuff")
        Dim cMileage As TextBox = fvEditWorkOrder.FindControl("txtMileage")
        Dim iMileage As Integer = CInt(cMileage.Text)

        iOrderID = Request.QueryString("OrderID")

        Dim iQty As Integer = 1
        If cQty.Text <> "" Then
            iQty = CInt(cQty.Text)
        End If


        Try
            WorkOrderAdapter.Update(iOrderID, cVIN.Text, iServiceID, iQty, cStockNo.Text, cRoNo.Text, iStatusID, iEmpID, CDate(cCreateDate.Text).ToShortDateString, Nothing, cNotes.Text, cbDelivery.Checked, iMileage, iRatingID, cbPanelBuff.Checked)

            Response.Write("<script LANGUAGE='JavaScript' >alert('Work Order Updated')</script>")


        Catch ex As Exception

            Response.Write("<script LANGUAGE='JavaScript' >alert('Could not update order')</script>")

        End Try


        Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "Close", "window.close()", True)


    End Sub

    Private Sub EditWorkOrder1_Disposed(sender As Object, e As EventArgs) Handles Me.Disposed

    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "Close", "window.close()", True)
    End Sub
End Class