using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DLDK_Forum.Models;
using DLDK_Forum.Models.N_models;
using DLDK_Forum.Models.Function;
using System.IO;

namespace DLDK_Forum.Controllers
{
    public class HomeController : Controller
    {
        private MyDB MyDBContext = new MyDB();
        public ActionResult Login_Logout()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(NguoiDung model)
        {
            ViewBag.mes = "";
            NguoiDungDAO DAO = new NguoiDungDAO();
            var result = DAO.login(model.Email, model.MatKhau);
            if (result == true)
            {
                var user = DAO.GetUser(model.Email);
                Session["User"] = user;
                ViewBag.mes = "Thành công";
                return RedirectToAction("Home");
            }
            else
            {
                TempData["Error_login"] = "Tài Khoản Hoặc Mật Khẩu Không Đúng!!!!!!";
                return RedirectToAction("Login_Logout");
            } 
        }
        public ActionResult Logout()
        {
            Session["User"] = null;
            return Redirect("/");
        }
        [HttpPost]
        public ActionResult Register(NguoiDung model,HttpPostedFileBase file)
        {
            NguoiDungDAO DAO = new NguoiDungDAO();
            NguoiDung ND = new NguoiDung();

            if(DAO.Emails().Where(s => s == model.Email).Count() > 0)
            {
                TempData["Error_Res"] = "Email đã được sử dụng";
                return RedirectToAction("Login_Logout");
            }
            else {
                ND.Email = model.Email;
                ND.HoTen = model.HoTen;
                ND.MatKhau = model.MatKhau;
                ND.MoTa = model.MoTa;
                ND.QuyenAdmin = 0;
                ND.GioiTinh = model.GioiTinh;
                if (file != null && file.ContentLength > 0)
                {
                    string filename = Path.GetFileName(file.FileName);
                    string imgpath = Path.Combine(Server.MapPath("~/images/"), filename);
                    file.SaveAs(imgpath);
                    ND.AnhDaiDien = "images/" + file.FileName;
                }
                else
                {
                    ND.AnhDaiDien = "images/avt_default.jpg";
                }
                TempData["Error_Res"] = "Đăng ký thành công";
                MyDBContext.NguoiDungs.Add(ND);
                MyDBContext.SaveChanges();
                return RedirectToAction("Login_Logout"); 
            }
        }

        public ActionResult Contact()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ThemPhanHoi(PhanHoi model)
        {
            try { 
                model.ThoiGian = DateTime.Now;
                MyDBContext.PhanHois.Add(model);
                MyDBContext.SaveChanges();
                TempData["phanhoi"] = "Cảm ơn bạn! Vì chúng tôi luôn luôn lắng nghe và thấu hiểu!";
            }
            catch (Exception e)
            {
                TempData["phanhoi"] = e.ToString();
            }
            return RedirectToAction("Contact","Home");
        }
        public ActionResult About()
        {
            return View();
        }
        public ActionResult Home()
        {
            return View();
        }
        public ActionResult Account(string idAccount)
        {
            var TaiKhoan = MyDBContext.NguoiDungs.SingleOrDefault(s => s.Email == idAccount);
            return View(TaiKhoan);
        }
        public ActionResult List_Topic()
        {
            return View();
        }
        public ActionResult HotAccount()
        {
            NguoiDungDAO DAO = new NguoiDungDAO();
            return View(DAO.GetHotNguoiDung().GetRange(0,4));
        }
        public ActionResult HotBaiViet()
        {
            BaiVietDAO DAO = new BaiVietDAO();
            return View(DAO.GetHotBaiViets().GetRange(0, 4));
        }
        public ActionResult tesst()
        {
            return View();
        }
        //[HttpPost]
        //public ActionResult Search(string search)
        //{
        //    var a = MyDBContext.BaiViets.Where(s => s.TieuDe.Contains(search)).ToList();
        //}
    }
}