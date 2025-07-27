Imports System.ComponentModel.DataAnnotations

Public Class Employee
    <Key>
    Public Property EmployeeID As Integer

    Public Property FirstName As String
    Public Property LastName As String
    ' Add others like Phone, Address if needed
End Class