using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DLDK_Forum.Models;
using DLDK_Forum.Models.Function;

namespace DLDK_Forum.Controllers
{
    public class PostController : Controller
    {
       private MyDB MyDBContext = new MyDB();

        // GET: Post
        public ActionResult ListPost(string idChuDe)
        {
            BaiVietDAO DAO = new BaiVietDAO();
            List<BaiViet> BV = new List<BaiViet>();
            if (idChuDe == "") {
                BV = MyDBContext.BaiViets.OrderBy(s=>s.ThoiGian).ToList();
            }
            else
            {
                BV = DAO.GetBaiViets(idChuDe).OrderBy(s=>s.ThoiGian).ToList();
            }
            return View(BV);
        }
        
        public ActionResult TableOfContents()
        {
            List<ChuDe> Topics = MyDBContext.ChuDes.Where(s=>s.TenChuDe!="Khác").OrderBy(s=>s.TenChuDe).ToList();
            return View(Topics);
        }
        public ActionResult Single_Post(string idPost)
        {
            var BaiViet = MyDBContext.BaiViets.SingleOrDefault(s => s.MaBaiViet == idPost);
            return View(BaiViet);
        }
        public ActionResult NewPost()
        {
            return View();
        }
        [HttpPost]
        public ActionResult dangbai(BaiViet BV,HttpPostedFileBase file)
        {
            if (Session["User"] == null)
            {
                TempData["Error"] = "Bạn phải đăng nhập!!";
                return Redirect("/Home/Login_Logout");
            }
            BaiVietDAO DAO = new BaiVietDAO();
            NguoiDung ND = (NguoiDung)Session["User"];
            BV.Email = ND.Email;
            BV.TinhTrang = 1;
            BV.ThoiGian = DateTime.Now;
            BV.MaBaiViet = DAO.BaiMoi();
            if (file != null && file.ContentLength > 0)
            {
                string filename = Path.GetFileName(file.FileName);
                string imgpath = Path.Combine(Server.MapPath("~/images/"), filename);
                file.SaveAs(imgpath);
                BV.DuongDanHinhAnh = "images/" + file.FileName;
            }
            else
            {
                BV.DuongDanHinhAnh = "images/Ha_long_1.jpg";
            }
            MyDBContext.BaiViets.Add(BV);
            MyDBContext.SaveChanges();
            return Redirect("/Post/Single_Post?idPost="+BV.MaBaiViet);
        }
        [HttpPost]
        public ActionResult binhluan( string NoiDung, string idPost)
        {
            if (Session["User"] == null)
            {
                return Redirect("/Home/Login_Logout");
            }
            NguoiDung ND = (NguoiDung)Session["User"];
            BinhLuan BL = new BinhLuan();
            BL.NoiDung = NoiDung;
            BL.MaBaiViet = idPost;
            BL.ThoiGian = DateTime.Now;
            BL.Email = ND.Email;
            MyDBContext.BinhLuans.Add(BL);
            MyDBContext.SaveChanges();
            return Redirect("/");
            //return View("Single_Post","Post",idPost);
        }
        [HttpPost]
        public ActionResult bieucam(CamXuc CX)
        {
            CX.Email = "user1@gmail.com";
            return Redirect("/Post/Single_Post?idPost=");
            //return View("Single_Post","Post",idPost);
        }
    }
}