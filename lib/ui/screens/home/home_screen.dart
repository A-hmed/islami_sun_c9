import 'package:flutter/material.dart';
import 'package:islami_sun_c9/providers/settings_provider.dart';
import 'package:islami_sun_c9/ui/screens/home/tabs/ahadeth_tab/ahadeth_tab.dart';
import 'package:islami_sun_c9/ui/screens/home/tabs/quran_tab/quran_tab.dart';
import 'package:islami_sun_c9/ui/screens/home/tabs/radio_tab/radio_tab.dart';
import 'package:islami_sun_c9/ui/screens/home/tabs/sebha_tab/sebha_tab.dart';
import 'package:islami_sun_c9/ui/screens/home/tabs/settings_tab/settings_tab.dart';
import 'package:islami_sun_c9/ui/utils/app_assets.dart';
import 'package:islami_sun_c9/ui/utils/app_colors.dart';
import 'package:islami_sun_c9/ui/utils/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTabIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    AhadethTab(),
    SebhaTab(),
    const RadioTab(),
    SettingsTab()
  ];

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage( settingsProvider.isDarkMode()?
           AppAssets.darkBackgorund: AppAssets.backgorund
        ), fit: BoxFit.fill)
      ),
      child: Scaffold(
       // backgroundColor: AppColors.transparent,
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.islami),
        ),
        body: tabs[currentTabIndex],
        bottomNavigationBar: buildBottomNavigationBar(),
      ),
    );
  }

  Widget buildBottomNavigationBar() => Theme(
    data: Theme.of(context).copyWith(canvasColor: Theme.of(context).primaryColor),
    child: BottomNavigationBar(
      currentIndex: currentTabIndex,
      onTap: (index){
        currentTabIndex = index;
        setState(() {});
      },
      items: [
        const BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icQuran)), label: "Quran"),
        const BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icAhadeth)), label: "Ahadeth"),
        const BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icSebha)), label: "Sebha"),
        const BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icRadio)), label: "Radio"),
        BottomNavigationBarItem(icon: const Icon(Icons.settings), label: AppLocalizations.of(context)!.settings),
      ],
    ),
  );
}
