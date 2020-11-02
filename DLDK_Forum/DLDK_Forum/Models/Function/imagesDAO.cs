using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DLDK_Forum.Models.Function
{
    public class imagesDAO
    {
        MyDB a;
        public imagesDAO()
        {
            a = new MyDB();
        }

        public string tenmoi()
        {
            return "" + a.imagess.Count().ToString() ; 
        }
    }
}