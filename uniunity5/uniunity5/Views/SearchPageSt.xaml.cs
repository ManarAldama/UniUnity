namespace uniunity5.Views;

public partial class SearchPageSt : ContentPage
{
	public SearchPageSt()
	{
		InitializeComponent();
	}

    public class CustomFrame : Frame
    {
        public CustomFrame()
        {

            Padding = new Thickness(5, 0);
        }
    }

    public SearchPageSt(string title, string message, ImageSource imageSource)
    {
        var titleLabel = new Label
        {
            Text = title,
            FontSize = Device.GetNamedSize(NamedSize.Title, typeof(Label)),
            HorizontalOptions = LayoutOptions.Center
        };

        var imageView = new Image
        {
            Source = imageSource,
            HorizontalOptions = LayoutOptions.Center,
            Margin = new Thickness(0, 0)
        };

        var messageLabel = new Label
        {
            Text = message,
            FontSize = Device.GetNamedSize(NamedSize.Body, typeof(Label)),
            HorizontalOptions = LayoutOptions.Center
        };

        var stackLayout = new StackLayout
        {
            Padding = new Thickness(20),
            Spacing = 20,
            Children = { titleLabel, imageView, messageLabel }
        };

        Content = stackLayout;
    }

    private async void OnFrameTapped(object sender, EventArgs e)
    {
        var imageSource = ImageSource.FromFile("image1.jpeg");
        var title = "Description";
        var message = "The event titled Youth Presentation on Combating Addiction and Child Abuse organized by Haydi Tut Elimi Club will be held on March 8, 2024 at 14.00 at the Aziz Sancar Conference Hall, Central Campus C Block -1st Floor, with the participation of Sümeyye Bilici, Ozan Yelgel, Serdar Acı.";

        var alertPage = new SearchPageSt(title, message, imageSource);
        await Navigation.PushModalAsync(alertPage);
    }
    private async void FiltersFrameTapped(object sender, EventArgs e)
    {
    }

    private void Image_Focused(object sender, FocusEventArgs e)
    {
        Navigation.PushAsync(new Calendar());
    }
}