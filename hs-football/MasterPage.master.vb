
Partial Class MasterPage
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.Title = "" Or Page.Title = "Untitled Page" Then
            Page.Title = ConfigurationManager.AppSettings("BizName")
        Else
            Page.Title &= " - " & ConfigurationManager.AppSettings("BizName")
        End If

        'lblHeaderTitle.Text = ConfigurationManager.AppSettings("BizName")
        lblCopyright.Text = "&copy;" & Date.Today.Year & " " & ConfigurationManager.AppSettings("copyrightStr")

        Dim jsLink As New HtmlGenericControl()
        jsLink.TagName = "script"
        jsLink.Attributes.Add("src", ResolveClientUrl("~/scripts/menu.js"))
        jsLink.Attributes.Add("type", "text/javascript")
        Page.Header.Controls.Add(jsLink)

        Dim jsLink2 As New HtmlGenericControl()
        jsLink2.TagName = "script"
        jsLink2.Attributes.Add("src", ResolveClientUrl("~/scripts/header_menus.js"))
        jsLink2.Attributes.Add("type", "text/javascript")
        Page.Header.Controls.Add(jsLink2)

        Dim jsLink3 As New HtmlGenericControl()
        jsLink3.TagName = "script"
        jsLink3.Attributes.Add("src", ResolveClientUrl("~/scripts/rcdatetime.js"))
        jsLink3.Attributes.Add("type", "text/javascript")
        Page.Header.Controls.Add(jsLink3)
    End Sub
End Class

