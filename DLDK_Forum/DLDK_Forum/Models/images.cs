namespace DLDK_Forum.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("images")]
    public partial class images
    {
       [Key]
        [StringLength(100)]
        public string name { get; set; }

    }
}