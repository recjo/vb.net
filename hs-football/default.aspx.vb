
Partial Class _default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Page.Title = "Welcome to the Los Alamitos Griffins"

        Dim ltlMenuCode As Literal = CType(Page.Master.FindControl("ltlMenuCode"), Literal)
        ltlMenuCode.Text = "<script language=""JavaScript"" type=""text/javascript"">loadMenus(0);</script>"

        'lblBizName.Text = ConfigurationManager.AppSettings("BizName")
        'lblBizAddy1.Text = ConfigurationManager.AppSettings("BizAddy1")
        'lblBizCity.Text = ConfigurationManager.AppSettings("BizCity")
        'lblBizState.Text = ConfigurationManager.AppSettings("BizState") & ", "
        'lblBizZip.Text = ConfigurationManager.AppSettings("BizZip")
        'lblBizPhone.Text = "Phone: " & ConfigurationManager.AppSettings("BizPhone")
        'lblBizFax.Text = "Fax: " & ConfigurationManager.AppSettings("BizFax")
    End Sub
End Class
