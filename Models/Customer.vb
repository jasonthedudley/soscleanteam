Imports System.ComponentModel.DataAnnotations
Imports System.ComponentModel.DataAnnotations.Schema

<Table("[dbo].[Customer]")>
Public Class Customer
    <Key>
    Public Property CustomerID As Integer
    Public Property SiteName As String
    Public Overridable Property ServicePriceBySite As ICollection(Of ServicePriceBySite)
    Public Overridable Property EmployeeHasSite As ICollection(Of EmployeeHasSite)
End Class