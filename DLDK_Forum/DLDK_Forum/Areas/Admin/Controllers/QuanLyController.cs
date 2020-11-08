using DLDK_Forum.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DLDK_Forum.Security;


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
            ViewBag.DSCD = db.ChuDes.ToList();            
            return View();
        }
        [HttpPost]  
        [ValidateAntiForgeryToken]
        public ActionResult QuanLyBaiViet_2()
        {
            ChuDe cd = new ChuDe();
            string macd = Request.Form["cbbChuDe"].ToString();
            //cd.MaChuDe = Request.Form["cbbChuDe"].ToString();
            cd = db.ChuDes.Single(b => b.MaChuDe == macd);
            ViewBag.BVCD = db.BaiViets.Where(a => a.MaChuDe == cd.MaChuDe).ToList();
            ViewBag.DSBV = db.BaiViets.ToList();
            ViewBag.DSCD = db.ChuDes.ToList();
            return View(cd);
        }
        public ActionResult QuanLyPhanHoi()
        {
            ViewBag.DSPH = db.PhanHois.ToList();
            return View();
        }
        
    }
}