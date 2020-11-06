using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DLDK_Forum.Models.Function
{
    public class BinhLuanDAO
    {
        MyDB a;
        public BinhLuanDAO()
        {
            a = new MyDB();
        }
        public BinhLuan GetBinhLuan(string email,string idpost)
        {
            return a.BinhLuans.SingleOrDefault(s => s.Email == email & s.MaBaiViet == idpost);

        }
    }
}