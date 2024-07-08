using uniunity5.Models;

namespace uniunity5.SksViews;

public partial class ClubInfosks : ContentPage
{
    private Club _club;

    public ClubInfosks(Club club)
    {
        InitializeComponent();
        _club = club;
        InitializePageAsync();

    }

    private void InitializePageAsync()
    {
        BindingContext = _club;

       // var club = TransactionManager.Instance.ClubTransaction.GetClubById(ids.ClubId);

     //   BindingContext = club;
     //   clubNameLabel.SetBinding(Label.TextProperty, "{Binding ClubName}");
       
           
        byte[] imageData = Convert.FromBase64String(_club.ImageData);
        ImageSource imageSource = ImageSource.FromStream(() => new MemoryStream(imageData));
        logo1.Source = imageSource;

        clubNameLabel.Text = _club.ClubName;
        emailLabel.Text = _club.ClubEmail;
        label1.Text = _club.ClubName;
        label2.Text = _club.Description;

    }
    private async void OnButtonClicked1(object sender, EventArgs e)
    {
        await Navigation.PopAsync();
    }

    private async void Button_Clicked(object sender, EventArgs e)
    {
        Button button = (Button)sender;

        bool result = await DisplayAlert("⚠️ Warning",
                                         "Are you sure you want to delete this Club?",
                                         "Delete", "Cancel");
        if (result)
        {
            TransactionManager.Instance.ClubTransaction.DeleteClub(_club);
            //    await Navigation.PushAsync(new ClubsPageSks());
            await Navigation.PopAsync();

            // await Navigation.PopAsync();
            //  new NavigationPage(new ClubsPageSks());



        }
        else
        {
            
        }

       
    }
}