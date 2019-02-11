
Partial Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Page.Title = ConfigurationManager.AppSettings("BizName") & " - Please Login"
    End Sub

    Protected Sub logMain_Authenticate(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.AuthenticateEventArgs) Handles logMain.Authenticate
        If FormsAuthentication.Authenticate(logMain.UserName, logMain.Password) Then
            FormsAuthentication.RedirectFromLoginPage(logMain.UserName, False)
        End If
    End Sub
End Class
