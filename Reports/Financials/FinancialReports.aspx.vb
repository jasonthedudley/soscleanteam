Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.UI.DataVisualization.Charting
Imports SOSiQ.SOSiQsqlDBTableAdapters
Imports Microsoft.Ajax.Utilities


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

            'Loop through each group and create a series for the chart
            'For Each group In groups
            '    Dim series As New Series With {
            '      .Name = group.site & " - " & group.year,
            '      .ChartType = SeriesChartType.Line
            '    }
            '    Chart1.Series.Add(series)

            '    'Loop through each row in the group and add a point to the series
            '    For Each row In group.Group
            '        series.Points.AddXY(row.Field(Of Integer)("Month"), row.Field(Of Decimal)("InvoicesAmount"))
            '    Next




            For Each group In groups
                Dim siteName As String = group.site
                Dim year As Integer = group.year
                Dim seriesName As String = siteName & " - " & year

                ' Create a new series for each site and year combination
                Dim series As New Series With {
        .Name = seriesName,
        .ChartType = SeriesChartType.Line
    }
                Chart1.Series.Add(series)

                ' Loop through each row in the group and add a data point to the series
                For Each row In group.Group
                    Dim month As Integer = row.Field(Of Integer)("Month")
                    Dim invoicesAmount As Decimal = row.Field(Of Decimal)("InvoicesAmount")

                    ' Add the data point to the series with the corresponding site and year
                    series.Points.AddXY(month, invoicesAmount)
                Next
            Next

            'For Each group In groups
            '    Dim siteName As String = group.site
            '    Dim year As Integer = group.year
            '    Dim seriesName As String = siteName & " - " & year

            '    ' Create a new series for each site and year combination
            '    Dim series As New Series With {
            '        .Name = seriesName,
            '        .ChartType = SeriesChartType.Line
            '    }
            '    Chart1.Series.Add(series)

            '    ' Loop through each row in the group and add a data point to the series
            '    For Each row In group.Group
            '        Dim month As Integer = row.Field(Of Integer)("Month")
            '        Dim invoicesAmount As Decimal = row.Field(Of Decimal)("InvoicesAmount")

            '        ' Add the data point to the series with the corresponding site and year
            '        series.Points.AddXY(month, invoicesAmount)
            '    Next
            'Next


            'Next
        End If

    End Sub


    'Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    '    If Not Me.IsPostBack Then

    '        ' Create an instance of the ShowMeTheMoneyTableAdapter
    '        Dim taFinancials As New SOSiQsqlDBTableAdapters.ShowMeTheMoneyTableAdapter

    '        ' Get the data from the table adapter and store it in a DataTable
    '        Dim dt As DataTable = taFinancials.GetData

    '        ' Use LINQ to retrieve a list of distinct site names from the DataTable
    '        Dim sites As List(Of String) = (From financialOb In dt.AsEnumerable() Select financialOb.Field(Of String)("SiteName")).Distinct().ToList()

    '        ' Loop through each site name in the list
    '        For Each site As String In sites
    '            ' Use LINQ to retrieve the InvoicesAmount for each site and store it in an array of doubles
    '            Dim y As Double() = (From financialOb In dt.AsEnumerable() Where financialOb.Field(Of String)("SiteName") = site Select financialOb.Field(Of Double)("InvoicesAmount")).ToArray()
    '            ' Use LINQ to retrieve the Month for each site and store it in an array of strings
    '            Dim x As String() = (From financialOb In dt.AsEnumerable()
    '                                 Where financialOb.Field(Of String)("SiteName") = site
    '                                 Select CStr(financialOb.Field(Of Integer)("Month"))).ToArray()


    '            ' Add a new series to the chart for the current site
    '            Chart1.Series.Add(New Series(site))
    '            ' Show the value as a label on each data point
    '            Chart1.Series(site).IsValueShownAsLabel = True
    '            ' Set the marker style to diamond
    '            Chart1.Series(site).MarkerStyle = MarkerStyle.Diamond
    '            ' Set the border width to 2
    '            Chart1.Series(site).BorderWidth = 2
    '            ' Set the chart type to line
    '            Chart1.Series(site).ChartType = SeriesChartType.Line
    '            ' Bind the X and Y values to the chart
    '            Chart1.Series(site).Points.DataBindXY(x, y)
    '            ' Set the X value type to string
    '            Chart1.Series(site).XValueType = ChartValueType.String
    '            ' Set the marker size to 10
    '            Chart1.Series(site).MarkerSize = 10
    '        Next

    '        ' Check if the Legends collection has any elements
    '        If Chart1.Legends.Count > 0 Then
    '            ' Enable the first legend (if it exists)
    '            Chart1.Legends(0).Enabled = True
    '        End If
    '    End If
    'End Sub





End Class

