import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/nutrient_model.dart';
import '../widgets/widgets.dart';

//영양소 막대그래프 list
List<NutrientItem> nutrients = [
  NutrientItem(nutrient: "탄수화물", animatedpercentage: 76, percentage: 24 ,maincolor: Colors.indigoAccent),
  NutrientItem(nutrient: "단백질", animatedpercentage: 35, percentage: 65, maincolor: Colors.blueAccent),
  NutrientItem(nutrient: "지방", animatedpercentage: 49, percentage: 51, maincolor: Colors.lightBlue),
  NutrientItem(nutrient: "총 식이섬유", animatedpercentage: 76, percentage: 24, maincolor: Colors.cyan),
  NutrientItem(nutrient: "콜레스테롤", animatedpercentage: 52, percentage: 48, maincolor: Colors.cyanAccent),
  NutrientItem(nutrient: "총 포화 지방산", animatedpercentage: 52, percentage: 48, maincolor: Colors.cyanAccent),
];

class NutrientBar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _NutrientBar();
  }

}

class _NutrientBar extends State<NutrientBar> with SingleTickerProviderStateMixin{

  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = IntTween(begin: 0,end: 50).animate(_animationController);
    _animation.addListener(() => setState(() {}));
  }

  Widget barPart(){
    return Column(
        children: nutrients
        .map(
          (nutrient) => Container(
        margin: const EdgeInsets.only(bottom: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textNormal("  ${nutrient.nutrient}", Colors.black,
                TextAlign.start,16), //영양소 이름
            Row(
              children: [
                const SizedBox(width: 10),
                Expanded(
                  flex: _animation.value,
                  child: Container(
                    padding: const EdgeInsets.only(right: 10.0),
                    alignment: Alignment.centerRight,
                    height: 25.0,
                    color: nutrient.maincolor,
                      child: textBold( // 컨테이너 안 쪽 퍼센트 나타내기
                          nutrient.percentage.toString(),
                          Colors.white,
                          TextAlign.start,13),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  // remaining (blank part)
                  flex: 100 - nutrient.percentage, // 남는 부분 흰색으로 빈칸
                  child: const SizedBox(
                    child: FittedBox(),//애니매이션을 위해 FittedBox 선언
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Container( //텍스트 100%
                  padding: const EdgeInsets.only(right: 20),
                  child: textNormal(
                      "100%", Colors.black, TextAlign.end,15),
                ),
              ],
            ),
          ],
        ),
      ),
    ).toList());
  }

  //애니매이션 구현을 위한 Button 추가
  Widget  animationButtonPart() {
    return OutlinedButton(onPressed: (){
      if (_animationController.value == 0.0) {//애니매이션 값이 0일 때 늘리고 아닐 때 줄인다
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }, child: textBold("애니매이션", Colors.black, TextAlign.center, 18));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      animationButtonPart(),
      barPart(),
    ]
    );
  }



}