using uniunity5.CManagerViews;
using uniunity5.DataTransactions;
using uniunity5.Models;
using uniunity5.SksViews;

namespace uniunity5;

public partial class App : Application
{
	//public static StudentTrans StudentTrans { get; private set; }
	//public static SksTrans SksTrans { get; private set; }
  //  public static ClubManagerTrans  ClubManagerTrans { get; private set; }
    public App(StudentTrans studentTrans, SksTrans sksTrans, ClubManagerTrans clubManagerTrans, EventTrans eventTrans, ClubTrans clubTrans)

    {
		InitializeComponent();

         MainPage = new NavigationPage(new Welcome());
        //  MainPage = new CManagerViews.CManagerExternalView();
        // MainPage = new Views.ExView();
       //  MainPage = new SksViews.SksExternalView();
       // MainPage = new eventsExternalView();
        TransactionManager.Instance.InitializeTransactions(studentTrans, sksTrans, clubManagerTrans, eventTrans,clubTrans);

    }






}




