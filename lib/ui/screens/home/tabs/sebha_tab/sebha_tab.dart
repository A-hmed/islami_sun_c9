import 'package:flutter/material.dart';
import 'package:islami_sun_c9/providers/settings_provider.dart';
import 'package:islami_sun_c9/ui/utils/app_assets.dart';
import 'package:islami_sun_c9/ui/utils/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../utils/app_theme.dart';

class SebhaTab extends StatefulWidget {

  @override
  State<SebhaTab> createState() => SebhaTabState();
}

class SebhaTabState extends State<SebhaTab> {
  int sebhaCounter = 0;
  int sebhaWordCounter = 0;
  List<String> tasbehWords = ["سبحان الله", "الحمدلله", "الله اكبر"];
  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: InkWell(
            onTap: () {
              sebhaLogic();
              setState(() {});
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(right: 120,bottom: 160,child: Image(image: provider.currentMode == ThemeMode.light ? const AssetImage(AppAssets.headOfSebha) : const AssetImage(AppAssets.darkHeadOfSebha), width: 90, height: 85,)),
                Positioned(bottom: 4,child: Image(image: provider.currentMode == ThemeMode.light ? const AssetImage(AppAssets.sebhaTabLogo) : const AssetImage(AppAssets.darkSebhaTabLogo), width: 185, height: 180,)),
              ],
            ),
          ),
        ),
        Expanded(flex: 5, child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(AppLocalizations.of(context)!.counterOfSebha, style: Theme.of(context).textTheme.bodyMedium),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: provider.currentMode == ThemeMode.light ? AppColors.primiary.withAlpha(150) : AppColors.primiaryDark.withAlpha(200)
              ),
              child: Text("${int.parse(sebhaCounter.toString())}", style: const TextStyle(fontSize: 25, fontWeight: FontWeight.normal),),
            ),
            const SizedBox(height: 20,),
            Container(
              width: 110,
              height: 45,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: provider.currentMode == ThemeMode.light ? AppColors.primiary : AppColors.accentDark,
              ),
              child: Text(tasbehWords[sebhaWordCounter],
                  textAlign: TextAlign.center,
                  style: provider.currentMode == ThemeMode.light ? AppTheme.sebhaTabTitle : AppTheme.sebhaTabTitle.copyWith(color: AppColors.accent)),
            )
          ],
        ),)
      ],
    );
  }

  void sebhaLogic()
  {
    sebhaWordCounter++;
    if(sebhaWordCounter >= tasbehWords.length)
      {
        sebhaWordCounter = 0;
        sebhaCounter++;
      }
    if(sebhaCounter > 33)
    {
      sebhaCounter = 0;
      sebhaWordCounter = 0;
    }
  }
}