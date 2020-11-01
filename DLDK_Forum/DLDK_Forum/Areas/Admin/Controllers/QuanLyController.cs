using DLDK_Forum.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DLDK_Forum.Areas.Admin.Controllers
{
    public class QuanLyController : Controller
    {
        MyDB db = new MyDB();
        // GET: Admin/QuanLy
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult QuanLyNguoiDung()
        {
            ViewBag.DSND = db.NguoiDungs.ToList();
            return View();
        }
        public ActionResult QuanLyBaiViet()
        {
            ViewBag.DSBV = db.BaiViets.ToList();
            return View();
        }
        public ActionResult QuanLyPhanHoi()
        {
            ViewBag.DSPH = db.PhanHois.ToList();
            return View();
        }
    }
}