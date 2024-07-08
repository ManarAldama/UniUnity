using System.Xml;
using uniunity5.DataTransactions;

namespace uniunity5.CManagerViews;

public partial class AccountPageCManager : ContentPage
{
    private string previousPhoneNumber;

    public AccountPageCManager()
	{
		InitializeComponent();
        InitializePageAsync();


    }

    private void InitializePageAsync()
    {

        var clubmanager = TransactionManager.Instance.ClubManagerTransaction.GetClubManagerById(ids.ClubManagerId);
     //   var club = TransactionManager.Instance.ClubTransaction.GetClubById(ids.ClubId);
      
        BindingContext = clubmanager;
        nameLabelcm.SetBinding(Label.TextProperty, "{Binding clubmanager.ClubManagerName}");
        emailLabelcm.SetBinding(Label.TextProperty, "{Binding clubmanager.ClubManagerEmail}");
        phoneNumberLabelcm.SetBinding(Label.TextProperty, "{Binding clubmanager.ClubManagerPhone}");

    //    BindingContext = club;
        clubnamelabel.SetBinding(Label.TextProperty, "{Binding ClubName}");
        emailLabelClub.SetBinding(Label.TextProperty, "{Binding ClubEmail}");
    }



    private async void LogOutButton_Clicked(object sender, EventArgs e)
    {
        if (await DisplayAlert("Are you sure?", "You will be logged out.", "Yes", "No"))
        {
            SecureStorage.Remove("ids.StudentId");
            // Pop all pages until there are no more pages left
            Preferences.Clear();
            Application.Current.MainPage = new NavigationPage(new LoginType());

        }
        //  await Navigation.PushAsync(new LoginType());
        //  await Shell.Current.GoToAsync("LoginType");   
    }

    private void ChangeButton_Clicked(object sender, EventArgs e)
    {
        phoneNumberLabelcm.IsEnabled = true;
        previousPhoneNumber = phoneNumberLabelcm.Text;
        phoneNumberLabelcm.Text = string.Empty;
        phoneNumberLabelcm.Placeholder = previousPhoneNumber;
        changeButton.Text = "Save";
        changeButton.Clicked -= ChangeButton_Clicked;
        changeButton.Clicked += SaveButton_Clicked;
    }



    private void SaveButton_Clicked(object sender, EventArgs e)
    {
        phoneNumberLabelcm.Text = phoneNumberLabelcm.Text.Replace(" ", "");
        if (!string.IsNullOrWhiteSpace(phoneNumberLabelcm.Text) && phoneNumberLabelcm.Text.Length == 10)
        {
            phoneNumberLabelcm.Text = FormatPhoneNumber(phoneNumberLabelcm.Text);

            TransactionManager.Instance.ClubManagerTransaction.UpdateclubmanagertPhoneNumber(ids.ClubId, phoneNumberLabelcm.Text);


            phoneNumberLabelcm.IsEnabled = false;
            phoneNumberLabelcm.TextColor = Colors.Black;
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
        phoneNumberLabelcm.CursorPosition = 2;
    }

    private void PhoneNumberLabel_Unfocused(object sender, FocusEventArgs e)
    {
        if (string.IsNullOrWhiteSpace(phoneNumberLabelcm.Text))
        {
            phoneNumberLabelcm.Text = string.Empty;
        }
    }
}

