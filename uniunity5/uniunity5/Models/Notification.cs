using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace uniunity5.Models
{
    public class Notification
    {
        [PrimaryKey, AutoIncrement]
        public int NotificationID { get; set; }
        public int StudentID { get; set; }
        public string Message { get; set; }
        public DateTime Time { get; set; }
        public bool ReadStatus { get; set; }

        // Navigation properties
        public virtual Student Student { get; set; }
    }
}
