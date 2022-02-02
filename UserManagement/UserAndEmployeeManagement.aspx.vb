Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Data

Public Class UserAndEmployeeManagement
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        If Not IsPostBack Then
            Call LoadGridView()
        End If

    End Sub

    Public Sub LoadGridView()
        Dim sConnection As String = ConfigurationManager.ConnectionStrings("SOSiQDevConnectionString").ConnectionString

        Using cn As New SqlConnection(sConnection)

            Using cmd As New SqlCommand With {.Connection = cn}

                cmd.CommandType = CommandType.StoredProcedure
                cmd.CommandText = "ShowMeUsersAndEmployeeDetails"

                Try
                    cn.Open()
                    gvUserManagement.EmptyDataText = "Nothing to display"
                    gvUserManagement.DataSource = cmd.ExecuteReader()
                    gvUserManagement.DataBind()

                Catch ex As Exception
                    Throw ex

                End Try



            End Using

        End Using

    End Sub


    Private Sub gvUserManagement_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles gvUserManagement.RowUpdating

        'this will collect the values from the drop downlists, then call the stored procedure to 
        'update the data

        'Dim sUser As String = ""
        Dim iEmpID As Integer = 0
        Dim iSiteID As Integer = 0
        Dim iRoleID As Integer = 0
        Dim iPayTypeID As Integer = 0
        Dim iStatusID As Integer = 0
        Dim gAppRoleID As Guid = Nothing
        Dim iUser As Integer = 0
        Dim gUser As Guid = Nothing

        Dim sConnection As String = ConfigurationManager.ConnectionStrings("SOSiQDevConnectionString").ConnectionString

        Dim row As GridViewRow = gvUserManagement.Rows(e.RowIndex)


        iEmpID = CInt(TryCast(row.Cells(0).FindControl("lblEmpID"), Label).Text)

        If TryCast(row.Cells(3).FindControl("ddUser"), DropDownList).Text <> "No Change" Then
            iUser = 1
            gUser = Guid.Parse(TryCast(row.Cells(3).FindControl("ddUser"), DropDownList).Text)

        End If

        If TryCast(row.Cells(4).FindControl("ddAppRole"), DropDownList).SelectedValue <> "No Change" Then
            gAppRoleID = Guid.Parse(TryCast(row.Cells(4).FindControl("ddAppRole"), DropDownList).SelectedValue)
        End If


        If TryCast(row.Cells(5).FindControl("ddSite"), DropDownList).SelectedValue <> "No Change" Then
            iSiteID = TryCast(row.Cells(4).FindControl("ddSite"), DropDownList).SelectedValue
        End If

        If TryCast(row.Cells(6).FindControl("ddRole"), DropDownList).SelectedValue <> "No Change" Then
            iRoleID = TryCast(row.Cells(6).FindControl("ddRole"), DropDownList).SelectedValue
        End If

        If TryCast(row.Cells(7).FindControl("ddPayType"), DropDownList).SelectedValue <> "No Change" Then
            iPayTypeID = TryCast(row.Cells(6).FindControl("ddPayType"), DropDownList).SelectedValue
        End If

        If TryCast(row.Cells(8).FindControl("ddStatus"), DropDownList).SelectedValue <> "No Change" Then
            iStatusID = TryCast(row.Cells(7).FindControl("ddStatus"), DropDownList).SelectedValue
        End If

        If iUser = 0 And iSiteID = 0 And iRoleID = 0 And iPayTypeID = 0 And iStatusID = 0 And gAppRoleID = Nothing Then

            Response.Write("<script LANGUAGE='JavaScript' >alert('Nothing changed')</script>")

        Else


            Try

                Using cn As New SqlConnection(sConnection)
                    Using cmd As New SqlCommand With {.Connection = cn}

                        cmd.CommandType = CommandType.StoredProcedure

                        cmd.Parameters.Add(New SqlParameter("@EmpID", iEmpID))
                        cmd.Parameters.Add(New SqlParameter("@SiteID", iSiteID))
                        cmd.Parameters.Add(New SqlParameter("@PaytypeID", iPayTypeID))
                        cmd.Parameters.Add(New SqlParameter("@StatusID", iStatusID))
                        cmd.Parameters.Add(New SqlParameter("@iAppRoleID", gAppRoleID))
                        cmd.Parameters.Add(New SqlParameter("@iUserID", iUser))
                        cmd.Parameters.Add(New SqlParameter("@gUserID", gUser))
                        cmd.Parameters.Add(New SqlParameter("@RoleID", iRoleID))


                        cmd.CommandText = "UserAndEmployeeManagementUpdate"

                        cn.Open()
                        cmd.ExecuteNonQuery()

                    End Using


                End Using

                gvUserManagement.EditIndex = -1
                LoadGridView()


            Catch ex As Exception

                gvUserManagement.EditIndex = -1
                Response.Write("<script LANGUAGE='JavaScript' >alert(" & ex.ToString & ")</script>")
                MsgBox(ex.ToString)
                LoadGridView()
            End Try

        End If


    End Sub

    Private Sub gvUserManagement_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles gvUserManagement.RowEditing
        gvUserManagement.EditIndex = e.NewEditIndex

        LoadGridView()
    End Sub

    Private Sub gvUserManagement_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs) Handles gvUserManagement.RowCancelingEdit
        gvUserManagement.EditIndex = -1

        LoadGridView()
    End Sub
End Class