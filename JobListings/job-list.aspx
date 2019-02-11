<%@ Page Title="" Language="VB" MasterPageFile="~/SubPage.master" AutoEventWireup="false" CodeFile="job-list.aspx.vb" Inherits="careers_job_list" %>
<%@ Register TagPrefix="cs1" TagName="CareerSearch" Src="~/careers/CareersSearch.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MenuContent" Runat="Server">
    <cs1:CareerSearch id="McMenu" runat="server" EnableViewState="false" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2><asp:Label ID="lblTitle" runat="server" Text="Job Openings" /></h2>
    <asp:Label ID="lblKeywords" runat="server" EnableViewState="false" style="display:block;margin-bottom:15px;" />

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        AllowPaging="True" PageSize="15" ShowHeader="false"  
        EmptyDataText="<br /><br />No Job Listings found..." EnableViewState="False" >
        <Columns>
            <asp:BoundField DataField="PostDate" DataFormatString="{0:d}" ItemStyle-HorizontalAlign="Left" />
            <asp:BoundField DataField="JobTitle" />
            <asp:BoundField DataField="Division" />
            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="lblFacility" runat="server" Text='<%# Eval("Facility") %>' Visible="false" />
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# String.Format("../careers/job-details.aspx?rid={0}", Eval("RecID")) %>'>More</asp:HyperLink>
                    <%-- Put new controls under lblFacility so as not to disturb groupby headers --%>
               </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    
    <%--<asp:ObjectDataSource ID="JobListingsDataSource" runat="server" SelectMethod="GetApprovedJobListings" TypeName="JobListingsBLL" EnableViewState="False" />--%>

</asp:Content>

