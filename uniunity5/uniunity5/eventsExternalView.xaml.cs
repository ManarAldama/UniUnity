using uniunity5.Models;
namespace uniunity5;

public partial class eventsExternalView : ContentPage
{
    public List<Event> stu = new List<Event>();
    public eventsExternalView()
	{
		InitializeComponent();

        eventlist.ItemsSource = stu;

    }

    private void Button_Clicked_1(object sender, EventArgs e)
    {
        TransactionManager.Instance.EventTransaction.DeleteAllEvents();
        stu = TransactionManager.Instance.EventTransaction.GetEvents();
        eventlist.ItemsSource = stu;

    }
}