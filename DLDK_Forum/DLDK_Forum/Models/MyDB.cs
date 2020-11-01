namespace DLDK_Forum.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class MyDB : DbContext
    {
        public MyDB()
            : base("name=MyDB")
        {
        }

        public virtual DbSet<BaiViet> BaiViets { get; set; }
        public virtual DbSet<BinhLuan> BinhLuans { get; set; }
        public virtual DbSet<CamXuc> CamXucs { get; set; }
        public virtual DbSet<ChuDe> ChuDes { get; set; }
        public virtual DbSet<NguoiDung> NguoiDungs { get; set; }
        public virtual DbSet<PhanHoi> PhanHois { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<BaiViet>()
                .Property(e => e.MaBaiViet)
                .IsUnicode(false);

            modelBuilder.Entity<BaiViet>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<BaiViet>()
                .Property(e => e.DuongDanHinhAnh)
                .IsUnicode(false);

            modelBuilder.Entity<BaiViet>()
                .Property(e => e.MaChuDe)
                .IsUnicode(false);

            modelBuilder.Entity<BaiViet>()
                .HasMany(e => e.BinhLuans)
                .WithRequired(e => e.BaiViet)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<BaiViet>()
                .HasMany(e => e.CamXucs)
                .WithRequired(e => e.BaiViet)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<BinhLuan>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<BinhLuan>()
                .Property(e => e.MaBaiViet)
                .IsUnicode(false);

            modelBuilder.Entity<CamXuc>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<CamXuc>()
                .Property(e => e.MaBaiViet)
                .IsUnicode(false);

            modelBuilder.Entity<ChuDe>()
                .Property(e => e.MaChuDe)
                .IsUnicode(false);

            modelBuilder.Entity<ChuDe>()
                .HasMany(e => e.BaiViets)
                .WithRequired(e => e.ChuDe)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<NguoiDung>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<NguoiDung>()
                .Property(e => e.MatKhau)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<NguoiDung>()
                .HasMany(e => e.BaiViets)
                .WithRequired(e => e.NguoiDung)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<NguoiDung>()
                .HasMany(e => e.BinhLuans)
                .WithRequired(e => e.NguoiDung)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<NguoiDung>()
                .HasMany(e => e.CamXucs)
                .WithRequired(e => e.NguoiDung)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PhanHoi>()
                .Property(e => e.Email)
                .IsUnicode(false);
        }
    }
}
