Imports System.Configuration
Imports SOSiQ.SOSiQsqlDBTableAdapters
Public Class ClockWorkOrder
    Inherits System.Web.UI.Page

    Dim iWorkOrderID As Integer
    Dim iEmpID As Integer
    Dim RightNow As DateTime


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnClockOnWO_Click(sender As Object, e As EventArgs) Handles btnClockOnWO.Click
        'this reads the selected work order ID number and inserts a row into the work order clock table and updates the work order status to in process

        If gvOrdersToClock.SelectedRow IsNot Nothing Then



            Dim taWorkOrderClock As New SOSiQsqlDBTableAdapters.WorkOrderHasEmployeePunchesTableAdapter


            iEmpID = GetEmpID()
            Dim gvRow As GridViewRow = gvOrdersToClock.SelectedRow

            iWorkOrderID = CInt(gvRow.Cells(1).Text)
            RightNow = DateTime.Now

            If AlreadyInProcess() = False Then


                Try
                    'this inserts a record into the workorderhasemployeepunch table
                    taWorkOrderClock.Insert(iWorkOrderID, iEmpID, RightNow, 1, Nothing)

                    Response.Write("<script LANGUAGE='JavaScript' >alert('Clocked on')</script>")


                    'this updates the workorder table and changes status of work order to in process which also
                    'prevents user from clocking onto it again
                    Call UpdateWoStatus(iWorkOrderID, 4)






                Catch ex As Exception

                    Response.Write("<script LANGUAGE='JavaScript' >alert('Could not Clock')</script>")
                End Try

            Else

                Response.Write("<script LANGUAGE='JavaScript' >alert('Clocked on')</script>")
            End If

            Response.Redirect(Request.RawUrl)
        Else

            Response.Write("<script LANGUAGE='JavaScript' >alert('Select an order')</script>")

        End If

    End Sub

    Protected Sub btnClockOffWO_Click(sender As Object, e As EventArgs) Handles btnClockOffWO.Click

        If gvOrdersToClock.SelectedRow IsNot Nothing Then

            'this reads the selected work order id number and inserts
            Dim taWorkOrderClock As New SOSiQsqlDBTableAdapters.WorkOrderHasEmployeePunchesTableAdapter



            iEmpID = GetEmpID()
            Dim gvRow As GridViewRow = gvOrdersToClock.SelectedRow

            iWorkOrderID = CInt(gvRow.Cells(1).Text)
            RightNow = DateTime.Now

            If AlreadyInProcess() = True Then


                Try
                    taWorkOrderClock.Insert(iWorkOrderID, iEmpID, RightNow, 0, Nothing)

                    Response.Write("<script LANGUAGE='JavaScript' >alert('Clocked off')</script>")


                    Call UpdateWoStatus(iWorkOrderID, 5)





                Catch ex As Exception

                    Response.Write("<script LANGUAGE='JavaScript' >alert('Could not clock')</script>")

                End Try


            Else
                Response.Write("<script LANGUAGE='JavaScript' >alert('Work Order not started')</script>")

            End If

            Response.Redirect(Request.RawUrl)

        Else
            Response.Write("<script LANGUAGE='JavaScript' >alert('Select an order')</script>")
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

    Public Sub UpdateWoStatus(ByVal iWoID As Integer, ByVal iStatusID As Integer)

        Dim WorkOrderAdapter As New WorkOrderTableAdapter


        WorkOrderAdapter.Update(WorkOrderID:=iWoID, Nothing, Nothing, Nothing, Nothing, Nothing, StatusID:=iStatusID, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing)




    End Sub

    Public Function AlreadyInProcess() As Boolean


        Dim gvRow As GridViewRow = gvOrdersToClock.SelectedRow

        If gvRow.Cells(5).Text = "In Process" Then

            Return True
        Else
            Return False
        End If






    End Function

    Protected Sub btnPause_Click(sender As Object, e As EventArgs) Handles btnPause.Click
        If gvOrdersToClock.SelectedRow IsNot Nothing Then
            If ddPauseReason.SelectedValue = 999 Then
                Response.Write("<script LANGUAGE='JavaScript' >alert('Select a reason for pausing work')</script>")
                Exit Sub
            End If
            'this reads the selected work order id number and inserts a pause record
            Dim taWorkOrderClock As New SOSiQsqlDBTableAdapters.WorkOrderHasEmployeePunchesTableAdapter
            Dim iPausedReason As Integer = ddPauseReason.SelectedValue

            iEmpID = GetEmpID()
            Dim gvRow As GridViewRow = gvOrdersToClock.SelectedRow

            iWorkOrderID = CInt(gvRow.Cells(1).Text)
            RightNow = DateTime.Now

            If AlreadyInProcess() = True Then

                Try
                    taWorkOrderClock.Insert(iWorkOrderID, iEmpID, RightNow, 3, iPausedReason)

                    Response.Write("<script LANGUAGE='JavaScript' >alert('Order Paused')</script>")

                    Call UpdateWoStatus(iWorkOrderID, 1011)


                    Response.Redirect(Request.RawUrl)

                Catch ex As Exception

                    Response.Write("<script LANGUAGE='JavaScript' >alert('Could not clock')</script>")

                End Try

            Else
                Response.Write("<script LANGUAGE='JavaScript' >alert('Work Order not started')</script>")

            End If

            'Response.Redirect(Request.RawUrl)

        Else
            Response.Write("<script LANGUAGE='JavaScript' >alert('Select an order')</script>")
        End If


    End Sub
End Class