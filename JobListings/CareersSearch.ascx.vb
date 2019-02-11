
Partial Class careers_CareersSearch
    Inherits System.Web.UI.UserControl

    Public Function getKeywords() As String
        Dim str As String = Replace(txtKeywords.Text, "job title keyword", "")
        getKeywords = Trim(str)
    End Function

    Public Function getFacility() As String
        getFacility = Trim(ddlFacility.SelectedValue)
    End Function

    Public Function getDivision() As String
        getDivision = Trim(ddlDivision.SelectedValue)
    End Function
End Class
