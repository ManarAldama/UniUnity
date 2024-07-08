using uniunity5.DataTransactions;
using uniunity5.Models;
namespace uniunity5.CManagerViews;

public partial class MyClub : ContentPage
{
    public List<Event> ev = new List<Event>();
    public MyClub()
    {

        InitializeComponent();
        InitializePageAsync();


    }

    protected override void OnAppearing()
    {
        base.OnAppearing();

        // Refresh the event list whenever the page appears
        InitializePageAsync();
    }

    private void InitializePageAsync()
    {

        var currentClubManager = TransactionManager.Instance.ClubManagerTransaction.GetClubManagerById(ids.ClubManagerId);
        BindingContext = currentClubManager;
        ClubNamelabel.SetBinding(Label.TextProperty, "ClubName");

        if (currentClubManager != null)
        { 

             ev = TransactionManager.Instance.EventTransaction.GetEvents();
           //  ev = TransactionManager.Instance.EventTransaction.GetEvents().Where(e => e.ClubManager != null && e.ClubManager.ClubManagerID == currentClubManager.ClubManagerID).ToList();


          // Populate ImageSource for each event
          foreach (var clubEvent in ev)
          {
            byte[] eventImageData = Convert.FromBase64String(clubEvent.Image);
            ImageSource eventImageSource = ImageSource.FromStream(() => new MemoryStream(eventImageData));
            clubEvent.ImageSource = eventImageSource;
          }

         // Set the ItemsSource of the ListView
        myClub_view.ItemsSource = ev;

        }


        else
        {
            DisplayAlert("Error", "An unexpected error occurred. Please try again later.", "OK");


        }
    }

   
    private void BellImage_Tapped(object sender, EventArgs e)
    {
        // Handle arrow image tap/click here
    }

    private async void myClub_view_ItemTapped(object sender, ItemTappedEventArgs e)
    {
        var events = (Event)e.Item;
        var action = await DisplayActionSheet("Action", "Cancel", null, "Edit", "Delete", "Post");

        switch (action)
        {
            case "Edit":

                await Navigation.PushModalAsync(new ActivityForm(events));
                break; 

            case "Delete":

                TransactionManager.Instance.EventTransaction.Delete(events);
                InitializePageAsync();
                MessagingCenter.Send(this, "EventUpdated");
                break;

            case "Post":
                events.Status = "Posted";
               await Navigation.PushAsync(new Post(events));
                InitializePageAsync();
                MessagingCenter.Send(this, "EventUpdated");
                break;



        }


    }

    private async void Button_Clicked(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new ActivityForm());
        InitializePageAsync();
        


    }
}