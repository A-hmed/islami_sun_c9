import 'package:flutter/material.dart';
import 'package:islami_sun_c9/cache_helper/cache_data.dart';
import 'package:islami_sun_c9/providers/settings_provider.dart';
import 'package:islami_sun_c9/ui/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  bool arSwitch = false;
  bool darkModeSwitch = false;
  late SettingsProvider provider ;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    arSwitch = provider.isAr();
    darkModeSwitch = provider.isDarkMode();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.settings, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.start,),
          buildSettingsRow("العربيه", arSwitch, (newValue) {
            arSwitch = newValue;
            if(arSwitch){
              provider.setCurrentLocale(true);
              provider.notifyListeners();
              CacheData.setData(key: 'Local', value: provider.isAr());
            }else {
              provider.setCurrentLocale(false);
              provider.notifyListeners();
              CacheData.setData(key: 'Local', value: provider.isAr());
            }
          }),
          buildSettingsRow(AppLocalizations.of(context)!.darkMode, darkModeSwitch,
                  (newValue) {
            darkModeSwitch = newValue;
            if(darkModeSwitch){
              provider.setCurrentMode(true);
              provider.notifyListeners();
              CacheData.setTheme(key: 'Theme', value: provider.isDarkMode());
            }else {
              provider.setCurrentMode(false);
              provider.notifyListeners();
              CacheData.setTheme(key: 'Theme', value: provider.isDarkMode());
            }
          }),

        ],
      ),
    );
  }

  Widget buildSettingsRow(String title, bool switchValue, Function(bool) onChanged){
    return Row(
      children: [
        SizedBox(width: 16,),
        Text(title, style: Theme.of(context).textTheme.bodySmall,),
        Spacer(),
        Switch(value: switchValue, onChanged: onChanged, activeColor: AppColors.primiary,)
      ],
    );
  }
}
