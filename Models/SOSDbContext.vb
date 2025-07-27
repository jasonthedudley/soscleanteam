Imports System.ComponentModel.DataAnnotations.Schema ' For any annotations if needed
Imports System.Data.Entity
Imports System.Data.Entity.ModelConfiguration.Conventions

Public Class SOSDbContext
    Inherits DbContext

    Public Sub New()
        MyBase.New("SOSiQProdConn") ' e.g., "SOSiQProd" from Web.config <connectionStrings>
    End Sub

    Public Property Customers As DbSet(Of Customer)
    Public Property ServicePriceBySite As DbSet(Of ServicePriceBySite)
    Public Property Employees As DbSet(Of Employee)
    Public Property EmployeeHasSite As DbSet(Of EmployeeHasSite)
    Public Property EmployeeHasRole As DbSet(Of EmployeeHasRole)
    Public Property Services As DbSet(Of Service) ' For dropdowns

    Protected Overrides Sub OnModelCreating(modelBuilder As DbModelBuilder)
        modelBuilder.Conventions.Remove(Of PluralizingTableNameConvention)() ' Match exact table names like [dbo].[Customer]
        ' Add configurations if PKs are composite, e.g.:
        ' modelBuilder.Entity(Of EmployeeHasSite)().HasKey(Function(e) New With {e.EmployeeID, e.CustomerID})
    End Sub
End Class