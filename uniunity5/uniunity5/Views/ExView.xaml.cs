using uniunity5.DataTransactions;
using uniunity5.Models;

namespace uniunity5.Views;

public partial class ExView : ContentPage
{
    public static StudentTrans studentTrans { get; set; }
    public List<Student> stu = new List<Student>();
    public ExView()
	{
		InitializeComponent();
        Studentlist.ItemsSource = stu;
    }

    private void Button_Clicked(object sender, EventArgs e)

    {
        if (Name.Text != null && Email.Text != null && Password.Text != null && Phone.Text != null)
        {


            TransactionManager.Instance.StudentTransaction.AddStudent(new Models.Student
            {
                StudentName = Name.Text,
                StudentEmail = Email.Text,

                StudentPassword = Password.Text,
                StudentPhone = Phone.Text


            });


        }

        else
        {
            DisplayAlert("error", "error", "ok");
        }
        stu = TransactionManager.Instance.StudentTransaction.GetStudents();
        Studentlist.ItemsSource = null;
        Studentlist.ItemsSource = stu;


    }

    private void Button_Clicked_1(object sender, EventArgs e)
    {
        TransactionManager.Instance.StudentTransaction.DeleteAllStudents();
        stu = TransactionManager.Instance.StudentTransaction.GetStudents();
        Studentlist.ItemsSource = null;
        Studentlist.ItemsSource = stu;

    }

    private async void Studentlist_ItemTapped(object sender, ItemTappedEventArgs e)
    {
        var s = e.Item as Student;
        await DisplayAlert("selected student", "name " + s.StudentName, "ok");

    }
}


