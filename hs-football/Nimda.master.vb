
Partial Class Nimda
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblCopyright.Text = "&copy;" & Date.Today.Year & " " & ConfigurationManager.AppSettings("copyrightStr")
        'lblMainHeader.Text = ConfigurationManager.AppSettings("BizName") & " Administration"

        If HttpContext.Current.User.Identity.Name = "" Then
            Dim lefty As Object = CType(Page.Master.FindControl("lefty"), Object)
            lefty.Visible = False
        End If
    End Sub
End Class

