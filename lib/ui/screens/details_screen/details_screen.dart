import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_sun_c9/model/details_screen_args.dart';
import 'package:islami_sun_c9/ui/utils/app_assets.dart';
import 'package:islami_sun_c9/ui/utils/app_colors.dart';
import 'package:islami_sun_c9/ui/utils/app_theme.dart';
import 'package:islami_sun_c9/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  static const String routeName = "details_screen";

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late DetailsScreenArgs arguments;

  String fileContent = "";
  int ayaCount = 0;

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    arguments = ModalRoute.of(context)!.settings.arguments as DetailsScreenArgs;
    if(fileContent.isEmpty){
      readFile();
    }
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(provider.currentMode == ThemeMode.light ? AppAssets.backgorund : AppAssets.darkBackgorund), fit: BoxFit.fill)
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.transparent,
          centerTitle: true,
          title: Text(arguments.suraOrHadethName, style: AppTheme.appBarTitleTextStyle,),
        ),
        body: fileContent.isEmpty ? Center(child: CircularProgressIndicator(color: provider.currentMode == ThemeMode.light ? AppColors.primiary : AppColors.accentDark,)):
        Container(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: provider.currentMode == ThemeMode.light ? AppColors.white : AppColors.primiaryDark
          ),
          child: SingleChildScrollView(
            child: Text(fileContent,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: Theme.of(context).textTheme.bodyLarge),
          ),
        ),
      ),
    );
  }

  void readFile() async {
   String file = await rootBundle.loadString(arguments.isQuranFile ?
   "assets/files/quran/${arguments.fileName}":"assets/files/ahadeth/${arguments.fileName}" );
   fileContent = file;
   List<String> fileLines = file.split("\n");
   for(int i = 0; i< fileLines.length ;i++){
      fileLines[i] += arguments.isQuranFile ? "(${i+1})": " ";
   }
   fileContent = fileLines.join();
   setState(() {});
  }
}