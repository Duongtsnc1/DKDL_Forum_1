namespace DLDK_Forum.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("BaiViet")]
    public partial class BaiViet
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public BaiViet()
        {
            BinhLuans = new HashSet<BinhLuan>();
            CamXucs = new HashSet<CamXuc>();
        }

        [Key]
        [StringLength(20)]
        public string MaBaiViet { get; set; }

        [Required]
        [StringLength(50)]
        public string Email { get; set; }

        [Required]
        public string Noidung { get; set; }

        [StringLength(100)]
        public string DuongDanHinhAnh { get; set; }

        [Required]
        [StringLength(20)]
        public string MaChuDe { get; set; }

        public int TinhTrang { get; set; }

        [Required]
        public string TieuDe { get; set; }

        public DateTime ThoiGian { get; set; }

        public virtual NguoiDung NguoiDung { get; set; }

        public virtual ChuDe ChuDe { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BinhLuan> BinhLuans { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CamXuc> CamXucs { get; set; }
    }
}
