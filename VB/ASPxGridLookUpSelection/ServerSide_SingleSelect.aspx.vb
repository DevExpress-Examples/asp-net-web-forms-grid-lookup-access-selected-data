Imports System
Imports DevExpress.Web

Namespace ASPxGridLookUpSelection

    Public Partial Class ServerSide_SingleSelect
        Inherits Web.UI.Page

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        End Sub

        Protected Sub GetSelectionButton_Click(ByVal sender As Object, ByVal e As EventArgs)
            Dim grid As ASPxGridView = ASPxGridLookup1.GridView
            Dim value As Object = grid.GetRowValues(grid.FocusedRowIndex, New String() {"ProductName"})
            ASPxListBox1.Items.Clear()
            If value IsNot Nothing Then
                ASPxListBox1.Items.Add(value.ToString())
            End If
        End Sub

        Protected Sub SetSelectionButton_Click(ByVal sender As Object, ByVal e As EventArgs)
            Dim maxUnitPrice As Integer = 0
            Dim maxUnitPriceKey As Integer = 0
            Dim grid As ASPxGridView = ASPxGridLookup1.GridView
            For i As Integer = grid.VisibleStartIndex To grid.VisibleRowCount - 1
                Dim unitPrice As Integer = Convert.ToInt32(grid.GetRowValues(i, New String() {"UnitPrice"}))
                maxUnitPrice = If(unitPrice > maxUnitPrice, unitPrice, maxUnitPrice)
                maxUnitPriceKey = If(unitPrice = maxUnitPrice, i, maxUnitPriceKey)
            Next

            'Prior to version 16.1.6
            'grid.Selection.SelectRow(maxUnitPriceKey);
            'Starting with version 16.1.6
            ASPxGridLookup1.Value = maxUnitPriceKey
        End Sub
    End Class
End Namespace
