using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace uniunity5.Models
{
    public class SKS
    {
        [PrimaryKey, AutoIncrement]
        public int SKSID { get; set; }
        public string SKSName { get; set; }
        public string SKSPassword { get; set; }
        public string SKSEmail { get; set; }
        public string SKSPhone { get; set; }
      //  public string Description { get; set; }
      //  public int LeaderID { get; set; }

        // Navigation properties
        //public Student Leader { get; set; }
    }
}
