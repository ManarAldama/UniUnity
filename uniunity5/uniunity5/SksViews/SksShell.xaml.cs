namespace uniunity5.SksViews;

public partial class SksShell : Shell
{
	public SksShell()
	{
		InitializeComponent();

        Routing.RegisterRoute("Welcome", typeof(Welcome));
        Routing.RegisterRoute("LoginType", typeof(LoginType));
        Routing.RegisterRoute("Login1", typeof(Login1));
        Routing.RegisterRoute("AccountPageSks", typeof(AccountPageSks));
        Routing.RegisterRoute("ClubsPageSks", typeof(ClubsPageSks));
        Routing.RegisterRoute("HomePageSks", typeof(HomePageSks));
        Routing.RegisterRoute("SearchPageSks", typeof(SearchPageSks));
       // Routing.RegisterRoute("Calendar", typeof(SksViews.Calendar));
        Routing.RegisterRoute("AddClub", typeof(AddClub));
    }
}