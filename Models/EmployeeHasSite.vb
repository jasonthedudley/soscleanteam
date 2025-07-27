Imports System.ComponentModel.DataAnnotations

Public Class EmployeeHasSite
    <Key>
    Public Property EmployeeHasSiteID As Integer ' Assume auto-gen; schema shows composite EmployeeID + CustomerID

    Public Property EmployeeID As Integer
    Public Property CustomerID As Integer
End Class