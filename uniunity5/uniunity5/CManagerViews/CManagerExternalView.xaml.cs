using uniunity5.DataTransactions;
using uniunity5.Models;
namespace uniunity5.CManagerViews;

public partial class CManagerExternalView : ContentPage
{
    public static ClubManagerTrans clubManagerTrans { get; set; }
    public List<ClubManager> clubManagers = new List<ClubManager>();
    public CManagerExternalView()
	{
		InitializeComponent();
        clubmanagerlist.ItemsSource = clubManagers;

    }

    private void Button_Clicked(object sender, EventArgs e)

    {
        if (string.IsNullOrEmpty(Name.Text) || string.IsNullOrEmpty(Email.Text) ||
            string.IsNullOrEmpty(clubname.Text) || string.IsNullOrEmpty(clubEmail.Text) ||
            string.IsNullOrEmpty(Password.Text) || string.IsNullOrEmpty(Phone.Text))
        {
            DisplayAlert("Error", "Please fill in all fields", "OK");
            return;
        }


        var clubManager = new ClubManager
        {
                ClubManagerName = Name.Text,
                ClubManagerEmail = Email.Text,
                ClubEmail = clubEmail.Text,
                ClubName = clubname.Text ,
                ClubManagerPassword = Password.Text,
                ClubManagerPhone = Phone.Text
        };


        TransactionManager.Instance.ClubManagerTransaction.AddClubManager(clubManager);
        clubManagers = TransactionManager.Instance.ClubManagerTransaction.GetClubManager();
        clubmanagerlist.ItemsSource = null;
        clubmanagerlist.ItemsSource = clubManagers;

    }
    private void Button_Clicked_1(object sender, EventArgs e)
    {
        TransactionManager.Instance.ClubManagerTransaction.DeleteAllClubManagers();
        clubManagers = TransactionManager.Instance.ClubManagerTransaction.GetClubManager();
        clubmanagerlist.ItemsSource = null;
        clubmanagerlist.ItemsSource = clubManagers;

    }

    private async void clubmanagerlist_ItemTapped(object sender, ItemTappedEventArgs e)
    {
        var s = e.Item as ClubManager;
        await DisplayAlert("selected student", "name " + s.ClubManagerName, "ok");

    }
}