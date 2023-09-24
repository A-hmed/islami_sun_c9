import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter =0;
  List <String> tasbehList =[
    "سبحان الله",
    "الحمد لله",
    "الله اكبر",
    "لا اله الا الله",
  ];
  int currentIndex =0;
  double angle =0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          InkWell(
            onTap: onTasbehClicked,
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.09),
                    child: Transform.rotate(
                        angle: (math.pi /180) * angle,
                        child: Image.asset(AppAssets.sebhaTabLogo))),
                Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height * 0.05),
                  child: Image.asset(AppAssets.HeadSebhaTabLogo),
                ),
              ],
            ),
          ),
          Expanded(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Text("Tasbeh Numbers",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: AppColors.accent,
                      ),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30,vertical: 35),
                    decoration: BoxDecoration(
                      color:AppColors.primiary,
                      borderRadius: BorderRadius.circular(20),

                    ),
                    child: Text("$counter",style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 25
                    ),),
                  ),
                  SizedBox(height: 18,),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color:AppColors.primiary,
                      borderRadius: BorderRadius.circular(30),

                    ),
                    child: Text("${tasbehList[currentIndex]}",style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: AppColors.white,
                        fontSize: 25
                    ),),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  void onTasbehClicked() {
    setState(() {
      counter++;
      angle+=30;
      if(counter % 33 == 0){
        if(currentIndex == 4){
          currentIndex == 0;
        }
        currentIndex++;
      }
    });
  }
}
