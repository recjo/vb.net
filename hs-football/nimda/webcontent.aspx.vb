
Partial Class nimda_webcontent_edit
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        GridView1.Sort("PageName", SortDirection.Ascending)
    End Sub

    Protected Overrides Sub Render(ByVal writer As HtmlTextWriter)
        Dim sortColumnIndex As Integer = 0
        Dim sortColumnHeaderText As String = "Page ID"

        ' Reference the Table the GridView has been rendered into
        Dim gridTable As Table = CType(GridView1.Controls(0), Table)

        ' Enumerate each TableRow, adding a sorting UI header if
        ' the sorted value has changed
        Dim lastValue As String = String.Empty
        'Dim lastValue As String = "booya"
        Dim currentValue As String = String.Empty
        For Each gvr As GridViewRow In GridView1.Rows
            'if sorted field is a BOUND FIELD, use this code
            currentValue = gvr.Cells(sortColumnIndex).Text
            Dim tmpAry As Array = Split(currentValue, "-")
            currentValue = Trim(tmpAry(0))

            If lastValue.CompareTo(currentValue) <> 0 Then
                ' there's been a change in value in the sorted column
                Dim rowIndex As Integer = gridTable.Rows.GetRowIndex(gvr)

                ' Add a new sort header row
                Dim sortRow As New GridViewRow(rowIndex, rowIndex, DataControlRowType.DataRow, DataControlRowState.Normal)
                Dim sortCell As New TableCell()
                sortCell.ColumnSpan = GridView1.Columns.Count
                sortRow.CssClass = "" 'clear out the default class formatting
                'sortCell.Text = String.Format("{0}: {1}", sortColumnHeaderText, currentValue)
                sortCell.Text = String.Format("{0}", currentValue)
                sortCell.CssClass = "DirectoryHeaderTDStyle"

                ' Add sortCell to sortRow, and sortRow to gridTable
                sortRow.Cells.Add(sortCell)
                gridTable.Controls.AddAt(rowIndex, sortRow)

                ' Update lastValue
                lastValue = currentValue
            End If
        Next


        'End If
        MyBase.Render(writer)
    End Sub

End Class
