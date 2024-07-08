using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using uniunity5.Models;


namespace uniunity5.DataTransactions
{
    public class StudentTrans
    {
        public string dbPath;
        private SQLiteConnection conn;

        public StudentTrans() { }

        public StudentTrans(string _dbPath)
        {
            this.dbPath = _dbPath;

        }

        public void Init()
        {
            conn = new SQLiteConnection(this.dbPath);
            conn.CreateTable<Student>();
        }

        public List<Student> GetStudents()
        {
            Init();
            return conn.Table<Student>().ToList();
        }

        public Student GetStudentById(int id)
        {

            Init();
            return conn.Table<Student>().FirstOrDefault(s => s.StudentID == id);
        }

        public Student GetStudentByEmail(string email)
        {
            Init();
            return conn.Table<Student>().Where(s => s.StudentEmail == email).FirstOrDefault();

        }


        public int GetStudentId()
        {
            Init();
            var student = conn.Table<Student>().FirstOrDefault();
            return student?.StudentID ?? 0;
        }

        public void AddStudent(Student student)
        {
            Init();
            conn.Insert(student);
        }
        public void DeleteAllStudents()
        {
            Init(); // Initialize your database connection

            // Execute a bulk delete operation to remove all records from the Student table
            conn.DeleteAll<Student>();
        }

        //  public async Task AddStudentProgrammaticallyAsync(Student student)
        // {
        //  await conn.InsertAsync(student);
        /// }

        public void UpdateStudent(Student student)
        {
            Init();
            conn.Update(student);
        }

        public void DeleteStudent(Student student)
        {
            Init();
            conn.Delete(student);

        }

        public bool CheckLogin(String email, string password)
        {
            Init();
            bool result = false;
            var student = conn.Table<Student>().FirstOrDefault(s => s.StudentEmail == email);
            if (student != null)
            {
                if (student.StudentPassword == password)
                {
                    // Passwords match, login successful
                    result = true;
                }
            }

            return result;
        }

        public void UpdateStudentPhoneNumber(int studentId, string newPhoneNumber)
        {
            Init();

            // Retrieve the student from the database using the provided student ID
            var student = conn.Table<Student>().FirstOrDefault(s => s.StudentID == studentId);

            if (student != null)
            {
                // Update the phone number of the retrieved student object
                student.StudentPhone = newPhoneNumber;

                // Use the Update method of the SQLite connection to update the student object in the database
                conn.Update(student);
            }


        }
    }
}