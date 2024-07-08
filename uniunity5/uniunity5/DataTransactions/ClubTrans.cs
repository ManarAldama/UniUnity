using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using uniunity5.Models;


namespace uniunity5.DataTransactions
{
    public class ClubTrans
    {
        public string dbPath;
        private SQLiteConnection conn;

        public ClubTrans() { }
        public ClubTrans(string _dbPath)
        {
            this.dbPath = _dbPath;
        }


        public void Init()
        {
            conn = new SQLiteConnection(this.dbPath);
            conn.CreateTable<Club>();
        }

        public List<Club> GetClubs()
        {
            Init();
            return conn.Table<Club>().ToList();
        }

        public Club GetClubById(int id)
        {

            Init();
            return conn.Table<Club>().FirstOrDefault(s => s.ClubID == id);

        }

        public Club GetClubByEmail(string clubEmail)
        {
            Init();
            return conn.Table<Club>().FirstOrDefault(c => c.ClubEmail == clubEmail);
        }


        public int GetClubId()
        {
            Init();
            var club = conn.Table<Club>().FirstOrDefault();
            return club?.ClubID ?? 0;
        }


        public void AddClub(Club club)
        {
            Init();
            conn.Insert(club);
        }
        public void DeleteAllClubs()
        {
            Init(); 
            conn.DeleteAll<Club>();
        }

        public void DeleteClub(Club club)
        {
            Init();
            conn.Delete(new Club { ClubID = club.ClubID });

        }


        public void UpdateClub(Club club)
        {
            Init();
            conn.Update(club);
        }

        
    }
}
