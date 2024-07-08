using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace uniunity5.Models
{
    [Table("Student")]
    public class Student
    {
        [PrimaryKey]
        [AutoIncrement]
        
        public int StudentID { get; set; }


        public string StudentName { get; set; }


       
        public string StudentPassword { get; set; }


      
        public string StudentEmail { get; set; }




        public string StudentPhone { get; set; }




    }
}