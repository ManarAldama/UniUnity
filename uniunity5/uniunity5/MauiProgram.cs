using uniunity5.DataTransactions;

namespace uniunity5;

public static class MauiProgram
{
	public static MauiApp CreateMauiApp()
	{
		var builder = MauiApp.CreateBuilder();
		builder
			.UseMauiApp<App>()
			.UseMauiCommunityToolkit()
			.ConfigureFonts(fonts =>
			{
				fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
				fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
			});

        string _dbPath = Path.Combine(FileSystem.AppDataDirectory, "uniunity5L.db");

        builder.Services.AddSingleton(s =>
		ActivatorUtilities.CreateInstance<StudentTrans>(s, _dbPath));

        builder.Services.AddSingleton(s =>
        ActivatorUtilities.CreateInstance<ClubManagerTrans>(s, _dbPath));

        builder.Services.AddSingleton(s =>
        ActivatorUtilities.CreateInstance<SksTrans>(s, _dbPath));

        builder.Services.AddSingleton(s =>
        ActivatorUtilities.CreateInstance<EventTrans>(s, _dbPath));

        builder.Services.AddSingleton(s =>
        ActivatorUtilities.CreateInstance<ClubTrans>(s, _dbPath));

        builder.Services.AddTransient<Welcome>();
        builder.Services.AddTransient<LoginType>();

        builder.Services.AddTransient<Login>();
        builder.Services.AddTransient<Login1>();

        builder.Services.AddTransient<ClubManagerLogin>();






        return builder.Build();
	}
}
