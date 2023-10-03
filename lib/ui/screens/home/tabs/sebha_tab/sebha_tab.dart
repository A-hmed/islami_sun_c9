import 'package:flutter/material.dart';
import 'package:islami_app/ui/utils/app_assets.dart';

class SebhaTab extends StatefulWidget{
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double angle =0;
  int counter =0;
  List<String> textList=["سبحان الله ","الحمد لله","الله اكبر"];
  int currentIndex =0;
  @override
  Widget build(BuildContext context){
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin:  EdgeInsets.only(top: size.height * 0.07),
              child: Transform.rotate(
                angle: angle,
                child: InkWell(
                  onTap: (){
                    clickOnImage();
                  },
                  child: Image.asset(AppAssets.sebhaBody,height: size.height * 0.20,)))),
            Container(
              margin: const EdgeInsets.only(left: 30 ),
              child: Image.asset(AppAssets.headSebha,height: size.height * 0.10,))
          ],),
          const SizedBox(height: 10,),
          Text("عدد التسبيحات",textAlign: TextAlign.center,style: Theme.of(context).textTheme.displayMedium,),
          const SizedBox(height: 10,),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(15),
            //margin: const EdgeInsets.only(left: 130,right: 130),
            child: ElevatedButton(onPressed: (){
              clickOnImage();
            }, child:  Text("$counter"))),
          const SizedBox(height: 6,),
          Container(
            alignment: Alignment.center,
            child: ElevatedButton(onPressed: (){}, child: Text(textList[currentIndex]))),
      ],
    );
  }

  void clickOnImage (){
    angle +=3;
    if(counter == 30){
      counter =0;
      currentIndex ++;
      if(currentIndex >2){
        currentIndex =0;
      }
    }
    counter ++;
    setState(() {
      
    });
  }
}
