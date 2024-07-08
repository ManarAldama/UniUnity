using System.Formats.Asn1;
using uniunity5.DataTransactions;

namespace uniunity5;

public partial class Welcome : ContentPage
{
	public Welcome()
	{
		InitializeComponent();
	}

    private async void OnCounterClicked(object sender, EventArgs e)
    {
 
       await Navigation.PushAsync(new LoginType());

    }
}