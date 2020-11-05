using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DLDK_Forum.Models;
using DLDK_Forum.Models.N_models;
namespace DLDK_Forum.Models.Function
{
    public class diaryDAO
    {
        private MyDB a;
        public diaryDAO()
        {
            a = new MyDB();
        }
        
        public List<diary> getDiary(string idAccount)
        {
            List<diary> list = new List<diary>();

            var tmp1 = a.CamXucs.Where(s => s.Email == idAccount).ToList();
            diary CX;
            foreach(var item in tmp1)
            {
                CX = new diary();
                CX.Email = item.Email;
                CX.MaBaiViet = item.MaBaiViet;
                CX.Loai = "Cảm xúc";
                CX.ThoiGian = item.ThoiGian;
                list.Add(CX);
            }

            var tmp2 = a.BinhLuans.Where(s => s.Email == idAccount).ToList();
            foreach (var item in tmp2)
            {
                CX = new diary();
                CX.Email = item.Email;
                CX.MaBaiViet = item.MaBaiViet;
                CX.Loai = "Bình luận";
                CX.ThoiGian = item.ThoiGian;
                list.Add(CX);
            }
            return list.OrderBy(s => s.ThoiGian).Reverse().ToList();
        }
        //public 
    }
}