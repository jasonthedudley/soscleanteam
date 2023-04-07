Imports SOSiQ.SOSiQsqlDBTableAdapters
Public Class Create
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'this is how the page fields are populated based on the username and site





    End Sub


    Protected Sub btnCreateWorkOrder_Click(sender As Object, e As EventArgs) Handles btnCreateWorkOrder.Click

        'check dropdowns for selected values and if nothing is selected notify user and refresh page
        If Not ddEmployee.SelectedValue = "" And Not ddService.SelectedValue = "" And Not txtVIN.Text = "" And Not txtMileage.Text = "" Then

            Dim WorkOrderAdapter As New WorkOrderTableAdapter

            Dim sqlCreateDate As String = Now
            Dim iWorkOrderID As Integer = Nothing

            Dim iInitialRating As Integer = ddInitialRating.SelectedValue
            Dim iEmployee As Integer = ddEmployee.SelectedValue
            Dim lblSiteID As Label = Page.Master.FindControl("lblSiteID")
            Dim iSiteID As Integer = CInt(lblSiteID.Text)
            Dim bDeliveryIncluded As Boolean = CbDelivery.Checked
            Dim iMileage As Integer = Nothing
            If Not IsNumeric(txtMileage.Text) Then
                iMileage = 0
            Else
                iMileage = CInt(txtMileage.Text)
            End If


            Try
                WorkOrderAdapter.Insert(iInitialRating, iEmployee, iSiteID, sqlCreateDate, txtVIN.Text, txtStockNo.Text, txtRoNo.Text, ddService.SelectedValue, txtNotes.Text, CInt(txtPriceMultiplier.Text), bDeliveryIncluded, iMileage, cbPanelBuff.Checked)

            Catch ex As Exception

            End Try

            Response.Redirect("~/WorkOrders/Management/Create.aspx")

        Else

            Response.Write("<script LANGUAGE='JavaScript' >alert('Make sure all fields are complete before creating order')</script>")

        End If

    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        Response.Redirect("~/WorkOrders/Management/Create.aspx")
    End Sub


    Protected Sub ddService_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddService.SelectedIndexChanged
        'check if panel buff service is selected in order to unhide the panel buff multiplier row

        Dim sServiceSelected As String = ddService.SelectedItem.Text

        PanelBuffPriceMultiplierRow.Visible = False

        Select Case sServiceSelected
            Case = "Pre-owned Detail"
                CbDelivery.Visible = True
            Case = "New Car Lot Shield"
                CbDelivery.Visible = True
            Case = "New Car Panel Buff"
                PanelBuffPriceMultiplierRow.Visible = True
            Case = "Pre-owned Panel Buff"
                PanelBuffPriceMultiplierRow.Visible = True

            Case Else
                CbDelivery.Visible = False
        End Select



    End Sub

    Protected Sub btnUpdateCharge_Click(sender As Object, e As EventArgs) Handles btnUpdateCharge.Click
        'this will multiply the base price of the service by whatever value the user places in this text box
        Dim dblBasePrice As Decimal

        Dim sServiceSelected As String = ddService.SelectedItem.Text
        Dim iMultiplier As Integer
        Dim iBuffCharge As Integer = 20
        Dim dblTotalCharge As Decimal
        iMultiplier = CInt(txtPriceMultiplier.Text)

        Dim lblBasePrice As Label = fvServicePrice.FindControl("ServicePriceLabel")
        If Not IsNothing(lblBasePrice) Then
            dblBasePrice = CDec(lblBasePrice.Text)
        Else
            dblBasePrice = 0
        End If


        Select Case sServiceSelected

            Case = "New Car Panel Buff"
                dblTotalCharge = CDec(lblBasePrice.Text) * iMultiplier
            Case = "Pre-owned Panel Buff"
                dblTotalCharge = CDec(lblBasePrice.Text) * iMultiplier

            Case Else

                lblAdderCharge.Text = CStr((iBuffCharge * iMultiplier))

                dblTotalCharge = String.Format("{0:C}", (dblBasePrice) + CInt(lblAdderCharge.Text))

        End Select

        lblTotalCharge.Text = dblTotalCharge

    End Sub

    Protected Sub txtVIN_TextChanged(sender As Object, e As EventArgs) Handles txtVIN.TextChanged

        Dim sVin As String = txtVIN.Text

        gvVinHistory.DataBind()


    End Sub

    Protected Sub cbAllEmployees_CheckedChanged(sender As Object, e As EventArgs) Handles cbAllEmployees.CheckedChanged

        ddEmployee.AppendDataBoundItems = False
        ddEmployee.ClearSelection()

        Dim taEmployees As New SOSiQsqlDBTableAdapters.ShowMeActiveEmployeesBySiteTableAdapter
        Dim lblSiteID As Label = Page.Master.FindControl("lblSiteID")
        Dim iSiteID As Integer = CInt(lblSiteID.Text)

        Dim dtEmployees As New DataTable

        dtEmployees = taEmployees.GetEmployees(iSiteID, cbAllEmployees.Checked)

        ddEmployee.DataSourceID = Nothing

        ddEmployee.DataSource = taEmployees.GetEmployees(iSiteID, cbAllEmployees.Checked)



        ddEmployee.DataBind()


    End Sub

    Protected Sub cbPanelBuff_CheckedChanged(sender As Object, e As EventArgs) Handles cbPanelBuff.CheckedChanged
        If cbPanelBuff.Checked = True Then
            'show the panel buff adder options

            PanelBuffPriceMultiplierRow.Visible = True
        Else
            'hide the panel buff adder options
            PanelBuffPriceMultiplierRow.Visible = False

        End If
    End Sub
End Class