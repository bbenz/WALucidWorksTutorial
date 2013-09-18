using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LucidWorksSearchDemo
{
    /// <summary>
    /// A class template for a item returned from a search. A property for each field is required
    /// since we are binding with Eval on a ListView that is readonly. 
    /// </summary>
    public class SearchResultsItem
    {
        public string Title { get; set; }
        public string Description { get; set; }
        public string Link { get; set; }
    }
}