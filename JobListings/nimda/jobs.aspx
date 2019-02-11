<%@ Page Title="" Language="VB" MasterPageFile="~/SubPage.master" AutoEventWireup="false" CodeFile="jobs.aspx.vb" Inherits="nimda_jobs" %>
<%@ Register TagPrefix="uc1" TagName="MenuControl" Src="~/menus/NimdaMenu.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MenuContent" Runat="Server">
    <uc1:MenuControl id="McMenu" runat="server" EnableViewState="false" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2><asp:Label ID="lblTitle" runat="server" Text="Job Listings" /></h2>
    <asp:HyperLink ID="lnkBack" runat="server" NavigateUrl="jobs-add.aspx" style="float:right;">Add Job Listing</asp:HyperLink>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" PageSize="15"
        DataKeyNames="RecID" DataSourceID="JobListingsDataSource" EnableViewState="False"
        EmptyDataText="<br /><br />No Job Listings found..." AllowPaging="True" 
        OnRowDataBound="CheckAppCount_RowDataBound" ShowHeader="false" >
        <Columns>
            <asp:BoundField DataField="PostDate" DataFormatString="{0:d}" ItemStyle-HorizontalAlign="Left" />
            <asp:BoundField DataField="JobTitle" />
            <asp:BoundField DataField="Division" />
            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%#displayYN(Boolean.Parse(Eval("Display")))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Apps" ItemStyle-HorizontalAlign="Center" />
            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%-- Put new controls under hfFacility so as not to disturb groupby headers --%>
                    <asp:HiddenField ID="hfFacility" runat="server" Value='<%# Eval("Facility") %>' />
                    <asp:HyperLink ID="lnkEdit" runat="server" NavigateUrl='<%# String.Format("jobs-add.aspx?rid={0}", Eval("RecID")) %>'>Edit</asp:HyperLink>
                    |
                    <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" NavigateUrl='<%# String.Format("../careers/job-details.aspx?rid={0}", Eval("RecID")) %>'>Preview</asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    
    <asp:ObjectDataSource ID="JobListingsDataSource" runat="server" SelectMethod="GetAllJobListingsWApps" TypeName="JobListingsBLL" EnableViewState="False" />
    
    
</asp:Content>
