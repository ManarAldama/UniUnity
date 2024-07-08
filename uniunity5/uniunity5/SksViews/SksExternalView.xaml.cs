using uniunity5.DataTransactions;
using uniunity5.Models;

namespace uniunity5.SksViews;

public partial class SksExternalView : ContentPage
{
    public static SksTrans sks { get; set; }
    public List<SKS> sksll = new List<SKS>();
    public SksExternalView()
	{
		InitializeComponent();
        SKSlist.ItemsSource = sksll;
    }

    private void Button_Clicked(object sender, EventArgs e)

    {
        if (Name.Text != null && Email.Text != null && Password.Text != null && Phone.Text != null)
        {


            TransactionManager.Instance.SksTransaction.AddSks(new Models.SKS
            {
                SKSName = Name.Text,
                SKSEmail = Email.Text,

                SKSPassword = Password.Text,
                SKSPhone = Phone.Text



            });
        }
        else
        {
            DisplayAlert("error", "error", "ok");
        }
        sksll = TransactionManager.Instance.SksTransaction.GetSKS();
        SKSlist.ItemsSource = null;
        SKSlist.ItemsSource = sksll;

    }
    private void Button_Clicked_1(object sender, EventArgs e)
    {
        TransactionManager.Instance.SksTransaction.DeleteAllsks();
        sksll = TransactionManager.Instance.SksTransaction.GetSKS();
        SKSlist.ItemsSource = null;
        SKSlist.ItemsSource = sksll;

    }

    private async void SKSlist_ItemTapped(object sender, ItemTappedEventArgs e)
    {
        var s = e.Item as SKS;
        await DisplayAlert("selected sks", "name " + s.SKSName, "ok");

    }
}