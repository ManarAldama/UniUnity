using uniunity5.DataTransactions;

namespace uniunity5;

public partial class LoginType : ContentPage
{
	public LoginType()
	{
		InitializeComponent();
	}

    private async void StudentBtn_Clicked(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new Login(TransactionManager.Instance.StudentTransaction));
    }

    private async void ClubManagerBtn_Clicked(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new ClubManagerLogin(TransactionManager.Instance.ClubManagerTransaction));
    }

    private async void SksAdminBtn_Clicked(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new Login1(TransactionManager.Instance.SksTransaction));
    }
}