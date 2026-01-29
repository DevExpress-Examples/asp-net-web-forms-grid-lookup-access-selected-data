Imports DevExpress.Web.ASPxGridView
Imports System
Imports System.Collections.Generic
Imports System.Web.UI
Imports System.Web.UI.WebControls

Namespace ASPxGridLookUpSelection

    Public Partial Class ServerSide_MultiSelect
        Inherits Page

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        End Sub

        Protected Sub GetSelectionButton_Click(ByVal sender As Object, ByVal e As EventArgs)
            Dim grid As ASPxGridView = ASPxGridLookup1.GridView
            Dim fieldValues As List(Of Object) = grid.GetSelectedFieldValues(New String() {"ProductName"})
            ASPxListBox1.Items.Clear()
            If fieldValues.Count > 0 Then
                For Each item As Object In fieldValues
                    ASPxListBox1.Items.Add(item.ToString())
                Next
            End If
        End Sub

        Protected Sub SetSelectionButton_Click(ByVal sender As Object, ByVal e As EventArgs)
            Dim grid As ASPxGridView = ASPxGridLookup1.GridView
            Dim minUnitPrice As Integer = 25
            grid.Selection.UnselectAll()
            For i As Integer = grid.VisibleStartIndex To grid.VisibleRowCount - 1
                Dim unitPrice As Integer = Convert.ToInt32(grid.GetRowValues(i, New String() {"UnitPrice"}))
                If unitPrice > minUnitPrice Then grid.Selection.SelectRow(i)
            Next
        End Sub
    End Class
End Namespace
