Imports System.ComponentModel.DataAnnotations

Public Class EmployeeHasRole
    <Key>
    Public Property EmployeeHasRoleID As Integer ' Assume auto-gen; composite EmployeeID + RoleID

    Public Property EmployeeID As Integer
    Public Property RoleID As Integer
End Class