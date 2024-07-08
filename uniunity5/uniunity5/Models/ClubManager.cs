using SQLite;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace uniunity5.Models
{
    public class ClubManager
    {
        [PrimaryKey,AutoIncrement]
        public int ClubManagerID { get; set; }
        public string ClubManagerName { get; set; }
        public string ClubManagerPassword { get; set; }
        public string ClubManagerEmail { get; set; }

        public string ClubName { get; set; }

        public string ClubEmail { get; set; }

        public string ClubManagerPhone { get; set; }

        [Ignore]
        public virtual Event eventss { get; set; }


    }
   
}
