<%@ Page Language="VB" MasterPageFile="~/Nimda.master" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="Login" title="Please Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    <asp:Label ID="Label1" runat="server" CssClass="h2title" Text="Please Login"></asp:Label><br />
    <asp:Login runat="server" ID="logMain" CssClass="LoginBox" LoginButtonText="Enter" UserNameLabelText="User name" DisplayRememberMe="false">
        <TitleTextStyle CssClass="LoginBar" />
        <LabelStyle CssClass="LoginLabels" />
    </asp:Login>
</asp:Content>

