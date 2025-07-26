Imports System.Data.SqlClient

Partial Class Admin_AddSite
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Roles.IsUserInRole("Administrator") Then Response.Redirect("~/default.aspx")
    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        Try
            Dim connStr As String = ConfigurationManager.ConnectionStrings("SOSiQProdConn").ConnectionString
            Using conn As New SqlConnection(connStr)
                Using cmd As New SqlCommand("sp_AddSite", conn)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@SiteName", txtSiteName.Text)
                    cmd.Parameters.AddWithValue("@Phone1", txtPhone1.Text)
                    cmd.Parameters.AddWithValue("@Address1", txtAddress1.Text)
                    cmd.Parameters.AddWithValue("@City", txtCity.Text)
                    cmd.Parameters.AddWithValue("@State", txtState.Text)
                    cmd.Parameters.AddWithValue("@Zip", txtZip.Text)
                    conn.Open()
                    Dim newId As Object = cmd.ExecuteScalar()
                    lblMessage.Text = "Site added with ID: " & newId.ToString()
                End Using
            End Using
        Catch ex As Exception
            lblMessage.Text = "Error: " & ex.Message
        End Try
    End Sub
End Class