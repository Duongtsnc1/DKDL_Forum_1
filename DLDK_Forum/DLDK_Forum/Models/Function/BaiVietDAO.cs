using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DLDK_Forum.Models;
using DLDK_Forum.Models.N_models;

namespace DLDK_Forum.Models.Function
{
    public class BaiVietDAO
    {
        MyDB a;
        public BaiVietDAO()
        {
            a = new MyDB();
        }

        public IQueryable<BaiViet> GetBaiViets(string idChuDe)
        {
            IQueryable<BaiViet> result;
            if (idChuDe != "") { 
                 result = (from s in a.BaiViets
                               where s.MaChuDe == idChuDe
                               select s);
            }
            else
            {
                 result = (from s in a.BaiViets
                              select s);
            }
            return result;
        }
        public List<HotPost> GetHotBaiViets()
        {
            List<HotPost> NDBV = new List<HotPost>();
            var BV = a.BaiViets.ToList();
            HotPost tmp;
            foreach (var item in BV)
            {
                tmp = new HotPost();
                tmp.ID = item;
                tmp.tuongtac = item.CamXucs.Where(s=>s.Thich==1).Count();
                NDBV.Add(tmp);
            }
            NDBV.Sort((a, b) => a.tuongtac.CompareTo(b.tuongtac));
            NDBV.Reverse();
            return NDBV;
        }
        public string BaiMoi()
        {
            List<int> list = new List<int>();
            foreach (var item in a.BaiViets)
            {
                list.Add(Convert.ToInt32(item.MaBaiViet.Substring(2)));
            }
            int index = 1;
            while (list.IndexOf(index) != -1)
            {
                index++;
            }
            return "BV" + index.ToString();
        }
    }
}