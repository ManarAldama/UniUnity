using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using uniunity5.Models;

namespace uniunity5.DataTransactions
{
   public class ClubManagerTrans
    {
        public string dbPath;
        private SQLiteConnection conn;

        public ClubManagerTrans() { }
        public ClubManagerTrans(string _dbPath)
        {
            this.dbPath = _dbPath;

        }
        public void Init()
        {
            conn = new SQLiteConnection(this.dbPath);
            conn.CreateTable<ClubManager>();
        }
        public List<ClubManager> GetClubManager()
        {
            Init();
            return conn.Table<ClubManager>().ToList();
        }

        public ClubManager GetClubManagerById(int id)
        {

            Init();
            return conn.Table<ClubManager>().FirstOrDefault(s => s.ClubManagerID == id);
        }


        public int GetClubManagerId()
        {
            Init();
            var clubmanager = conn.Table<ClubManager>().FirstOrDefault();
            return clubmanager?.ClubManagerID ?? 0;
        }


        public void AddClubManager(ClubManager clubManager)
        {
            Init();        
            conn.Insert(clubManager);

        }
        public void DeleteAllClubManagers()
        {
            Init(); // Initialize your database connection

            // Execute a bulk delete operation to remove all records from the Student table
            conn.DeleteAll<ClubManager>();
        }

        public void DeleteClubManager(ClubManager clubManager)
        {
            Init();
            conn.Delete(clubManager);
        }

        public bool CheckLogin1(String email, string password)
        {
            Init();
            bool result = false;
            var cm = conn.Table<ClubManager>().FirstOrDefault(cm => cm.ClubManagerEmail == email);
            if (cm != null)
            {
                if (cm.ClubManagerPassword == password)
                {
                    // Passwords match, login successful
                    result = true;
                }
            }

            return result;
        }

        public void UpdateclubmanagertPhoneNumber(int clubmanagertId, string newPhoneNumber)
        {
            Init();

            // Retrieve the student from the database using the provided student ID
            var cm = conn.Table<ClubManager>().FirstOrDefault(s => s.ClubManagerID == clubmanagertId);

            if (cm != null)
            {
                // Update the phone number of the retrieved student object
                cm.ClubManagerPhone = newPhoneNumber;

                // Use the Update method of the SQLite connection to update the student object in the database
                conn.Update(cm);
            }


        }

    }
}
