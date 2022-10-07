import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Example'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () => Get.to(const NextPage()), //해당 페이지로 이동
              child: const Text('Get.to()'),
            ),
            TextButton(
              onPressed: () => Get.toNamed('/next'), // 미리 설정해둔 이름을 통해 새로운 화면으로 이동
              child: const Text('Get.toNamed()'),
            ),
            TextButton(
              onPressed: () => Get.off(const NextPage()), // 다음 화면으로 이동하면서 이전 화면을 아예 없애 버린다.
              child: const Text('Get.off()'),
            ),
            TextButton(
              onPressed: () => Get.offAll(const NextPage()), //off는 전 화면 하나만 없애지만 offAll은 화면 전체를 없앤다.
              child: const Text('Get.offAll()'),
            ),
            TextButton(
              onPressed: () =>
                  Get.snackbar( //Snackbar 생성
                      'Snackbar', // Snackbar title,
                      'Snackbar', // Snackbar Description,
                      snackPosition: SnackPosition.TOP),  // Snackbar 위치
              child: const Text('Get.snackbar()'),
            ),
            TextButton(
              onPressed: () =>
                  Get.showSnackbar(
                    GetBar(
                      title: 'Snackbar', // Snackbar title
                      message: 'Snackbar', //Snackbar Description
                      duration: const Duration(seconds: 2), // Snackbar 지속시간
                      snackPosition: SnackPosition.BOTTOM, // Snackbar 위치
                    ),
                  ),
              child: const Text('Get.showSnackbar()'),
            ),
            TextButton(
              onPressed: () => Get.defaultDialog( // 기본 대화창 생성
                  title: 'Dialog', // 대화창 title
                  middleText: 'Dialog' // 대화창 Description
              ),
              child: const Text('Get.defaultDialog()'),
            ),
            TextButton(
              onPressed: () => Get.dialog( // Dialog를 활용해 대화창 생성
                const Dialog( // Dialog 위젯 사용
                  child: SizedBox(
                    height: 100, // 높이
                    child: Center(
                      child: Text('Dialog'),
                    ),
                  ),
                ),),
              child: const Text('Get.dialog()'),
            ),
            TextButton(
              onPressed: () => Get.bottomSheet( // BottomSheet 사용
                  Container(
                    height: 100, // 높이
                    color: Colors.white, // 배경 색
                    child: const Center(
                      child: Text('BottomSheet'),
                    ),
                  )
              ),
              child: const Text('Get.bottomSheet()'),
            ),
          ],
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NextPage'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () => Get.back(), //이전 화면으로 돌아감.
              child: const Text('Get.back()'),
            ),
          ],
        ),
      ),
    );
  }

}