Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.UI.DataVisualization.Charting
Imports SOSiQ.SOSiQsqlDBTableAdapters
Imports Microsoft.Ajax.Utilities
Imports System.Drawing


Public Class FinancialReports

    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindDataToChart()
        End If
    End Sub


    Public Sub BindDataToChart()

        If Not Page.IsPostBack Then
            'Create an instance of the ShowMeTheMoneyTableAdapter
            Dim taFinancials As New SOSiQsqlDBTableAdapters.ShowMeTheMoneyTableAdapter

            ' Get the data from the table adapter and store it in a DataTable
            Dim dt As DataTable = taFinancials.GetData

            'Group the data by site and year
            Dim groups = From row In dt.AsEnumerable()
                         Group row By site = row.Field(Of String)("SiteName"), year = row.Field(Of Integer)("Year") Into Group

            ' Set the X-axis range to exclude month 0 and month 13
            Chart1.ChartAreas(0).AxisX.Minimum = 1
            Chart1.ChartAreas(0).AxisX.Maximum = 12




            For Each group In groups
                Dim siteName As String = group.site
                Dim year As Integer = group.year
                Dim seriesName As String = siteName & " - " & year

                ' Create a new series for each site and year combination
                Dim series As New Series With {
                    .Name = seriesName,
                    .ChartType = SeriesChartType.Line,
                    .BorderWidth = 3
                }

                ' Set the color of the series to grayscale for years other than the current calendar year
                Dim currentYear As Integer = DateTime.Now.Year
                If group.year <> currentYear Then

                    ' Set the color of the series based on the site


                    If group.site = "Mark Allen GMC" Then
                        series.Color = Color.Gray
                    ElseIf group.site = "Mark Allen Chevrolet" Then
                        series.Color = Color.DarkGray
                    End If
                End If


                series.MarkerStyle = MarkerStyle.Diamond
                series.MarkerSize = 12

                'Set the tooltip to display the InvoicesAmount value
                series.ToolTip = "#VALY{C}"

                Chart1.Series.Add(series)

                ' Loop through each row in the group and add a data point to the series
                For Each row In group.Group
                    Dim month As Integer = row.Field(Of Integer)("Month")
                    Dim invoicesAmount As Decimal = row.Field(Of Decimal)("InvoicesAmount")

                    ' Add the data point to the series with the corresponding site and year
                    series.Points.AddXY(month, invoicesAmount)


                    Dim point As New DataPoint(row.Field(Of Integer)("Month"), row.Field(Of Decimal)("InvoicesAmount"))
                    point.ToolTip = "Site: " & row.Field(Of String)("SiteName") & vbCrLf & "Invoices Amount: " & row.Field(Of Decimal)("InvoicesAmount").ToString("C")
                    series.Points.Add(point)


                Next
            Next


        End If

    End Sub






End Class

