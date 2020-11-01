using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DLDK_Forum.Models;
using DLDK_Forum.Models.N_models;

namespace DLDK_Forum.Models.Function
{
    public class NguoiDungDAO
    {
        MyDB a;
        public NguoiDungDAO()
        {
            a = new MyDB();
        }
        public List<NguoiDung_BaiViet> GetHotNguoiDung()
        {
            List<NguoiDung_BaiViet> NDBV = new List<NguoiDung_BaiViet>();
            var ND = a.NguoiDungs.ToList();
            NguoiDung_BaiViet tmp;
            foreach(var item in ND)
            {
                tmp=new NguoiDung_BaiViet();
                tmp.ID = item;
                tmp.SoLuongBaiViet = item.BaiViets.Count();
                NDBV.Add(tmp);
            }
            NDBV.Sort((a, b) => a.SoLuongBaiViet.CompareTo(b.SoLuongBaiViet));
            NDBV.Reverse();
            return NDBV;
        }
        public bool login(string email,string pass)
        {
            var result = a.NguoiDungs.SingleOrDefault(s => s.Email == email && s.MatKhau == pass);
            if (result != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public List<string> Emails()
        {
            List<string> E = new List<string>();
            foreach(var item in a.NguoiDungs)
            {
                E.Add(item.Email);
            }
            return E;
        }
        public int count()
        {
            return a.NguoiDungs.Count();
        }
        public NguoiDung GetUser(string id)
        {
            return a.NguoiDungs.Find(id);
        }
    }
}