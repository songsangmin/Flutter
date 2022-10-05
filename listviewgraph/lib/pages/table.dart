import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';

import '../model/table_model.dart';
import '../widgets/widgets.dart';

//table list
List<TableItem> tableItems = [
  TableItem(
      meal: "조식",
      totalkcal: "828",
      title: "율무밥",
      type: "밥류",
      ingredient: "흰쌀",
      amount: "210",
      kcal: "130"),
  TableItem(
      meal: "중식",
      totalkcal: "781",
      title: "열무보리비빔밥",
      type: "밥류",
      ingredient: "보리쌀",
      amount: "210",
      kcal: "130"),
  TableItem(
      meal: "석식",
      totalkcal: "724",
      title: "찹쌀땅콩밥",
      type: "밥류",
      ingredient: "찹쌀, 땅콩",
      amount: "210",
      kcal: "130")
];

class table extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
          children: tableItems.map((tables) => //table list 활용을 위한 map
            Container(
                height: MediaQuery.of(context).size.height * 0.25,
                child: Row(children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 30, 20, 10),
                    decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(width: 1),
                          bottom: BorderSide(width: 1),
                          right: BorderSide(width: 1)),
                    ),
                    child: Column( //왼쪽 테이블
                      children: [
                        textBold(tables.meal, Colors.black,
                            TextAlign.start,17),
                        Padding(
                          padding:
                          const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Row(
                            children: <Widget>[
                              const SizedBox(
                                width: 30,
                              ),
                              textBold(tables.totalkcal,
                                  Colors.green, TextAlign.start,17),
                              textNormal("kcal", Colors.black,
                                  TextAlign.start,17),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(// 오른쪽 점선 나타내기 위한 컨테이너
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      border: RDottedLineBorder( //오른쪽 점선
                        right: const BorderSide(
                            width: 1, color: Colors.grey),
                      ),
                    ),
                    child: Container( //나머지 테두리 위한 컨테이너
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(width: 1),
                            bottom: BorderSide(
                              width: 1,
                            )),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20,20,20,20),
                        child: Table(children: [ // Table 활용 오른쪽 테이블 구성
                          TableRow(
                            children: [
                              tableLBTextWidget(
                                  tables.title, 300, 50),
                              Container(
                                width: 300,
                                height: 25,
                                alignment: Alignment.centerRight,
                                child: const Icon(
                                  Icons.favorite_border_outlined,
                                  color: Colors.red,
                                  size: 16,
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              tableLTextWidget("종류", 250, 25),
                              tableRTextWidget(
                                  tables.type, 300, 25),
                            ],
                          ),
                          TableRow(
                            children: [
                              tableLTextWidget("재료", 250, 25),
                              tableRTextWidget(
                                  tables.ingredient,
                                  300,
                                  25),
                            ],
                          ),
                          TableRow(
                            children: [
                              tableLTextWidget("정량", 250, 25),
                              tableRTextWidget(
                                  "${tables.amount}g",
                                  300,
                                  25),
                            ],
                          ),
                          TableRow(
                            children: [
                              tableLTextWidget("칼로리", 250, 25),
                              tableRTextWidget(
                                  "${tables.kcal}kcal",
                                  300,
                                  25),
                            ],
                          ),
                        ]),
                      ),
                    ),
                  ),
                ])),).toList()

        );
  }
}