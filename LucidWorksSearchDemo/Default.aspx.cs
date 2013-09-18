using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace LucidWorksSearchDemo
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Going to reload data on a page refresh because data in database may have changed
            //since the last page load.
            if (!Page.IsPostBack)
            {
                if (Session["SearchWord"] != null)
                {
                    txtSearch.Text = Session["SearchWord"].ToString();
                    RunSearch(txtSearch.Text);
                }
            }
        }

        private string ExtractString(string ObjectOpeningTag, string ObjectClosingTag, XmlNode XMLNode)
        {
            int StartIndex = XMLNode.InnerXml.IndexOf(ObjectOpeningTag) + ObjectOpeningTag.Length;

            //If not found, return empty string now, no need to check ObjectClosingTag because ObjectOpeningTag is invalid.
            if (StartIndex == -1) { return string.Empty; }

            int EndIndex = XMLNode.InnerXml.IndexOf(ObjectClosingTag, StartIndex);

            //If not found, return empty string now, ObjectClosingTag and ObjectOpeningTag must be valid.
            if (EndIndex == -1) { return string.Empty; }

            return XMLNode.InnerXml.Substring(StartIndex, EndIndex - StartIndex);
        }

        private void RunSearch(string SearchWord)
        {
            List<SearchResultsItem> FoundItems = new List<SearchResultsItem>();

            try
            {
                Session["SearchWord"] = SearchWord;
                hdrResultsHeader.Visible = false;

                NetworkCredential MyNetworkCredentials = new NetworkCredential(Resources.User, Resources.Password);

                HttpWebRequest WebReq = (HttpWebRequest)WebRequest.Create(Resources.LucidWorksLink + SearchWord);

                WebReq.Credentials = MyNetworkCredentials;
                WebReq.Method = "GET";
                WebReq.ContentType = "application/xml";

                HttpWebResponse WebResp = (HttpWebResponse)WebReq.GetResponse();

                XmlDocument xmlDoc = new XmlDocument(); //* create an xml document object.
                xmlDoc.Load(WebResp.GetResponseStream());
                XmlNodeList ItemNodes = xmlDoc.SelectNodes("/response/result/doc");

                foreach (XmlNode Item in ItemNodes)
                {
                    SearchResultsItem FoundItem = new SearchResultsItem();

                    /*It is not possible to search for a node by name in collection because the name value is not
                     possible get access to that was provided. For example, <arr name=\"title\"><str>" The name of the node is
                     arr and not title and arr is used many times so not possible to map to needed node and search for
                     it using ["name"] A string parser was required for this emample.*/
                    FoundItem.Title = ExtractString("<arr name=\"title\"><str>", "</str>", Item);
                    FoundItem.Description = ExtractString("<str name=\"description\">", "</str>", Item);
                    FoundItem.Link = ExtractString("<str name=\"id\">", "</str>", Item);

                    FoundItems.Add(FoundItem);
                }
            }

            catch (System.Exception)
            {
            }

            lvSearchResults.DataSource = FoundItems;
            lvSearchResults.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            RunSearch(txtSearch.Text.Trim());
        }
    }
}