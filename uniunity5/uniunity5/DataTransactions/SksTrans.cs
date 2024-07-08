using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using uniunity5.Models;

namespace uniunity5.DataTransactions
{
    public class SksTrans
    {
        public string dbPath;
        private SQLiteConnection conn;

        public SksTrans() { }
        public SksTrans(string _dbPath)
        {
            this.dbPath = _dbPath;

        }
        public void Init()
        {
            conn = new SQLiteConnection(this.dbPath);
            conn.CreateTable<SKS>();
        }
        public List<SKS> GetSKS()
        {
            Init();
            return conn.Table<SKS>().ToList();
        }

        public SKS GetsksById(int id)
        {

            Init();
            return conn.Table<SKS>().FirstOrDefault(x => x.SKSID == id);
        }


        public int GetsksId()
        {
            Init();
            var sks = conn.Table<SKS>().FirstOrDefault();
            return sks?.SKSID ?? 0;
        }

        public void AddSks(SKS sks)
        {
            Init();
            conn.Insert(sks);
        }

        public void DeleteSks(SKS sks)
        {
            Init();
            conn.Delete(sks);

        }

        public void DeleteAllsks()
        {
            Init(); // Initialize your database connection

            // Execute a bulk delete operation to remove all records from the Student table
            conn.DeleteAll<SKS>();
        }

        public bool CheckLogin1(String email, string password)
        {
            Init();
            bool result = false;
            var sks = conn.Table<SKS>().FirstOrDefault(sks => sks.SKSEmail == email);
            if (sks != null)
            {
                if (sks.SKSPassword == password)
                {
                    // Passwords match, login successful
                    result = true;
                }
            }

            return result;
        }

        public void UpdatesksPhoneNumber(int sksid, string newPhoneNumber)
        {
            Init();

            // Retrieve the student from the database using the provided student ID
            var sKS = conn.Table<SKS>().FirstOrDefault(s => s.SKSID == sksid);

            if (sKS != null)
            {
                // Update the phone number of the retrieved student object
                sKS.SKSPhone = newPhoneNumber;

                // Use the Update method of the SQLite connection to update the student object in the database
                conn.Update(sKS);
            }


        }

    }
}

