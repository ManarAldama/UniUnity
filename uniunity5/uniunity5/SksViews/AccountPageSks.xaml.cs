using System.Xml;
using uniunity5.DataTransactions;

namespace uniunity5.SksViews;

public partial class AccountPageSks : ContentPage
{
    private string previousPhoneNumber;

    public AccountPageSks()
	{
		InitializeComponent();

        InitializePageAsync();

    }

    private void InitializePageAsync()
    {

        var sks = TransactionManager.Instance.SksTransaction.GetsksById(ids.SksId); 

        BindingContext = sks;
        nameLabelsks.SetBinding(Label.TextProperty, "{Binding sks.SKSName}");
        emailLabelsks.SetBinding(Label.TextProperty, "{Binding sks.SKSEmail}");
        phoneNumberLabelsks.SetBinding(Label.TextProperty, "{Binding sks.SKSPhone}");
    }

    private async void LogOutButton_Clicked(object sender, EventArgs e)
    {
        if (await DisplayAlert("Are you sure?", "You will be logged out.", "Yes", "No"))
        {

            SecureStorage.Remove("ids.SksId");
            // Pop all pages until there are no more pages left
            Preferences.Clear();

            Application.Current.MainPage = new NavigationPage(new LoginType());
        }
    }

    private void ChangeButton_Clicked(object sender, EventArgs e)
    {
        phoneNumberLabelsks.IsEnabled = true;
        previousPhoneNumber = phoneNumberLabelsks.Text;
        phoneNumberLabelsks.Text = string.Empty;
        phoneNumberLabelsks.Placeholder = previousPhoneNumber;
        changeButton.Text = "Save";
        changeButton.Clicked -= ChangeButton_Clicked;
        changeButton.Clicked += SaveButton_Clicked;
    }



    private void SaveButton_Clicked(object sender, EventArgs e)
    {
        phoneNumberLabelsks.Text = phoneNumberLabelsks.Text.Replace(" ", "");
        if (!string.IsNullOrWhiteSpace(phoneNumberLabelsks.Text) && phoneNumberLabelsks.Text.Length == 10)
        {
            phoneNumberLabelsks.Text = FormatPhoneNumber(phoneNumberLabelsks.Text);

            TransactionManager.Instance.SksTransaction.UpdatesksPhoneNumber(ids.SksId, phoneNumberLabelsks.Text);


            phoneNumberLabelsks.IsEnabled = false;
            phoneNumberLabelsks.TextColor = Colors.Black;
            changeButton.Text = "Change";
            changeButton.Clicked -= SaveButton_Clicked;
            changeButton.Clicked += ChangeButton_Clicked;
        }
        else
        {
            DisplayAlert("Error", "Please enter a valid 10-digit phone number.", "OK");
        }
    }


    private static string FormatPhoneNumber(string phoneNumber)
    {
        return string.Format("({0}) {1} {2}",
            phoneNumber.Substring(0, 3),
            phoneNumber.Substring(3, 3),
            phoneNumber.Substring(6, 4));
    }


    private void PhoneNumberLabel_Focused(object sender, FocusEventArgs e)
    {
        phoneNumberLabelsks.CursorPosition = 2;
    }

    private void PhoneNumberLabel_Unfocused(object sender, FocusEventArgs e)
    {
        if (string.IsNullOrWhiteSpace(phoneNumberLabelsks.Text))
        {
            phoneNumberLabelsks.Text = string.Empty;
        }
    }
}