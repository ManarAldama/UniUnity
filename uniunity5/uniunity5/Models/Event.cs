using SQLite;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace uniunity5.Models
{
    public class Event
    {
        [PrimaryKey, AutoIncrement]
        public int EventID { get; set; }
        public int ClubID { get; set; }
        public string EventName { get; set; }
        public string EventPlace { get; set; }
        public string EventDate { get; set; }
        public string EventTime { get; set; }
        public string Description { get; set; }
        public string Status { get; set; }
        public string Image { get; set; }

        // Property for ImageSource
        [Ignore] // SQLite doesn't support binding directly to ImageSource
        public ImageSource ImageSource { get; set; }

        [Ignore]
        public virtual ClubManager ClubManager { get; set; }

    }
}
