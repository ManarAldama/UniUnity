using uniunity5.DataTransactions;
using uniunity5.Models;

namespace uniunity5;

public partial class Login : ContentPage
{  
    public static StudentTrans studentTrans {  get; set; }
    public List<Student> stu = new List<Student>();

    public Login(StudentTrans studenttrans)
	{
		InitializeComponent();
        studentTrans = studenttrans;
	}

    private  void OnLoginClicked(object sender, EventArgs e)
    {
        string email = EmailEntry.Text;
        string password = PasswordEntry.Text;
        Student st = new Student();

        // Basic validation - check if email and password are not empty
        if (string.IsNullOrWhiteSpace(email) || string.IsNullOrWhiteSpace(password))
        {
            DisplayAlert("Error", "Please enter both email and password.", "OK");
            return;
        }
        if (!email.Contains('@'))
        {
            DisplayAlert("Error", "Please enter a valid email address.", "OK");
            return;

        }
        bool result = TransactionManager.Instance.StudentTransaction.CheckLogin(email, password);
        if (result)
        {
            stu = TransactionManager.Instance.StudentTransaction.GetStudents();

            st = stu.FirstOrDefault(s => s.StudentEmail == email);
            ids.StudentId = st.StudentID;
            // DisplayAlert("Error", "Email or password is incorrect"+ , "OK");

            // Navigation.PushAsync(new AppShell());
            Application.Current.MainPage = new NavigationPage(new AppShell());
        }
        else
        {
            DisplayAlert("Error", "Email or password is incorrect", "OK");
        }
        // Add your login logic here
    }




}