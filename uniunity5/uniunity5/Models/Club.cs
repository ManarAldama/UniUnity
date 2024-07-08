using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace uniunity5.Models
{
    public class Club
    {
       [PrimaryKey, AutoIncrement]
        public int ClubID { get; set; }
        public string ClubName { get; set; }
        public string ClubEmail { get; set; }
        public string Category { get; set; }
        public string ManagerName { get; set; }
        public string Description { get; set; }
        public string ImageData { get; set; } 

        public int ManagerID { get; set; }

        [Ignore] // SQLite doesn't support binding directly to ImageSource
        public ImageSource ImageSourceclub { get; set; }

        [Ignore]
        public virtual ClubManager Manager { get; set; }

        [Ignore]
        public virtual ICollection<Event> Events { get; set; }
    }
}
