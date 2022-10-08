import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'PageView Example',
      home: PageViewExample(),
    );
  }
}

class PageViewExample extends StatelessWidget {
  const PageViewExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0); //Page 컨트롤을 위한 PageController 선언 시작 페이지 0
    return Scaffold(
        appBar: AppBar(
          title: const Text('PageView example'),
        ),
        body: PageView(
          controller: controller, // 페이지 관리를 위한 controller
          children: [
          Container( // 첫 번째 페이지 구성, 시작페이지
          color: Colors.yellow,
          child: const Center(
            child: Text('First Page'),
          ),
        ),
        Container( // 두 번째 페이지 구성
          color: Colors.green,
          child: const Center(
            child: Text('Second Page'),
          ),
        ),
        Container( // 세 번째 페이지 구성
          color: Colors.blue,
          child: const Center(
            child: Text('Third Page'),
          ),),
    ],
    )
    ,
    );
  }
}

// PageView.builder 사용법
// PageView.builder(
//   controller: _controller,
//   itemBuilder: (context, index){
//     return Container(
//       child: Center(
//         child: Text(index.toString()),
//       ),
//     );
//   },
//   itemCount: null //null로 설정 시 children 개수 무한대.
// )

// class PageCustom extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return PageView.custom(
//         childrenDelegate: , //children 위젯을 PageView 위젯에게 제공하는 역할
//         pageSnapping: , // 페이지 단위로 화면이 넘어갈지 여부
//         clipBehavior: , // content가 범위를 넘어갈 때 해당 content를 자르는 방법
//         controller: , // PageView 컨트롤을 위한 Controller
//         dragStartBehavior: , // 사용자의 드래그를 인식
//         onPageChanged: , // 뷰포트 중앙 화면이 변경될 때마다 호출되는 함수
//         physics: , // 페이지 뷰가 사용자 입력에 반응하는 방법
//         restorationId: , //스크롤의 위치 정보를 저장하고 복원하는 역할
//         reverse: , // children 위젯을 역방향으로 보여줄 것인지 여부
//         scrollDirection: , // 스크롤 방향 여부
//         allowImplicitScrolling: , // 각 children 위젯들의 내부 스크롤 부여 여부
//     )
//   }
// }