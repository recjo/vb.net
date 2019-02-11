
Partial Class nimda_default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Page.Title = ConfigurationManager.AppSettings("BizName") & " Administration"
    End Sub
End Class
