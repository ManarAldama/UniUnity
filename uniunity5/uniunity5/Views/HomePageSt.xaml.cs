
using Microsoft.Extensions.Logging;
using Microsoft.Maui.Controls;
using uniunity5.DataTransactions;
using uniunity5.Models;


namespace uniunity5.Views;

public partial class HomePageSt : ContentPage
{

    public List<Event> ev = new List<Event>();

    private List<Event> filteredEvents = new List<Event>(); // List to hold filtered events




    public HomePageSt()
    {
        InitializeComponent();
        //   var studentId = TransactionManager.Instance.StudentTransaction.GetStudentId();
        var student = TransactionManager.Instance.StudentTransaction.GetStudentById(ids.StudentId); // Assuming you have a method to get the student by ID
        BindingContext = student;
        labelN.SetBinding(Label.TextProperty, "StudentName");



        ev = TransactionManager.Instance.EventTransaction.GetEvents()
                        .Where(e => e.Status == "Posted")
                        .ToList();
        
        foreach (var even in ev)
        {
            // Assuming Image is a base64-encoded string
            byte[] imageData = Convert.FromBase64String(even.Image);
            ImageSource imageSource = ImageSource.FromStream(() => new MemoryStream(imageData));
            even.ImageSource = imageSource;
        }
        ev_li_view.ItemsSource = ev;
        // Assign the list of events to your ListView's ItemsSource

        // Initialize filteredEvents with all events initially
        filteredEvents = ev;
        UpdateCollectionView();

    }

    private void UpdateCollectionView()
    {
        ev_li_view.ItemsSource = null;
        ev_li_view.ItemsSource = filteredEvents;
    }


    public HomePageSt(string dateTime, string location, string message, ImageSource imageSource)
    {
        var closeButton = new Label
        {
            Text = "X",
            FontSize = Device.GetNamedSize(NamedSize.Medium, typeof(Label)),
            HorizontalOptions = LayoutOptions.End,
            VerticalOptions = LayoutOptions.Start,
            Margin = new Thickness(10, 10, 0, 0),
            TextColor = Colors.Black,
            FontAttributes = FontAttributes.Bold
        };

        closeButton.GestureRecognizers.Add(new TapGestureRecognizer
        {
            Command = new Command(async () => await Navigation.PopModalAsync())
        });


        var dateTimeLabel = new Label
        {
            Text = dateTime,
            FontSize = Device.GetNamedSize(NamedSize.Body, typeof(Label)),
            HorizontalOptions = LayoutOptions.Start
        };


        var locationLabel = new Label
        {
            Text = location,
            FontSize = Device.GetNamedSize(NamedSize.Body, typeof(Label)),
            HorizontalOptions = LayoutOptions.Start
        };

        var imageView = new Image
        {
            Source = imageSource,
            HorizontalOptions = LayoutOptions.Center,
            Margin = new Thickness(0, 10)
        };

        var messageLabel = new Label
        {
            Text = message,
            FontSize = Device.GetNamedSize(NamedSize.Body, typeof(Label)),
            HorizontalOptions = LayoutOptions.Start
        };

        var stackLayout = new StackLayout
        {
            Padding = new Thickness(20),
            Spacing = 20,
            Children = { closeButton, imageView, dateTimeLabel, locationLabel, messageLabel }
        };

        Content = stackLayout;
    }



    private async void OnFrameTapped(object sender, EventArgs e)
    {
        // Check if the sender is a Frame
        if (sender is Frame frame)
        {
            // Get the BindingContext of the Frame, which should be the tapped event
            if (frame.BindingContext is Event tappedEvent)
            {
                // Assuming Image is a base64-encoded string
                byte[] imageData = Convert.FromBase64String(tappedEvent.Image);
                ImageSource imageSource = ImageSource.FromStream(() => new MemoryStream(imageData));
                tappedEvent.ImageSource = imageSource;

               
                var message = $"Description: {tappedEvent.Description}";
                var dateTime = $"Date: {tappedEvent.EventDate:dd-MM-yyyy} Time: {tappedEvent.EventTime:hh:mm tt}";

                var location = $"Location: {tappedEvent.EventPlace}";
                var alertPage = new HomePageSt(dateTime, location, message, imageSource);

                await Navigation.PushModalAsync(alertPage);
            }
        }
    }

    private void SearchBar_TextChanged(object sender, TextChangedEventArgs e)
    {

        string searchText = e.NewTextValue.ToLowerInvariant();


        if (string.IsNullOrWhiteSpace(searchText))
        {
            // If the search text is empty, show all events
            filteredEvents = ev;
        }
        else
        {
            // Filter events based on the search text
            filteredEvents = ev.Where(ev =>
                    ev.EventName.ToLowerInvariant().Contains(searchText) ||
                    ev.EventDate.ToLowerInvariant().Contains(searchText)
                ).ToList();
        }

        UpdateCollectionView();
    }

    private void DatePicker_DateSelected(object sender, DateChangedEventArgs e)
    {
        DateTime selectedDate = e.NewDate;

        filteredEvents = ev.Where(ev =>
            DateTime.TryParse(ev.EventDate, out DateTime eventDate) && eventDate.Date == selectedDate.Date
        ).ToList();

        UpdateCollectionView();
    }


}


