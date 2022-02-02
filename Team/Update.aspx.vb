Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Data
Public Class Update
    Inherits System.Web.UI.Page
    Dim sConnection As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Call LoadGridView()
        End If

    End Sub

    Public Sub LoadGridView()
        sConnection = ConfigurationManager.ConnectionStrings("SOSiQDevConnectionString").ConnectionString

        Using cn As New SqlConnection(sConnection)

            Using cmd As New SqlCommand With {.Connection = cn}

                cmd.CommandType = CommandType.StoredProcedure
                cmd.CommandText = "ShowMeTheEmployeesForUpdate"

                Try
                    cn.Open()
                    gvUpdateEmployees.EmptyDataText = "Nothing to display"
                    gvUpdateEmployees.DataSource = cmd.ExecuteReader()
                    gvUpdateEmployees.DataBind()

                Catch ex As Exception
                    Throw ex

                End Try



            End Using

        End Using




    End Sub

    Protected Sub gvUpdateEmployees_RowEditing(sender As Object, e As GridViewEditEventArgs)

        gvUpdateEmployees.EditIndex = e.NewEditIndex

        LoadGridView()

    End Sub

    Protected Sub gvUpdateEmployees_RowUpdating(sender As Object, e As GridViewUpdateEventArgs)

        sConnection = ConfigurationManager.ConnectionStrings("SOSiQDevConnectionString").ConnectionString

        Dim row As GridViewRow = gvUpdateEmployees.Rows(e.RowIndex)


        Dim iEmpID, iRoleID, iPayTypeID, iStatusID As Integer

        iRoleID = TryCast(row.Cells(0).FindControl("ddRoleName"), DropDownList).SelectedValue
        iEmpID = CInt(row.Cells(13).Text)
        iPayTypeID = TryCast(row.Cells(11).FindControl("ddPay"), DropDownList).SelectedValue
        iStatusID = TryCast(row.Cells(9).FindControl("ddStatus"), DropDownList).SelectedValue

        Dim sFirstName As String = TryCast(row.Cells(2).FindControl("txtFirstName"), TextBox).Text
        Dim sLastName As String = TryCast(row.Cells(1).FindControl("txtLastName"), TextBox).Text
        Dim sPhone As String = TryCast(row.Cells(4).FindControl("txtPhone"), TextBox).Text
        Dim sAddress As String = TryCast(row.Cells(5).FindControl("txtAddress"), TextBox).Text
        Dim sCity As String = TryCast(row.Cells(6).FindControl("txtCity"), TextBox).Text
        Dim sState As String = TryCast(row.Cells(7).FindControl("txtState"), TextBox).Text
        Dim sZip As String = TryCast(row.Cells(8).FindControl("txtZip"), TextBox).Text

        Try

            Using cn As New SqlConnection(sConnection)
                Using cmd As New SqlCommand With {.Connection = cn}

                    cmd.CommandType = CommandType.StoredProcedure

                    cmd.Parameters.Add(New SqlParameter("@P_EmployeeID", iEmpID))
                    cmd.Parameters.Add(New SqlParameter("@P_EmployeeFirst", sFirstName))
                    cmd.Parameters.Add(New SqlParameter("@P_EmployeeLast", sLastName))
                    cmd.Parameters.Add(New SqlParameter("@P_EmpPhone", sPhone))
                    cmd.Parameters.Add(New SqlParameter("@P_EmpAddress", sAddress))
                    cmd.Parameters.Add(New SqlParameter("@P_EmpCity", sCity))
                    cmd.Parameters.Add(New SqlParameter("@P_EmpState", sState))
                    cmd.Parameters.Add(New SqlParameter("@P_EmpZip", sZip))
                    cmd.Parameters.Add(New SqlParameter("@P_PayTypeID", iPayTypeID))
                    cmd.Parameters.Add(New SqlParameter("@P_RoleID", iRoleID))
                    cmd.Parameters.Add(New SqlParameter("@P_StatusID", iStatusID))

                    cmd.CommandText = "UpdateEmployee"

                    cn.Open()
                    cmd.ExecuteNonQuery()



                End Using


            End Using
        Catch ex As Exception
            Throw ex
        End Try

        gvUpdateEmployees.EditIndex = -1
        LoadGridView()


    End Sub

    Protected Sub gvUpdateEmployees_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs)
        gvUpdateEmployees.EditIndex = -1
        LoadGridView()
    End Sub
End Class