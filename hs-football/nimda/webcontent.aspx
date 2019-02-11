<%@ Page Language="VB" MasterPageFile="~/Nimda.master" AutoEventWireup="false" CodeFile="webcontent.aspx.vb" Inherits="nimda_webcontent_edit" title="Web Content Manager" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div>
        <asp:Label ID="Label5" runat="server" Text="Web Content Manager" CssClass="h2title" EnableViewState="false"></asp:Label><br />
        <br />
        Edit content of web page:<br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="RecID" EnableViewState="false" DataSourceID="WebContentDataSource" RowStyle-CssClass="RowStyle" GridLines="None" PagerStyle-CssClass="GridFooterStyle" HeaderStyle-CssClass="HeaderStyle">
            <Columns>
                <asp:BoundField DataField="PageName" HeaderText="Page ID" SortExpression="PageName" ItemStyle-HorizontalAlign="Left" />
                <%--<asp:BoundField DataField="LinkName" HeaderText="LinkName" SortExpression="LinkName" ItemStyle-HorizontalAlign="Left" />--%>
                <asp:BoundField DataField="PageTitle" HeaderText="PageTitle" SortExpression="PageTitle" HtmlEncode="false" ItemStyle-HorizontalAlign="Left" />
                <asp:HyperLinkField Text="Edit" HeaderText="Action" DataNavigateUrlFields="RecID" DataNavigateUrlFormatString="webcontent-upd.aspx?artID={0}"></asp:HyperLinkField>
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="WebContentDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAllWebContent" TypeName="WebContentBLL" EnableViewState="false"></asp:ObjectDataSource>
    </div>
</asp:Content>

