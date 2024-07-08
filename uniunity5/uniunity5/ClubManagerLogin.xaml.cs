using uniunity5.CManagerViews;
using uniunity5.DataTransactions;
using uniunity5.Models;

namespace uniunity5;

public partial class ClubManagerLogin : ContentPage
{
	public static ClubManagerTrans clubManagerTrans { get; set; }
    public List<ClubManager> stu = new List<ClubManager>();

    public ClubManagerLogin(ClubManagerTrans ClubManagerTrans)
	{
		InitializeComponent();

		clubManagerTrans = ClubManagerTrans;

    }

    private void OnLoginClicked(object sender, EventArgs e)
    {
        string email = EmailEntry.Text;
        string password = PasswordEntry.Text;
        ClubManager clubManager = new ClubManager();

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
        bool result = TransactionManager.Instance.ClubManagerTransaction.CheckLogin1(email, password);
        if (result)
        {
            stu = TransactionManager.Instance.ClubManagerTransaction.GetClubManager();

            clubManager = stu.FirstOrDefault(s => s.ClubManagerEmail == email);
            ids.ClubManagerId = clubManager.ClubManagerID;
            // Navigation.PushAsync(new CManagerViews.HomePageCManager());
            Application.Current.MainPage = new NavigationPage(new CMShell());
        }
        else
        {
            DisplayAlert("Error", "Email or password is incorrect", "OK");
        }
       
    }
}