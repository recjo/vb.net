<%@ Page Language="VB" MasterPageFile="~/SubPage.master" AutoEventWireup="false" CodeFile="thankyou.aspx.vb" Inherits="contact_thankyou" title="Submission Successful" %>
<%@ Register TagPrefix="cs1" TagName="CareerSearch" Src="~/careers/CareersSearch.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MenuContent" Runat="Server">
    <cs1:CareerSearch id="McMenu" runat="server" EnableViewState="false" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2><asp:Label ID="lblTitle" runat="server" Text="Submission Successful" /></h2>
    
    Thank you for filling out our form.<br />
    A representative will contact you shortly.
</asp:Content>

