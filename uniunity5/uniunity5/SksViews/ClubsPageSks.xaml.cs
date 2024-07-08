using uniunity5.Models;
using static System.Reflection.Metadata.BlobBuilder;

namespace uniunity5.SksViews;

public partial class ClubsPageSks : ContentPage
{
    public List<Club> clubs = new List<Club>();

    private List<Club> filteredclubs = new List<Club>();



    public ClubsPageSks()
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

        filteredclubs = clubs;
        UpdateCollectionView();
    }


    private void UpdateCollectionView()
    {
        Club_view.ItemsSource = null;
        Club_view.ItemsSource = filteredclubs;
    }

    private async void Button_Clicked(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new AddClub());

    }

   



    private async void Club_view_ItemTapped(object sender, ItemTappedEventArgs e)
    {
        /* if (sender is Frame frame)
         {
             // Get the BindingContext of the Frame, which should be the tapped event
             if (frame.BindingContext is Club tappedClub)
             {

                 await Navigation.PushAsync(new ClubInfosks(tappedClub));
             }
         }*/
        var clubs = (Club)e.Item;
        var action = await DisplayActionSheet("Action", "Cancel", null, "Edit", "Delete");

        switch (action)
        {
            case "Edit":

                await Navigation.PushAsync(new AddClub(clubs));
                break;

            case "Delete":

                TransactionManager.Instance.ClubTransaction.DeleteClub(clubs);
                RefreshClubs();
                MessagingCenter.Send(this, "clubUpdated");
                break;
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