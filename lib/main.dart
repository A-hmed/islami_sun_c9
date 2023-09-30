import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_sun_c9/cache_helper/cache_data.dart';
import 'package:islami_sun_c9/providers/settings_provider.dart';
import 'package:islami_sun_c9/ui/screens/details_screen/details_screen.dart';
import 'package:islami_sun_c9/ui/screens/home/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_sun_c9/ui/utils/app_theme.dart';
import 'package:provider/provider.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheData.cacheInitialization();
  runApp(ChangeNotifierProvider(
      create: (_) => SettingsProvider(),
      child: MyApp()
  ));
}

class MyApp extends StatelessWidget {
  late SettingsProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);

    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate
      ],
      supportedLocales: const [Locale("en"), Locale("ar",)],
      locale: Locale(provider.setCurrentLocale(CacheData.getLocal(key: 'Local'))),
      themeMode: provider.setCurrentMode(CacheData.getTheme(key: 'Theme')),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        DetailsScreen.routeName: (_) => DetailsScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}