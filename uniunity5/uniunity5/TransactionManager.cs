using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using uniunity5.DataTransactions;

namespace uniunity5
{
    public class TransactionManager
    {
        private static TransactionManager instance;
        public StudentTrans StudentTransaction { get; private set; }
        public SksTrans SksTransaction { get; private set; }
        public ClubManagerTrans ClubManagerTransaction { get; private set; }
        public EventTrans EventTransaction { get; private set; }
        public ClubTrans ClubTransaction { get; private set; }

        private TransactionManager() { }

        public static TransactionManager Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new TransactionManager();
                }
                return instance;
            }
        }

        public void InitializeTransactions(StudentTrans studentTrans, SksTrans sksTrans, ClubManagerTrans clubManagerTrans, EventTrans eventTrans, ClubTrans clubTrans)
        {
            StudentTransaction = studentTrans;
            SksTransaction = sksTrans;
            ClubManagerTransaction = clubManagerTrans;
            EventTransaction = eventTrans;
            ClubTransaction = clubTrans;
        }
    }
}
