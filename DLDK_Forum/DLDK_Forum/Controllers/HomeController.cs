using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DLDK_Forum.Models;
using DLDK_Forum.Models.N_models;
using DLDK_Forum.Models.Function;
using System.IO;
using DLDK_Forum.Areas.common;
using DLDK_Forum.Security;
namespace DLDK_Forum.Controllers
{
    public class HomeController : Controller
    {
        private MyDB MyDBContext = new MyDB();
        public ActionResult Login_Logout()
        {
            if (Session["User"] != null)
            {
                NguoiDung a =  (NguoiDung)(Session["User"]);
                return Redirect("/Home/Account?idAccount="+a.Email);
            }
            return View();
        }
        [HttpPost]
        public ActionResult Login(NguoiDung model)
        {
            ViewBag.mes = "";
            NguoiDungDAO DAO = new NguoiDungDAO();
            var result = DAO.login(model.Email, Encryptor.MD5Hash(model.MatKhau));
            if (result == true)
            {
                var user = DAO.GetUser(model.Email);
                Session["User"] = user;
                Session["permission"] = user.QuyenAdmin;
                ViewBag.mes = "Thành công";
                if (Session["url"] != null)
                {
                    return Redirect((string)Session["url"]);
                }
                else
                {
                    return RedirectToAction("Home");
                }
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
            Session["permission"] = null;
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
                ND.MatKhau = Encryptor.MD5Hash(model.MatKhau);
                ND.MoTa = model.MoTa;
                ND.QuyenAdmin = "Anonymous";
                ND.GioiTinh = model.GioiTinh;
                ND.ThoiGian = DateTime.Now;
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
        public ActionResult Account(string idAccount="")
        {
            if (Session["User"] == null)
            {
                return Redirect("/Home/Login_Logout");
            }
            var TaiKhoan = MyDBContext.NguoiDungs.SingleOrDefault(s => s.Email == idAccount);
            ViewBag.nguoidung = TaiKhoan;
            return View();
        }
       [ChildActionOnly]
        public PartialViewResult List_Topic()
        {
            return PartialView();
        }
        [ChildActionOnly]
        public PartialViewResult HotAccount()
        {
            NguoiDungDAO DAO = new NguoiDungDAO();
            return PartialView(DAO.GetHotNguoiDung().GetRange(0,4));
        }
        [ChildActionOnly]
         public PartialViewResult HotBaiViet()
        {
            BaiVietDAO DAO = new BaiVietDAO();
            return PartialView(DAO.GetHotBaiViets().GetRange(0, 4));
        }
        public ActionResult tesst()
        {
            return View();
        }
    }
}