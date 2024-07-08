using uniunity5.Models;

namespace uniunity5.Views;

public partial class ClubsPageSt : ContentPage
{
    public List<Club> clubs = new List<Club>();

    private List<Club> filteredclubs = new List<Club>();



    public ClubsPageSt()
	{
		InitializeComponent();
        RefreshClubs();

    }

    protected override void OnAppearing()
    {
        base.OnAppearing();
        // Refresh the list of clubs whenever the page appears
        RefreshClubs();
    }


    private void RefreshClubs()
    {
        clubs = TransactionManager.Instance.ClubTransaction.GetClubs();

        foreach (var clube in clubs)
        {
            // Assuming Image is a base64-encoded string
            byte[] imageData = Convert.FromBase64String(clube.ImageData);
            ImageSource imageSource = ImageSource.FromStream(() => new MemoryStream(imageData));
            clube.ImageSourceclub = imageSource;
        }

        // Assign the list of events to your ListView's ItemsSource
        Club_view.ItemsSource = clubs;

        filteredclubs= clubs;
        UpdateCollectionView();
    }

    private void UpdateCollectionView()
    {
        Club_view.ItemsSource = null;
        Club_view.ItemsSource = filteredclubs;
    }


    private async void TapGestureRecognizer_Tapped_1(object sender, TappedEventArgs e)
    {
        if (sender is Frame frame)
        {
            // Get the BindingContext of the Frame, which should be the tapped event
            if (frame.BindingContext is Club tappedClub)
            {
                /* // Assuming Image is a base64-encoded string
                 byte[] imageData = Convert.FromBase64String(tappedEvent.Image);
                 ImageSource imageSource = ImageSource.FromStream(() => new MemoryStream(imageData));
                 tappedEvent.ImageSource = imageSource;

                 var title = "Description";
                 var message = tappedEvent.Description;

                 var alertPage = new ClubsPageSks(title, message, imageSource);*/
                await Navigation.PushModalAsync(new Clubinfo(tappedClub));
            }
        }
    }


    private void SearchBar_TextChanged(object sender, TextChangedEventArgs e)
    {

        string searchText = e.NewTextValue.ToLowerInvariant();


        if (string.IsNullOrWhiteSpace(searchText))
        {
            // If the search text is empty, show all events
            filteredclubs = clubs;
        }
        else
        {
            // Filter events based on the search text
            filteredclubs = clubs.Where(ev =>
                 ev.ClubName.ToLowerInvariant().Contains(searchText))
                .ToList();
        }

        UpdateCollectionView();
    }
}