<%@ Page Title="" Language="VB" MasterPageFile="~/SubPage.master" AutoEventWireup="false" CodeFile="jobs-applications-details.aspx.vb" Inherits="nimda_jobs_applications_details" %>
<%@ Register TagPrefix="uc1" TagName="MenuControl" Src="~/menus/NimdaMenu.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    fieldset { border:solid 1px #516293;padding:10px; }
    legend { padding:10px; }
    label {
        width: 100px;
        display: inline-block;
    }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MenuContent" Runat="Server">
    <uc1:MenuControl id="McMenu" runat="server" EnableViewState="false" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2><asp:Label ID="lblTitle" runat="server" Text="Job Applications" /></h2>
    <asp:HyperLink ID="lnkBack" runat="server" style="float:right;">Back to Applications</asp:HyperLink>
    
    <fieldset style="clear:both;">
        <legend>Job Details</legend>
        
        <div id="dJobTitle" runat="server"><label>Job Title</label>
        <asp:Label ID="lblJobTitle1" runat="server" /></div>
        <div id="dPosted" runat="server"><label>Posted</label>
        <asp:Label ID="lblPosted" runat="server" /></div>
        <div id="dFacility" runat="server"><label>Facility</label>
        <asp:Label ID="lblFacility1" runat="server" /></div>
        <div id="dDivision" runat="server"><label>Division</label>
        <asp:Label ID="lblDivision1" runat="server" /></div>
    </fieldset>

    <fieldset>
        <legend>Applicant Information</legend>
        
        <div id="dName" runat="server"><label>Name</label>
        <asp:Label ID="lblName" runat="server" /></div>
        <div id="dAddress" runat="server"><label>Address</label>
        <asp:Label ID="lblAddress" runat="server" /></div>
        <div id="dPhone" runat="server"><label>Phone</label>
        <asp:Label ID="lblPhone" runat="server" /></div>
        <div id="dEmail" runat="server"><label>Email</label>
        <asp:HyperLink ID="lnkEmail" Target="_blank" runat="server" /></div>
    </fieldset>

    <fieldset id="fsCoverLetter" runat="server">
        <legend>Cover Letter</legend>
        
        <asp:Label ID="lblCoverLetter" runat="server" />
    </fieldset>

    <fieldset id="fsResume" runat="server">
        <legend>Resume</legend>
        
        <asp:Label ID="lblResume" runat="server" />
    </fieldset>
</asp:Content>

