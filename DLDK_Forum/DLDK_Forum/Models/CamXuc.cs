namespace DLDK_Forum.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CamXuc")]
    public partial class CamXuc
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(50)]
        public string Email { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(20)]
        public string MaBaiViet { get; set; }

        public int Thich { get; set; }

        public virtual BaiViet BaiViet { get; set; }

        public virtual NguoiDung NguoiDung { get; set; }
    }
}
