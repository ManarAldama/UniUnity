using uniunity5.Models;
namespace uniunity5;

public partial class clubsExternalView : ContentPage
{
    public List<Club> stu = new List<Club>();
    public clubsExternalView()
	{
		InitializeComponent();

        clublist.ItemsSource = stu;

    }

  

    private void Button_Clicked_1(object sender, EventArgs e)
    {
        TransactionManager.Instance.ClubTransaction.DeleteAllClubs();
        stu = TransactionManager.Instance.ClubTransaction.GetClubs();
        clublist.ItemsSource = stu;

    }

    
}