import 'package:flutter/material.dart';
import 'package:islami_sun_c9/model/details_screen_args.dart';
import 'package:islami_sun_c9/providers/settings_provider.dart';
import 'package:islami_sun_c9/ui/screens/details_screen/details_screen.dart';
import 'package:islami_sun_c9/ui/utils/app_assets.dart';
import 'package:islami_sun_c9/ui/utils/app_theme.dart';
import 'package:islami_sun_c9/ui/utils/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../../utils/app_colors.dart';

class QuranTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SettingsProvider provider =Provider.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(flex: 3, child: Image.asset(AppAssets.quranTabLogo)),
        const Divider(),
        Text(
          AppLocalizations.of(context)!.suraName,
          style: Theme.of(context).textTheme.displayMedium,
          textAlign: TextAlign.center,
        ),
        const Divider(),
        Expanded(
          flex: 7,
          child: ListView.builder(
              itemCount: Constants.suraNames.length,
              itemBuilder: (_, index) {
                return TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, DetailsScreen.routeName,
                       arguments: DetailsScreenArgs(suraOrHadethName: Constants.suraNames[index],
                           fileName: "${index+1}.txt",
                           isQuranFile: true));
                    },
                    child: Text(
                      Constants.suraNames[index],
                      textAlign: TextAlign.center,
                      style: provider.currentMode == ThemeMode.light ? AppTheme.quranTabTitleTextStyle
                          .copyWith(fontWeight: FontWeight.normal) :
                      AppTheme.quranTabTitleTextStyle.copyWith(fontWeight: FontWeight.normal, color: AppColors.white),
                    ));
              }),
        )
      ],
    );
  }
}
