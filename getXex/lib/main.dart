import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxex/router/homepage.dart';
//import 'statemanage/controller.dart';
//import 'statemanage/homepage.dart';

void main() {
  runApp(const App());
}

//Router Version
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( //라우트 관리를 하기 위한 GetMaterialApp 선언
      title: 'GetX Example',
      home: const HomePage(),
      getPages: [
        GetPage(name: '/next', page: () => const NextPage()),
        //Route 사용을 위한 NextPage 이름 설정
      ],
    );
  }
}

//State Version

// class App extends StatelessWidget {
//     @override
//   Widget build(BuildContext context) {
//     return MaterialApp( // 라우터를 사용할 것이 아니기에 MaterialApp 선언
//       title: 'Getx example',
//       home: HomePage(),
//     );
//    }
//   }