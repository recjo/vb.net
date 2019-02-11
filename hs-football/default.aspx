<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="default.aspx.vb" Inherits="_default" %>
<%@ Register TagPrefix="uc1" TagName="MenuControl" Src="menus/MenuControl.ascx" %>
                
<asp:Content ID="Content1" ContentPlaceHolderID="MenuContent" Runat="Server">
    <uc1:MenuControl id="mcMenu" runat="server" EnableViewState="false"></uc1:MenuControl>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="feature">
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="/reg/" ImageUrl="images/open.jpg" Width="427" Height="380" ToolTip="Los Alamitos Signups"></asp:HyperLink>
    </div>
    
	<p>
	<asp:FormView ID="FormView1" runat="server" DataKeyNames="RecID" DataSourceID="WebContentDataSource" EnableViewState="false">
        <ItemTemplate>
            <h2><asp:Label ID="lblPageTitle" runat="server" Text='<%# Eval("PageTitle") %>' EnableViewState="false"></asp:Label></h2>
            <asp:Label ID="PageTextLabel" runat="server" Text='<%# Eval("PageText") %>' EnableViewState="false"></asp:Label> 
        </ItemTemplate>
    </asp:FormView>
    </p>

    <div class="colums">
        <div class="left">
            <asp:FormView ID="FormView2" runat="server" DataKeyNames="RecID" DataSourceID="WebContentDataSource2" EnableViewState="false">
                <ItemTemplate>
                    <div class="title"><h2><asp:Label ID="secTitle" runat="server" Text='<%# Eval("PageTitle") %>' EnableViewState="false"></asp:Label></h2></div>
                    <p><asp:Label ID="PageTextLabel" runat="server" Text='<%# Eval("PageText") %>' EnableViewState="false"></asp:Label></p>
                </ItemTemplate>
            </asp:FormView>
            <p>&nbsp;</p>
        </div><!-- left -->
        <div class="right">
            <asp:FormView ID="FormView3" runat="server" DataKeyNames="RecID" DataSourceID="WebContentDataSource3" EnableViewState="false">
                <ItemTemplate>
                    <div class="title"><h2><asp:Label ID="secTitle" runat="server" Text='<%# Eval("PageTitle") %>' EnableViewState="false"></asp:Label></h2></div>
                    <p><asp:Label ID="PageTextLabel" runat="server" Text='<%# Eval("PageText") %>' EnableViewState="false"></asp:Label></p>
                </ItemTemplate>
            </asp:FormView>
        </div><!-- right -->

    </div> <!-- colums -->
    
    
    
    <asp:ObjectDataSource ID="WebContentDataSource" runat="server"
        SelectMethod="GetWebContentByPageName" TypeName="WebContentBLL" EnableViewState="false">
        <SelectParameters>
            <asp:Parameter DefaultValue="HomePage - Main Message" Name="PageName" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
    <asp:ObjectDataSource ID="WebContentDataSource2" runat="server"
        SelectMethod="GetWebContentByPageName" TypeName="WebContentBLL" EnableViewState="false">
        <SelectParameters>
            <asp:Parameter DefaultValue="HomePage - Red Box 1" Name="PageName" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
    <asp:ObjectDataSource ID="WebContentDataSource3" runat="server"
        SelectMethod="GetWebContentByPageName" TypeName="WebContentBLL" EnableViewState="false">
        <SelectParameters>
            <asp:Parameter DefaultValue="HomePage - Red Box 2" Name="PageName" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
<%--
    <asp:Label ID="lblBizName" runat="server" Font-Bold="true" EnableViewState="false"></asp:Label> 
    <asp:Label ID="lblBizAddy1" runat="server" EnableViewState="false"></asp:Label> 
    <asp:Label ID="lblBizCity" runat="server" EnableViewState="false"></asp:Label> <asp:Label ID="lblBizState" runat="server"></asp:Label> <asp:Label ID="lblBizZip" runat="server"></asp:Label> 
    <asp:Label ID="lblBizPhone" runat="server" EnableViewState="false"></asp:Label> 
    <asp:Label ID="lblBizFax" runat="server" EnableViewState="false"></asp:Label>--%>
</asp:Content>

