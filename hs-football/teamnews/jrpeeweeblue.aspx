<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="jrpeeweeblue.aspx.vb" Inherits="teamnews_jrpeeweeblue" title="Untitled Page" %>
<%@ Register TagPrefix="uc1" TagName="MenuControl" Src="../menus/TeamNewsMenu.ascx" %>
<%@ Register TagPrefix="uc2" TagName="RegControl" Src="signupform.ascx" %>
                
<asp:Content ID="Content1" ContentPlaceHolderID="MenuContent" Runat="Server">
    <uc1:MenuControl id="mcMenu" runat="server" EnableViewState="false"></uc1:MenuControl>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:FormView ID="FormView1" runat="server" DataKeyNames="RecID" DataSourceID="WebContentDataSource" EnableViewState="false">
        <ItemTemplate>
            <h2><asp:Label ID="lblPageTitle" runat="server" Text='<%# Eval("PageTitle") %>' EnableViewState="false"></asp:Label></h2>
            <asp:Label ID="PageTextLabel" runat="server" Text='<%# Eval("PageText") %>' EnableViewState="false"></asp:Label><br />
        </ItemTemplate>
    </asp:FormView>
    
    <asp:ObjectDataSource ID="WebContentDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetWebContentByPageName" TypeName="WebContentBLL" EnableViewState="false">
        <SelectParameters>
            <asp:Parameter DefaultValue="Team News - JrPeeWeeBlue" Name="PageName" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
    
    <br /><br />
    <asp:HiddenField ID="hfLeague" runat="server" Value="jrpeeweeblue" />
    <uc2:RegControl id="mcSignup" runat="server" EnableViewState="false"></uc2:RegControl>
    
</asp:Content>

