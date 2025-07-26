Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Data
Public Class TimeClockUpdate
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            'Call LoadGridView()
        End If


    End Sub
    Public Sub LoadGridView()
        Dim sConnection As String = ConfigurationManager.ConnectionStrings("SOSiQProdConn").ConnectionString

        Dim iEmpID As Integer = ddlTeamMembers.SelectedValue
        Dim ViewDate As Date = txtDate.Text



        Using cn As New SqlConnection(sConnection)

            Using cmd As New SqlCommand With {.Connection = cn}

                cmd.CommandType = CommandType.StoredProcedure


                cmd.Parameters.Add(New SqlParameter("@EmpID", iEmpID))
                cmd.Parameters.Add(New SqlParameter("@Date", ViewDate))

                cmd.CommandText = "ShowMeTheEmployeeTimeStamps"


                Try
                    cn.Open()
                    gvTimeStamps.EmptyDataText = ""
                    gvTimeStamps.DataSource = cmd.ExecuteReader()
                    gvTimeStamps.DataBind()

                Catch ex As Exception
                    Throw ex

                End Try



            End Using

        End Using




    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs)

        Dim iEmpID As Integer = ddlTeamMembers.SelectedValue

        Dim cPunchDateTime As TextBox = gvTimeStamps.FooterRow.FindControl("txtInsertPunchDateTime")

        Dim PunchDateTime As DateTime = cPunchDateTime.Text

        Dim cPunchType As DropDownList = gvTimeStamps.FooterRow.FindControl("ddPunchTypeFooter")

        Dim iPunchType As Integer = cPunchType.SelectedValue

        Dim sConnection As String = ConfigurationManager.ConnectionStrings("SOSiQProdConn").ConnectionString

        Try

            Using cn As New sqlconnection(sConnection)

                Using cmd As New SqlCommand With {.Connection = cn}

                    cmd.CommandType = CommandType.StoredProcedure

                    cmd.Parameters.Add(New SqlParameter("@EmpID", iEmpID))
                    cmd.Parameters.Add(New SqlParameter("@PunchDateTime", PunchDateTime))
                    cmd.Parameters.Add(New SqlParameter("@PunchType", iPunchType))

                    cmd.CommandText = "InsertEmployeePunch"

                    cn.Open()
                    cmd.ExecuteNonQuery()


                End Using

            End Using

        Catch ex As Exception

            Throw ex

        End Try

        LoadGridView()

    End Sub

    Private Sub gvTimeStamps_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles gvTimeStamps.RowUpdating

        Dim cPunchId As Label = gvTimeStamps.Rows(e.RowIndex).FindControl("lblPunchID")

        Dim iPunchId As Integer = CInt(cPunchId.Text)

        Dim iEmpId As Integer = ddlTeamMembers.SelectedValue

        Dim cPunchDateTime As TextBox = gvTimeStamps.Rows(e.RowIndex).FindControl("txtPunchDateTime")

        Dim PunchDateTime As DateTime = cPunchDateTime.Text

        Dim cPunchType As DropDownList = gvTimeStamps.Rows(e.RowIndex).FindControl("ddPunchTypeEditItem")

        Dim iPunchType As Integer = cPunchType.SelectedIndex

        Dim sConnection As String = ConfigurationManager.ConnectionStrings("SOSiQProdConn").ConnectionString

        Try

            Using cn As New SqlConnection(sConnection)

                Using cmd As New SqlCommand With {.Connection = cn}

                    cmd.CommandType = CommandType.StoredProcedure


                    cmd.Parameters.Add(New SqlParameter("@PunchID", iPunchId))
                    cmd.Parameters.Add(New SqlParameter("@PunchDateTime", PunchDateTime))
                    cmd.Parameters.Add(New SqlParameter("@PunchTypeNewID", iPunchType))

                    cmd.CommandText = "UpdateEmployeePunch"

                    cn.Open()
                    cmd.ExecuteNonQuery()


                End Using

            End Using

        Catch ex As Exception

            Throw ex

        End Try

        gvTimeStamps.EditIndex = -1
        LoadGridView()


    End Sub

    Protected Sub btnView_Click(sender As Object, e As EventArgs) Handles btnView.Click
        Call LoadGridView()
    End Sub

    Private Sub gvTimeStamps_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles gvTimeStamps.RowEditing
        gvTimeStamps.EditIndex = e.NewEditIndex

        LoadGridView()
    End Sub

    Private Sub gvTimeStamps_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs) Handles gvTimeStamps.RowCancelingEdit

        gvTimeStamps.EditIndex = -1
        LoadGridView()
    End Sub

    Private Sub gvTimeStamps_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles gvTimeStamps.RowDeleting

        Dim cPunchId As Label = gvTimeStamps.Rows(e.RowIndex).FindControl("lblPunchID")

        Dim iPunchId As Integer = CInt(cPunchId.Text)

        Dim sConnection As String = ConfigurationManager.ConnectionStrings("SOSiQProdConn").ConnectionString

        Try

            Using cn As New SqlConnection(sConnection)

                Using cmd As New SqlCommand With {.Connection = cn}

                    cmd.CommandType = CommandType.StoredProcedure


                    cmd.Parameters.Add(New SqlParameter("@PunchID", iPunchId))


                    cmd.CommandText = "DeletePunch"

                    cn.Open()
                    cmd.ExecuteNonQuery()


                End Using

            End Using

        Catch ex As Exception

            Throw ex

        End Try

        gvTimeStamps.EditIndex = -1
        LoadGridView()


    End Sub
End Class