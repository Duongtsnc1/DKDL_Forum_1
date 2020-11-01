namespace DLDK_Forum.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("BinhLuan")]
    public partial class BinhLuan
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(50)]
        public string Email { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(20)]
        public string MaBaiViet { get; set; }

        [Key]
        [Column(Order = 2)]
        public DateTime ThoiGian { get; set; }

        [Column(TypeName = "ntext")]
        [Required]
        public string NoiDung { get; set; }

        public virtual BaiViet BaiViet { get; set; }

        public virtual NguoiDung NguoiDung { get; set; }
    }
}
