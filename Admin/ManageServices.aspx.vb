Imports System.Data.SqlClient

Partial Class Admin_ManageServices
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Roles.IsUserInRole("Administrator") Then Response.Redirect("~/default.aspx")
        If Not IsPostBack Then BindDropDowns()
    End Sub

    Private Sub BindDropDowns()
        Dim connStr As String = ConfigurationManager.ConnectionStrings("SOSiQProdConn").ConnectionString
        Using conn As New SqlConnection(connStr)
            ' Services
            Using cmd As New SqlCommand("SELECT ServiceID, ServiceName FROM Service", conn)
                conn.Open()
                ddlServices.DataSource = cmd.ExecuteReader()
                ddlServices.DataTextField = "ServiceName"
                ddlServices.DataValueField = "ServiceID"
                ddlServices.DataBind()
            End Using
            conn.Close()
            ddlServices.Items.Insert(0, New ListItem("New Service", "0"))

            ' Sites
            Using cmd As New SqlCommand("SELECT CustomerID, SiteName FROM Customer", conn)
                conn.Open()
                ddlSites.DataSource = cmd.ExecuteReader()
                ddlSites.DataTextField = "SiteName"
                ddlSites.DataValueField = "CustomerID"
                ddlSites.DataBind()
            End Using
            conn.Close()

            ' Vehicle Types (fallback to VehicleTypeID if no name column)
            Using cmd As New SqlCommand("SELECT VehicleTypeID, CAST(VehicleTypeID AS VARCHAR) AS TypeName FROM VehicleType", conn)
                conn.Open()
                ddlVehicleType.DataSource = cmd.ExecuteReader()
                ddlVehicleType.DataTextField = "TypeName"
                ddlVehicleType.DataValueField = "VehicleTypeID"
                ddlVehicleType.DataBind()
            End Using
        End Using
        ddlVehicleType.Items.Insert(0, New ListItem("Select Vehicle Type", ""))
    End Sub

    Protected Sub ddlServices_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlServices.SelectedIndexChanged
        If ddlServices.SelectedValue <> "0" Then
            Dim connStr As String = ConfigurationManager.ConnectionStrings("SOSiQProdConn").ConnectionString
            Using conn As New SqlConnection(connStr)
                Using cmd As New SqlCommand("SELECT * FROM Service WHERE ServiceID = @ServiceID", conn)
                    cmd.Parameters.AddWithValue("@ServiceID", ddlServices.SelectedValue)
                    conn.Open()
                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.Read() Then
                        txtServiceName.Text = reader("ServiceName").ToString()
                        txtDescription.Text = reader("ServiceDescription").ToString()
                        txtHours.Text = reader("Hours").ToString()
                        chkInvoiced.Checked = Convert.ToBoolean(reader("Invoiced"))
                        ddlVehicleType.SelectedValue = reader("VehicleTypeID").ToString()
                    End If
                End Using
            End Using
        Else
            txtServiceName.Text = ""
            txtDescription.Text = ""
            txtHours.Text = ""
            chkInvoiced.Checked = True
            ddlVehicleType.SelectedIndex = 0
        End If
    End Sub

    Protected Sub btnSaveService_Click(sender As Object, e As EventArgs) Handles btnSaveService.Click
        Try
            Dim connStr As String = ConfigurationManager.ConnectionStrings("SOSiQProdConn").ConnectionString
            Using conn As New SqlConnection(connStr)
                Dim cmd As New SqlCommand
                cmd.Connection = conn
                cmd.CommandType = CommandType.StoredProcedure
                If ddlServices.SelectedValue = "0" Then
                    cmd.CommandText = "sp_AddService"
                Else
                    cmd.CommandText = "sp_EditService"
                    cmd.Parameters.AddWithValue("@ServiceID", ddlServices.SelectedValue)
                End If
                cmd.Parameters.AddWithValue("@ServiceName", txtServiceName.Text)
                cmd.Parameters.AddWithValue("@ServiceDescription", txtDescription.Text)
                cmd.Parameters.AddWithValue("@Hours", If(String.IsNullOrEmpty(txtHours.Text), DBNull.Value, Convert.ToDecimal(txtHours.Text)))
                cmd.Parameters.AddWithValue("@Invoiced", chkInvoiced.Checked)
                cmd.Parameters.AddWithValue("@VehicleTypeID", If(ddlVehicleType.SelectedValue = "", DBNull.Value, Convert.ToInt32(ddlVehicleType.SelectedValue)))
                conn.Open()
                cmd.ExecuteNonQuery()
                lblMessage.Text = "Service saved successfully."
                BindDropDowns()
            End Using
        Catch ex As Exception
            lblMessage.Text = "Error: " & ex.Message
        End Try
    End Sub

    Protected Sub btnSavePrice_Click(sender As Object, e As EventArgs) Handles btnSavePrice.Click
        Try
            Dim connStr As String = ConfigurationManager.ConnectionStrings("SOSiQProdConn").ConnectionString
            Using conn As New SqlConnection(connStr)
                Using cmd As New SqlCommand("sp_UpdateServicePrice", conn)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@ServiceID", ddlServices.SelectedValue)
                    cmd.Parameters.AddWithValue("@SiteID", ddlSites.SelectedValue)
                    cmd.Parameters.AddWithValue("@ServicePrice", Convert.ToDecimal(txtPrice.Text))
                    cmd.Parameters.AddWithValue("@CommisionBySite", Convert.ToDecimal(txtCommision.Text))
                    conn.Open()
                    cmd.ExecuteNonQuery()
                    lblMessage.Text = "Price updated successfully."
                End Using
            End Using
        Catch ex As Exception
            lblMessage.Text = "Error: " & ex.Message
        End Try
    End Sub
End Class