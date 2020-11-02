using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DLDK_Forum.Models.Function
{
    public class CamXucDAO
    {
        MyDB a;
        public CamXucDAO()
        {
            a = new MyDB();
        }
        public CamXuc getCamXuc(string email,string maBV)
        {
            return a.CamXucs.SingleOrDefault(s => s.Email == email & s.MaBaiViet == maBV);
        }
    }
}