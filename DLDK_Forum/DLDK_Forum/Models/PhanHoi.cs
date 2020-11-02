namespace DLDK_Forum.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PhanHoi")]
    public partial class PhanHoi
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(20)]
        public string Email { get; set; }

        [Required]
        [StringLength(50)]
        public string HoTen { get; set; }

        [Required]
        public string NoiDung { get; set; }

        [Key]
        [Column(Order = 1)]
        public DateTime ThoiGian { get; set; }
    }
}
