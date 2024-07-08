namespace uniunity5.CManagerViews;

public partial class CMShell : Shell
{
	public CMShell()
	{
		InitializeComponent();

        Routing.RegisterRoute("Welcome", typeof(Welcome));
        Routing.RegisterRoute("LoginType", typeof(LoginType));
        Routing.RegisterRoute("ClubManagerLogin", typeof(ClubManagerLogin));
        Routing.RegisterRoute("AccountPageCManager", typeof(AccountPageCManager));
        Routing.RegisterRoute("ClubsPageCM", typeof(ClubsPageCM));
        Routing.RegisterRoute("HomePageCManager", typeof(HomePageCManager));
        Routing.RegisterRoute("SearchPageCM", typeof(SearchPageCM));
        Routing.RegisterRoute("MyClub", typeof(MyClub));
        Routing.RegisterRoute("ActivityForm", typeof(ActivityForm));

    }
}