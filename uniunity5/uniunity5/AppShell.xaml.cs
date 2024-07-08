using uniunity5.SksViews;

namespace uniunity5;

public partial class AppShell : Shell
{
  

    public AppShell()
	{
		InitializeComponent();

        Routing.RegisterRoute("Welcome", typeof(Welcome));
        Routing.RegisterRoute("LoginType", typeof(LoginType));
        Routing.RegisterRoute("Login", typeof(Login));
        Routing.RegisterRoute("AccountPageSt", typeof(AccountPageSt));
        Routing.RegisterRoute("ClubsPageSt", typeof(ClubsPageSt));
        Routing.RegisterRoute("HomePageSt", typeof(HomePageSt));
        Routing.RegisterRoute("SearchPageSt", typeof(SearchPageSt));
        Routing.RegisterRoute("Calendar", typeof(Views.Calendar));
        Routing.RegisterRoute("Clubinfo", typeof(Clubinfo));




       
    }

    



}
