using uniunity5.Models;

namespace uniunity5.CManagerViews;

public partial class ClubsInfoCM : ContentPage
{
    private Club _club;
    public ClubsInfoCM(Club club)
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
        await Navigation.PopModalAsync();

    }
}