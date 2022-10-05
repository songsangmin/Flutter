import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../model/chart_model.dart';
import '../widgets/widgets.dart';
//chart List
List<ChartModel> chartModel = [
  ChartModel(nutrient: '탄수화물', rate: 28.30, color: Colors.amberAccent),
  ChartModel(nutrient: '단백질', rate: 35.85, color: Colors.deepPurpleAccent),
  ChartModel(nutrient: '지방', rate: 35.85, color: Colors.tealAccent),
];

class PieChart extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _PieChart();
  }
}

class _PieChart extends State<PieChart>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SfCircularChart( //PieChart 생성
            series: <PieSeries<ChartModel, String>>[
              PieSeries<ChartModel, String>(
                explode: true, //그래프 튀어나오는 액션
                dataSource: chartModel, //ChartList를 source로
                pointColorMapper:(ChartModel model, _) => model.color, //color mapping
                xValueMapper: (ChartModel model, _) => model.nutrient, //제목 mapping
                yValueMapper: (ChartModel model, _) => model.rate, //비율 mapping
                dataLabelMapper: (ChartModel model, _) => "${model.nutrient}\n${model.rate}%", //Label mapping
                dataLabelSettings: const DataLabelSettings(isVisible: true, alignment: ChartAlignment.center,textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.white))//chart Setting
              )
            ],
          ),
          textNormal("첫 생성 및 클릭시 애니매이션", Colors.black, TextAlign.center, 10),
        ],
      ),
    );
  }
}