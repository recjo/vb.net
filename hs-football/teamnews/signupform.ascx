<%@ Control Language="VB" AutoEventWireup="false" CodeFile="signupform.ascx.vb" Inherits="teamnews_signupform" %>
<hr style="color: #800000;" />
Sign up to receive team announcements via email.<br />

<table id="tbl" runat="server">
<tr><td>Subscribe to: </td><td><asp:Label ID="lblLeague" runat="server"></asp:Label></td></tr>
<tr><td>Parent's Full Name: </td><td><asp:TextBox ID="txtparentname" runat="server"></asp:TextBox></td></tr>
<tr><td>Child's Name: </td><td><asp:TextBox ID="txtchildname" runat="server"></asp:TextBox></td></tr>
<tr><td>Email: </td><td><asp:TextBox ID="txtemail" runat="server"></asp:TextBox></td></tr>
<tr><td></td><td><asp:Button ID="Button1" runat="server" Text="Join" /></td></tr>
</table>

<asp:Label ID="lblResults" runat="server" Text="<br /><br /><br /><h2>Important! You are not done. Please read!</h2> Thank you. You have been added to the news list.<br /><br /><b>Please make sure your spam blocker will accept emails from mailers@losalgriffins.com<br /><br /><u>A test email was sent to [zmail]</u>. Please check for it <u>NOW</u> and make sure it did not end up in your junk or spam folder!</b>" Visible="false"></asp:Label>

<asp:ObjectDataSource ID="NewsletterDataSource" runat="server" InsertMethod="InsertSubscriber" TypeName="NewsletterBLL">
    <InsertParameters>
        <asp:Parameter Name="league" Type="String" />
        <asp:Parameter Name="parentname" Type="String" />
        <asp:Parameter Name="childname" Type="String" />
        <asp:Parameter Name="email" Type="String" />
    </InsertParameters>
</asp:ObjectDataSource>
