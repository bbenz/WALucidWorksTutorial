<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LucidWorksSearchDemo._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <%--<h1><%: Title %>.</h1>--%>
                <h2>Please enter a search word and then hit enter. </h2>
            </hgroup>
            <asp:TextBox Width="100%" ID="txtSearch" runat="server" OnTextChanged="btnSearch_Click"></asp:TextBox>
            <hgroup>
            </hgroup>
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h3 runat="server" id="hdrResultsHeader">After you enter your search word, your search results will be displayed here.</h3>
    <ol class="round">

        <asp:ListView ID="lvSearchResults" runat="server">
            <ItemTemplate>
                <asp:HyperLink ID="TitleHyperLink" CssClass="Hyperlink" Target="_blank" NavigateUrl='<%# Eval("Link") %>' runat="server"><%# Eval("Title") %></asp:HyperLink>
                
                <%--<a target="_blank" href='<%# Eval("Link") %>'><%# Eval("Title") %></a> --%>

                 <br />
                
                <%# Eval("Description") %>
                </tr>
                <br />
                <br />
            </ItemTemplate>
            <EmptyDataTemplate>
                Sorry, our database does not contain any data that matches your search. Please try again.
            </EmptyDataTemplate>

        </asp:ListView>
    </ol>
</asp:Content>
