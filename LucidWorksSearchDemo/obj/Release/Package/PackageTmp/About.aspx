<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="LucidWorksSearchDemo.About" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <%--<h1><%: Title %>.</h1>--%>
        <h2>This is a demonstration of <b>LucidWorks</b> Search Service running on <b>Windows Azure.</b> </h2>
    </hgroup>

    <br />
    <p class="Paragraph">
        Windows Azure is an open and flexible cloud platform that enables developers to quickly build, deploy and manage applications across a global network of Microsoft-managed datacenters. Applications can be built using any language, tool or framework. And integration between public cloud applications and the existing IT environment is easily achieved. Whether creating new applications or enhancing existing applications, Windows Azure takes ideas to market faster and responds quicker to changes in business direction and needs.
    </p>
    <br />

    <p class="Paragraph">
        LucidWorks Search can be deployed on Windows Azure with identical functionality as on premise solutions. The difference is provisioning. While an on premise server must be acquired, configured and tested, a Windows Azure deployment can be provisioned within minutes. No servers to stand up, no patches to apply – just click and go.
    </p>
    <br />
    <p class="Paragraph">
        Start working on search applications in minutes. The instance will deliver the full power of LucidWorks Search and Apache Lucene/Solr to the cloud. LucidWorks handles all operational requirements. 
    </p>
    <br />
    <asp:HyperLink CssClass="HyperlinkRight" ID="hlLucidWorksAzureProductsHyperLink" Target="_blank" NavigateUrl="http://www.lucidworks.com/products/lucidworks-search/lucidworks-search-windows-azure" runat="server">Click here to get started!</asp:HyperLink>


    <br />
    <br />
    <br />

    <p class="Paragraph">
        For more info:
    </p>

    <asp:HyperLink CssClass="HyperlinkRight" ID="HyperLink1" Target="_blank" NavigateUrl="http://blogs.msdn.com/b/interoperability/" runat="server">http://blogs.msdn.com/b/interoperability/</asp:HyperLink>
    <br />
    <asp:HyperLink CssClass="HyperlinkRight" ID="HyperLink2" Target="_blank" NavigateUrl="http://www.interoperabilitybridges.com/Default.aspx" runat="server">http://www.interoperabilitybridges.com/Default.aspx</asp:HyperLink>
    <br />
    <asp:HyperLink CssClass="HyperlinkRight" ID="HyperLink3" Target="_blank" NavigateUrl="http://aka.ms/IntroMSOpenTech" runat="server">http://aka.ms/IntroMSOpenTech</asp:HyperLink>
    <br />
    <asp:HyperLink CssClass="HyperlinkRight" ID="HyperLink4" Target="_blank" NavigateUrl="http://www.microsoft.com/en-us/openness/default.aspx#home" runat="server">http://www.microsoft.com/en-us/openness/default.aspx#home</asp:HyperLink>


    <%--<aside>
        <h3>Aside Title</h3>
        <p>        
            Use this area to provide additional information.
        </p>
        <ul>
            <li><a runat="server" href="~/">Home</a></li>
            <li><a runat="server" href="~/About">About</a></li>
            <li><a runat="server" href="~/Contact">Contact</a></li>
        </ul>
    </aside>--%>
</asp:Content>
