﻿using DLDK_Forum.Models;
using DLDK_Forum.Models.Function;
using DLDK_Forum.Models.N_models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;
using DLDK_Forum.Security;
namespace DLDK_Forum.Controllers
{
    public class PostController : Controller
    {
        private MyDB MyDBContext = new MyDB();

        // GET: Post
        public ActionResult ListPost()
        {
            return View();
        }
       [ChildActionOnly]
        public PartialViewResult post(string idChuDe = "", string search = "")
        {
           // ViewBag["id"] = idChuDe;
            var BV = MyDBContext.BaiViets.Where(s => s.TinhTrang == 1);
            List<BaiViet> result = new List<BaiViet>();
            if (search == string.Empty && idChuDe != string.Empty)
            {
                  result = BV.Where(s => s.MaChuDe == idChuDe).OrderBy(s=>s.ThoiGian).ToList();
            }
            else if (idChuDe == string.Empty && search != string.Empty)
            {
                  result = BV.Where(s => s.TieuDe.Contains(search)||s.Noidung.Contains(search)||s.NguoiDung.HoTen.Contains(search)).OrderBy(s => s.ThoiGian).ToList();
            }
            else if (idChuDe == string.Empty)
            {
                  result = BV.OrderBy(s => s.ThoiGian).ToList();
            }
            else
            {
                  result = BV.Where(s => s.MaChuDe == idChuDe & (s.TieuDe.Contains(search) || s.Noidung.Contains(search) || s.NguoiDung.HoTen.Contains(search))).OrderBy(s => s.ThoiGian).ToList();
            }            
            return PartialView(result.Where(s=>s.TinhTrang==1).Reverse());
        }

       [ChildActionOnly]
        public PartialViewResult TableOfContents(string idChuDe = "")
        {
            ViewBag.ID = idChuDe;
            List<ChuDe> Topics = MyDBContext.ChuDes.Where(s => s.TenChuDe != "Khác").OrderBy(s => s.TenChuDe).ToList();
            return PartialView(Topics);
        }
        public ActionResult Single_Post(string idPost="")
        {
            if (idPost == "")
            {
                TempData["E"] = "Đường dẫn không tồn tại";
                return Redirect("/Home/Home");
            }
            var BaiViet = MyDBContext.BaiViets.SingleOrDefault(s => s.MaBaiViet == idPost);
            if ((string)Session["permission"] == "admin")
            {
                return View(BaiViet);
            }
            if (BaiViet.TinhTrang == 0)
            {
                //TempData["E"] = "Đường dẫn không tồn tại";
                return Redirect("/Home/Home");
            }
            return View(BaiViet);
        }
        public ActionResult NewPost()
        {
            if(Session["User"] == null)
            {
                return Redirect("/Home/Login_Logout");
            }
            return View();
        }
        [HttpPost]
        public ActionResult dangbai(BaiViet BV, HttpPostedFileBase file)
        {
            if (Session["User"] == null)
            {
                TempData["Error"] = "Bạn phải đăng nhập!!";
                return Redirect("/Home/Login_Logout?ReturnUrl=/Post/NewPost");
            }
            BaiVietDAO DAO = new BaiVietDAO();
            NguoiDung ND = (NguoiDung)Session["User"];
            BV.Email = ND.Email;
            BV.TinhTrang = 0;
            BV.ThoiGian = DateTime.Now;
            BV.MaBaiViet = DAO.BaiMoi();
            if (file != null && file.ContentLength > 0)
            {
                string filename = Regex.Replace(Path.GetFileName(file.FileName), " ", string.Empty);
                string imgpath = Path.Combine(Server.MapPath("~/images/"), filename);
                file.SaveAs(imgpath);
                BV.DuongDanHinhAnh = "images/" + filename;
            }
            else
            {
                BV.DuongDanHinhAnh = "images/post_default.jpg";
            }
            MyDBContext.BaiViets.Add(BV);
            MyDBContext.SaveChanges();
            return Redirect("/Home/Account?idAccount=" + BV.Email);
        }
        [HttpPost]
        public ActionResult binhluan(string NoiDung, string idPost)
        {
            if (Session["User"] == null)
            {

                Session["url"] = "/Post/Single_Post?idPost=" + idPost;
                return Redirect("/Home/Login_Logout");
            }
            NguoiDung ND = (NguoiDung)Session["User"];
            BinhLuan BL = new BinhLuan();
            BL.NoiDung = NoiDung;
            BL.MaBaiViet = idPost;
            DateTime date = DateTime.Now;
            BL.ThoiGian = new DateTime(date.Year, date.Month, date.Day, date.Hour, date.Minute, date.Second, date.Kind); 
            BL.Email = ND.Email;
            MyDBContext.BinhLuans.Add(BL);
            MyDBContext.SaveChanges();
            return Redirect("/Post/Single_Post?idPost=" + idPost);
        }

