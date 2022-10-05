import 'package:flutter/material.dart';
import 'package:injewelme/pages/pieChart.dart';
import 'package:injewelme/pages/table.dart';
import 'package:injewelme/widgets/widgets.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';
import 'nutrient_bar.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  table(),
                  const SizedBox(height: 30),
                  textBold(" 다량영양소", Colors.black, TextAlign.start , 20),
                  NutrientBar(),
                  const SizedBox(height: 10,),
                  PieChart(),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
