using uniunity5.DataTransactions;
using uniunity5.Models;


namespace uniunity5.SksViews;

public partial class AddClub : ContentPage
{

    public static ClubTrans clubTrans { get; set; }
    public List<Club> Clubs = new List<Club>();
    string imageDataBase64;
    private Club _currentClub;
    public AddClub()
    {
        InitializeComponent();
        ClubList_view.ItemsSource = Clubs;



    }

    public AddClub(Club clubtoedit)
    {
        InitializeComponent();
        ClubList_view.ItemsSource = Clubs;

        _currentClub = clubtoedit;
        if(_currentClub != null)
        {
            ClubNameEntry.Text = _currentClub.ClubName;
            managerNameEntry.Text = _currentClub.ManagerName;
            clubEmailEntry.Text = _currentClub.ClubEmail;
            descriptionEntry.Text = _currentClub.Description;
            imageDataBase64 = _currentClub.ImageData;

        }

    }



    private async void OnCreateClicked(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(ClubNameEntry.Text) || string.IsNullOrEmpty(managerNameEntry.Text) || string.IsNullOrEmpty(clubEmailEntry.Text) || string.IsNullOrEmpty(descriptionEntry.Text) || imageDataBase64 == null)
        {
            await DisplayAlert("Error", "Please fill in all fields", "OK");
            return;
        }

        if (_currentClub == null)
        {
            TransactionManager.Instance.ClubTransaction.AddClub(new Models.Club
            {
                ImageData = imageDataBase64,
                ClubName = ClubNameEntry.Text,
                ManagerName = managerNameEntry.Text,
                ClubEmail = clubEmailEntry.Text,
                Description = descriptionEntry.Text,
            });
        }
        // Create a Club object with the retrieved data
        else
        {
            _currentClub.ImageData = imageDataBase64;
            _currentClub.ClubName = ClubNameEntry.Text;
            _currentClub.ManagerName = managerNameEntry.Text;
            _currentClub.ClubEmail = clubEmailEntry.Text;
            _currentClub.Description = descriptionEntry.Text;

            TransactionManager.Instance.ClubTransaction.UpdateClub(_currentClub);

        }

         RefreshClubList();

        await DisplayAlert("Success", "Club created successfully!", "OK");
        MessagingCenter.Send(this, "clubadded");
        imageDataBase64 = null ;
        ClubNameEntry.Text = string.Empty;
        managerNameEntry.Text = string.Empty;
        clubEmailEntry.Text = string.Empty;
        descriptionEntry.Text = string.Empty;
        

    }

    private  void  RefreshClubList()
    {

        // Update the ItemsSource of the ListView
        ClubList_view.ItemsSource = null;
        ClubList_view.ItemsSource = Clubs;
    }


    private async void UploadFrame_Tapped(object sender, EventArgs e)
    {

        // Placeholder logic for upload process
        uploadStatusLabel.Text = "Uploading...";
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
                // Convert base64 string back to byte array and create ImageSource
                ImageSource imageSource = ImageSource.FromStream(() => new MemoryStream(Convert.FromBase64String(imageDataBase64)));

            }

            // Update the UI or perform any necessary tasks with the selected image
            uploadStatusLabel.Text = "Image uploaded successfully";
            uploadIcon.IsEnabled = true;

        }
    }

    private async void TapGestureRecognizer_Tapped(object sender, TappedEventArgs e)
    {
         RefreshClubList();
        await Navigation.PopAsync();
      


    }
}