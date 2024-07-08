using uniunity5.DataTransactions;
using uniunity5.Models;
using uniunity5.SksViews;

namespace uniunity5;

public partial class Login1 : ContentPage
{
	public static SksTrans sksTrans {  get; set; }
    public List<SKS> stu = new List<SKS>();

    public Login1(SksTrans Skstrans)
	{
		InitializeComponent();
		sksTrans = Skstrans;
	}
    private void OnLoginClicked(object sender, EventArgs e)
    {
        string email = EmailEntry.Text;
        string password = PasswordEntry.Text;
        SKS  sk = new SKS();

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
        bool result = TransactionManager.Instance.SksTransaction.CheckLogin1(email, password);
        if (result)
        {
            stu = TransactionManager.Instance.SksTransaction.GetSKS();

            sk = stu.FirstOrDefault(s => s.SKSEmail == email);
            ids.SksId = sk.SKSID;
            // Navigation.PushAsync(new SksViews.HomePageSks());
            Application.Current.MainPage = new NavigationPage(new SksShell());
        }
        else
        {
            DisplayAlert("Error", "Email or password is incorrect", "OK");
        }
        // Add your login logic here
    }


}