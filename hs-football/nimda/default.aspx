<%@ Page Language="VB" MasterPageFile="~/Nimda.master" AutoEventWireup="false" CodeFile="default.aspx.vb" Inherits="nimda_default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Label ID="lblPageTitle" runat="server" CssClass="h2title" Text="Administration" EnableViewState="false"></asp:Label>
    <br />
    Tools to administer website content.
    <br /><br />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="webcontent.aspx" EnableViewState="false">Web Content Manager</asp:HyperLink>
    
    <div style="height:200px;"></div>
</asp:Content>

