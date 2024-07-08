using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using uniunity5.Models;

namespace uniunity5.DataTransactions
{
    public class EventTrans
    {
        public string dbPath;
        private SQLiteConnection conn;

        public EventTrans() { }

        public EventTrans(string _dbPath)
        {
            this.dbPath = _dbPath;
        }

        public void Init()
        {
            conn = new SQLiteConnection(this.dbPath);
            conn.CreateTable<Event>();
        }

        public List<Event> GetEvents()
        {
            Init();
            return conn.Table<Event>().ToList();
        }


        public Event GetEventById(int id)
        {

            Init();
            return conn.Table<Event>().Where(x => x.EventID == id).FirstOrDefault();
        }

    

        public int GetEventId()
        {
            Init();
            var eventt = conn.Table<Event>().FirstOrDefault();
            return eventt?.EventID ?? 0;
        }

        public void AddEvent(Event eventt)
        {
            Init();
            conn.Insert(eventt);
        }


        public void Delete(Event eventt)
        {
            Init();
            conn.Delete(eventt);
        }
        public void DeleteAllEvents()
        {
            Init();
            conn.DeleteAll<Event>();
        }

        public List<Event> GetEventsForClubManager(int clubManagerId)
        {
            Init();
            return conn.Table<Event>().Where(e => e.ClubManager.ClubManagerID == clubManagerId).ToList();
        }

        public void UpdateEvent(Event eventt)
        {
            Init();
            conn.Update(eventt);
        }

    }
}

   
  
