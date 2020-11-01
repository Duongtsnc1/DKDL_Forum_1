using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DLDK_Forum.Models;

namespace DLDK_Forum.Areas.Admin.Controllers
{
    public class BaiVietsController : Controller
    {
        private MyDB db = new MyDB();

        // GET: Admin/BaiViets
        public ActionResult Index()
        {
            var baiViets = db.BaiViets.Include(b => b.ChuDe).Include(b => b.NguoiDung);
            return View(baiViets.ToList());
        }

        // GET: Admin/BaiViets/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BaiViet baiViet = db.BaiViets.Find(id);
            if (baiViet == null)
            {
                return HttpNotFound();
            }
            return View(baiViet);
        }

        // GET: Admin/BaiViets/Create
        public ActionResult Create()
        {
            ViewBag.MaChuDe = new SelectList(db.ChuDes, "MaChuDe", "TenChuDe");
            ViewBag.Email = new SelectList(db.NguoiDungs, "Email", "HoTen");
            return View();
        }

        // POST: Admin/BaiViets/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaBaiViet,Email,Noidung,DuongDanHinhAnh,MaChuDe,TinhTrang,TieuDe,ThoiGian")] BaiViet baiViet)
        {
            if (ModelState.IsValid)
            {
                db.BaiViets.Add(baiViet);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaChuDe = new SelectList(db.ChuDes, "MaChuDe", "TenChuDe", baiViet.MaChuDe);
            ViewBag.Email = new SelectList(db.NguoiDungs, "Email", "HoTen", baiViet.Email);
            return View(baiViet);
        }

        // GET: Admin/BaiViets/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BaiViet baiViet = db.BaiViets.Find(id);
            if (baiViet == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaChuDe = new SelectList(db.ChuDes, "MaChuDe", "TenChuDe", baiViet.MaChuDe);
            ViewBag.Email = new SelectList(db.NguoiDungs, "Email", "HoTen", baiViet.Email);
            return View(baiViet);
        }

        // POST: Admin/BaiViets/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaBaiViet,Email,Noidung,DuongDanHinhAnh,MaChuDe,TinhTrang,TieuDe,ThoiGian")] BaiViet baiViet)
        {
            if (ModelState.IsValid)
            {
                db.Entry(baiViet).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaChuDe = new SelectList(db.ChuDes, "MaChuDe", "TenChuDe", baiViet.MaChuDe);
            ViewBag.Email = new SelectList(db.NguoiDungs, "Email", "HoTen", baiViet.Email);
            return View(baiViet);
        }

        // GET: Admin/BaiViets/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BaiViet baiViet = db.BaiViets.Find(id);
            if (baiViet == null)
            {
                return HttpNotFound();
            }
            return View(baiViet);
        }

        // POST: Admin/BaiViets/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            BaiViet baiViet = db.BaiViets.Find(id);
            db.BaiViets.Remove(baiViet);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed_2()
        {
            string id = Request.Form["check"].ToString();
            BaiViet baiViet = db.BaiViets.Find(id);
            db.BaiViets.Remove(baiViet);
            db.SaveChanges();
            return RedirectToAction("QuanLyBaiViet","QuanLy");
        }
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
