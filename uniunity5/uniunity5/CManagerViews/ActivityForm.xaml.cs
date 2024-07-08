using System.Xml.Linq;
using uniunity5.DataTransactions;
using uniunity5.Models;
using static Microsoft.Maui.ApplicationModel.Permissions;

namespace uniunity5.CManagerViews;

public partial class ActivityForm : ContentPage
{
    public static EventTrans eventTrans { get; set; }
    public List<Event> ev = new List<Event>();
    string imageDataBase64;
    private Event _currentEvent; // Field to store the current event being edited

    public ActivityForm()
	{
		InitializeComponent();
        RefreshEventList();

    }

    public ActivityForm(Event eventToEdit)
    {
        InitializeComponent();
        RefreshEventList();

        // Set the current event and pre-fill the fields
        _currentEvent = eventToEdit;
        if (_currentEvent != null)
        {
            ActivityEntry.Text = _currentEvent.EventName;
            DateEntry.Text = _currentEvent.EventDate;
            TimeEntry.Text = _currentEvent.EventTime;
            locationEntry.Text = _currentEvent.EventPlace;
            descriptionEntry.Text = _currentEvent.Description;
            imageDataBase64 = _currentEvent.Image;
            // Optionally update the UI with the image if needed
        }
    }

    private async void OnRequestApprovalClicked(object sender, EventArgs e)
    {
        // Validate input data
        if (string.IsNullOrEmpty(ActivityEntry.Text) || string.IsNullOrEmpty(DateEntry.Text) || string.IsNullOrEmpty(TimeEntry.Text) || string.IsNullOrEmpty(locationEntry.Text) || string.IsNullOrEmpty(descriptionEntry.Text) || imageDataBase64 == null)
        {
            await DisplayAlert("Error", "Please fill in all fields", "OK");
            return;
        }


        //   DateTime eventDate = DateTime.TryParse(DateEntry.Text, out DateTime parsedDate) ? parsedDate : DateTime.MinValue;
        //   DateTime eventTime = DateTime.TryParse(TimeEntry.Text, out DateTime parsedTime) ? parsedTime : DateTime.MinValue;

        if (_currentEvent == null)
        {
            // Add a new event
            TransactionManager.Instance.EventTransaction.AddEvent(new Models.Event
            {
                Image = imageDataBase64,
                EventName = ActivityEntry.Text,
                EventDate = DateEntry.Text,
                EventTime = TimeEntry.Text,
                EventPlace = locationEntry.Text,
                Description = descriptionEntry.Text
            });
        }

        else
        {
            // Update the existing event
            _currentEvent.Image = imageDataBase64;
            _currentEvent.EventName = ActivityEntry.Text;
            _currentEvent.EventDate = DateEntry.Text;
            _currentEvent.EventTime = TimeEntry.Text;
            _currentEvent.EventPlace = locationEntry.Text;
            _currentEvent.Description = descriptionEntry.Text;
            
            TransactionManager.Instance.EventTransaction.UpdateEvent(_currentEvent);
        }

            RefreshEventList();


        await DisplayAlert("Success", "Request sent successfully!", "OK");

        MessagingCenter.Send(this, "EventAdded"); // Send message after adding event

        // Clear the fields after sending the request
        ActivityEntry.Text = string.Empty;
        DateEntry.Text = string.Empty;
        TimeEntry.Text = string.Empty;
        locationEntry.Text = string.Empty;
        descriptionEntry.Text = string.Empty;
        imageDataBase64 = null;
    }

    public void RefreshEventList()
    {
        // Retrieve the updated list of events from the data source
        activityform_view.ItemsSource = null;

        // Update the ItemsSource of the ListView
        activityform_view.ItemsSource = ev;
    }


    private async void ArrowImage_Tapped(object sender, EventArgs e)
    {
        await Navigation.PopModalAsync();
    }
    private async void UploadFrame_Tapped(object sender, EventArgs e)
    {
        // Placeholder logic for upload process
        uploadposterLabel.Text = "Uploading...";
        uploadIcon.IsEnabled = false;

        // Simulate upload process (Replace this with your actual upload logic)
        await Task.Delay(100); // Simulating 2 seconds delay for upload


        FileResult fileResult = await FilePicker.PickAsync(new PickOptions
        {
            FileTypes = FilePickerFileType.Images,
        });


        if (fileResult != null)
        {
            // Read the selected image data into a byte array
            Stream stream = await fileResult.OpenReadAsync();
            using (MemoryStream ms = new MemoryStream())
            {
                stream.CopyTo(ms);
                byte[] imageData = ms.ToArray();

                // Convert byte array to base64 string
                imageDataBase64 = Convert.ToBase64String(imageData);

            }

            // Update the UI or perform any necessary tasks with the selected image
            uploadposterLabel.Text = "Image uploaded successfully";
            uploadIcon.IsEnabled = true;

        }
    }

    
}