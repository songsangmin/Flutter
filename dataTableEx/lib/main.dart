import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DataTable Example',
      home: Scaffold(
        appBar: AppBar(title: const Text('DataTable Example')),
        body: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[ // 열 이름 지정
        DataColumn(
          label: Expanded( // 빈공간이 없게 하기 위한 Expanded
            child: Text(
              'Name',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Age',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded( //
            child: Text(
              'Role',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ],
      rows: const <DataRow>[ // 행 입력
        DataRow( //Row로 묶어줌.
          cells: <DataCell>[ // 각 셀 마다 들어갈 값 지정
            DataCell(Text('Sarah')),
            DataCell(Text('19')),
            DataCell(Text('Student')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Janine')),
            DataCell(Text('43')),
            DataCell(Text('Professor')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('William')),
            DataCell(Text('27')),
            DataCell(Text('Associate Professor')),
          ],
        ),
      ],
    );
  }
}


// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'DataTable Example',
//       home: Scaffold(
//         appBar: AppBar(title: const Text(DataTable Example)),
//         body: const HomePage(),
//       ),
//     );
//   }
// }
//
// class HomePage extends StatefulWidget { // 체크 박스로 상태가 변화하기 때문에 StatefulWidget
//   const HomePage({super.key});
//
//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }
//
// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   static const int numItems = 10; // 행 개수
//   List<bool> selected = List<bool>.generate(numItems, (int index) => false); // 선택된 아이템을 담을 크기가 10인 List
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       child: DataTable( // 열이 한개인 테이블
//         columns: const <DataColumn>[
//           DataColumn(
//             label: Text('Number'),
//           ),
//         ],
//         rows: List<DataRow>.generate( // 행은 numItems 만큼 생성
//           numItems,
//               (int index) => DataRow(
//             color: MaterialStateProperty.resolveWith<Color?>( // 상태에 따라 색상 변환
//                     (Set<MaterialState> states) {
//                     return Theme.of(context).colorScheme.primary.withOpacity(0.08);
//                   if (states.contains(MaterialState.selected)) {
//                   }
//                   if (index.isEven) {
//                     return Colors.grey.withOpacity(0.3);
//                   }
//                   return null;
//                 }),
//             cells: <DataCell>[DataCell(Text('Row $index'))], // 셀의 내용
//             selected: selected[index], //선택된 것을 담을 리스트 선언
//             onSelectChanged: (bool? value) { // 선택 된 경우 안 된 경우
//               setState(() {
//                 selected[index] = value!; // bool 값 저장
//               });
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
