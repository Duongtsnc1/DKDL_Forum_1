using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DLDK_Forum.Models;
using DLDK_Forum.Models.Function;
using System.Text.RegularExpressions;
using DLDK_Forum.Models.N_models;
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
        public ActionResult post(string idChuDe="", string search = "")
        {
            List<BaiViet> result = new List<BaiViet>();
            if (search == "" && idChuDe!="")
            {
                result = MyDBContext.BaiViets.Where(s => s.MaChuDe == idChuDe).ToList();
            }
            else if (idChuDe == "" && search!="")
            {
                result = MyDBContext.BaiViets.Where(s => s.TieuDe.Contains(search)).ToList();
            }
            else if (idChuDe == "")
            {
                result = MyDBContext.BaiViets.ToList();
            }
            else
            {
                result = MyDBContext.BaiViets.Where(s => s.MaChuDe == idChuDe & s.TieuDe.Contains(search)).ToList();
            }
            result.OrderBy(s => s.ThoiGian).Reverse();
            return View(result);
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
                string filename = Regex.Replace(Path.GetFileName(file.FileName)," ","") ;
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
            return Redirect("/Post/Single_Post?idPost="+idPost);           
        }
        [HttpPost]
        public ActionResult bieucam(CamXuc CX)
        {
            if (Session["User"] == null)
            {
                @TempData["Error"] = "Bạn cần đăng nhập!";
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
            diaryDAO DAO = new diaryDAO();
            List<diary> list = DAO.getDiary(idAccount);
            NguoiDungDAO DAO_ND = new NguoiDungDAO();
            var TaiKhoan = DAO_ND.getNguoiDung(idAccount) ;
            ViewBag.nguoidung = TaiKhoan;
            ViewBag.diary = list;
            return View();
        }
        //public ActionResult Diary(string idAccount)
        //{
        //    diaryDAO DAO = new diaryDAO();
        //    List<diary> list = DAO.getDiary(idAccount);
        //    return View(list);
        //}
        //[HttpPost]
        //public ActionResult Search(string search)
        //{

        //    var a = MyDBContext.BaiViets.Where(s => s.TieuDe.Contains(search)).ToList();
        //}
    }
}