
Partial Class contact_contactus
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim lblPageTitle As Label = CType(FormView1.FindControl("lblPageTitle"), Label)
        Page.Title = lblPageTitle.Text & " - " & ConfigurationManager.AppSettings("BizName")
    End Sub

End Class