        [HttpPost]
        public ActionResult bieucam(CamXuc CX)
        {
            if (Session["User"] == null)
            {
                TempData["Error"] = "Bạn cần đăng nhập!";
                Session["url"] = "/Post/Single_Post?idPost=" + CX.MaBaiViet;
                return RedirectToAction("Login_Logout", "Home");
            }
            CamXucDAO DAO = new CamXucDAO();
            NguoiDung user = (NguoiDung)Session["User"];
            var CX_cu = MyDBContext.CamXucs.SingleOrDefault(s => s.Email == user.Email & s.MaBaiViet == CX.MaBaiViet);
            if (CX_cu != null)
            {
                if (CX_cu.Thich == CX.Thich)
                {
                    MyDBContext.CamXucs.Remove(CX_cu);
                }
                else
                {
                    CX_cu.Thich = CX.Thich;
                    CX_cu.ThoiGian = DateTime.Now;
                    MyDBContext.Entry(CX_cu).State = System.Data.Entity.EntityState.Modified;
                }
            }
            else
            {
                CX.ThoiGian = DateTime.Now;
                CX.Email = user.Email;
                MyDBContext.CamXucs.Add(CX);
            }

            MyDBContext.SaveChanges();
            return Redirect(Request.UrlReferrer.ToString());
            //return View("Single_Post","Post",idPost);
        }
        public ActionResult Diary(string idAccount)
        {
            if (Session["User"] == null)
            {
                return Redirect("/Home/Home");
            }
            if (((NguoiDung)Session["User"]).Email != idAccount)
            {
                NguoiDung ND = (NguoiDung)Session["User"];
                return Redirect("/Post/Diary?idAccount"+ND.Email);
            }
            diaryDAO DAO = new diaryDAO();
            List<diary> list = DAO.getDiary(idAccount);
            NguoiDungDAO DAO_ND = new NguoiDungDAO();
            var TaiKhoan = DAO_ND.getNguoiDung(idAccount);
            ViewBag.nguoidung = TaiKhoan;
            ViewBag.diary = list;
            return View();
        }
        [HttpPost]
        public ActionResult XoaDiary(string idPost, int kind, DateTime time)
        {
            NguoiDung ND = (NguoiDung)Session["User"];

            if (kind == 2)
            {

                var BL = MyDBContext.BinhLuans.Where(s => s.Email == ND.Email && s.MaBaiViet == idPost);
                MyDBContext.BinhLuans.RemoveRange(BL);

            }
            else
            {
                CamXuc CX = MyDBContext.CamXucs.SingleOrDefault(s => s.Email == ND.Email && s.MaBaiViet == idPost && s.ThoiGian == time);
                MyDBContext.CamXucs.Remove(CX);

            }
            MyDBContext.SaveChanges();
            return Redirect(Request.UrlReferrer.ToString());
        }
        [HttpPost]
        public ActionResult Delete_cmt(string idBaiViet,string idNguoiDung)
        {
            MyDBContext.BinhLuans.Remove(MyDBContext.BinhLuans.SingleOrDefault(s => s.Email == idNguoiDung && s.MaBaiViet == idBaiViet));
            MyDBContext.SaveChanges();
            return Redirect("/Post/Single_Post?idPost="+idBaiViet);
        }
    }
}