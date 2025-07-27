Imports System.ComponentModel.DataAnnotations

Public Class ServicePriceBySite
    <Key>
    Public Property ServicePriceBySiteID As Integer ' Assume auto-gen PK if not in schema; adjust if composite

    Public Property CustomerID As Integer
    Public Property ServiceID As Short ' smallint
    Public Property ServicePrice As Decimal ' money
    Public Property CommisionBySite As Decimal ' money (payout/commission)
End Class