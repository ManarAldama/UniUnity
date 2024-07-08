using uniunity5.DataTransactions;

namespace uniunity5.Views;

public partial class AccountPageSt : ContentPage
{
    private string previousPhoneNumber;
   

    public AccountPageSt()
	{
		InitializeComponent();

        InitializePageAsync();
    }

   


    private void InitializePageAsync()
    {

      //  var studentId = TransactionManager.Instance.StudentTransaction.GetStudentId();
        var student = TransactionManager.Instance.StudentTransaction.GetStudentById(ids.StudentId);

        BindingContext = student;
        nameLabel.SetBinding(Label.TextProperty, "{Binding student.StudentName}");
        emailLabel.SetBinding(Label.TextProperty, "{Binding student.StudentEmail}");
        phoneNumberLabel.SetBinding(Label.TextProperty, "{Binding student.StudentPhone}");
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
        phoneNumberLabel.IsEnabled = true;
        previousPhoneNumber = phoneNumberLabel.Text;
        phoneNumberLabel.Text = string.Empty;
        phoneNumberLabel.Placeholder = previousPhoneNumber;
        changeButton.Text = "Save";
        changeButton.Clicked -= ChangeButton_Clicked;
        changeButton.Clicked += SaveButton_Clicked;
    }



    private void SaveButton_Clicked(object sender, EventArgs e)
    {
        phoneNumberLabel.Text = phoneNumberLabel.Text.Replace(" ", "");
        if (!string.IsNullOrWhiteSpace(phoneNumberLabel.Text) && phoneNumberLabel.Text.Length == 10)
        {
            phoneNumberLabel.Text = FormatPhoneNumber(phoneNumberLabel.Text);
            TransactionManager.Instance.StudentTransaction.UpdateStudentPhoneNumber(ids.StudentId, phoneNumberLabel.Text);





            // Restore the original state of the button and label


            phoneNumberLabel.IsEnabled = false;
            phoneNumberLabel.TextColor = Colors.Black;
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
        phoneNumberLabel.CursorPosition = 2;
    }

    private void PhoneNumberLabel_Unfocused(object sender, FocusEventArgs e)
    {
        if (string.IsNullOrWhiteSpace(phoneNumberLabel.Text))
        {
            phoneNumberLabel.Text = string.Empty;
        }
    }

}