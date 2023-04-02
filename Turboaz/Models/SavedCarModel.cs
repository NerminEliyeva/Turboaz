using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;

namespace Turboaz.Models
{
    public class SavedCarModel
    {
        public int MarkId { get; set; }
        public int ModelId { get; set; }
        public int Price { get; set; }
        public string ImagePath { get; set; }
        public DateTime DateTime { get; set; }
        public int Status { get; set; }
    }
}