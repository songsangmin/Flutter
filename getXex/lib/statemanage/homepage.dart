import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller()); //Get.put을 사용하여 controller 변수에 Controller 할당
    return Scaffold(
      appBar: AppBar(
        title: const Text('Getx example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<Controller>(
                init: Controller(), // init을 설정하지 않을 시 에러 발생
                builder: (_) => Text(
                  'clicks: ${_.count1}',
                ),
            ),
            TextButton(
              onPressed: controller.increment1,
            child: const Text('increment1')),
            GetX<Controller>( // init을 통해 Controller를 등록할 수 있지만 여기선 Get.put을 사용
              builder: (_) => Text(
                'clicks: ${_.count2.value}',
              ),
            ),
            Obx((){ // Obx 사용 시 따로 Controller 명시 X 보여줄 위젯만. 근데 Get.put을 반드시 사용
              return Text(
                'clicks: ${controller.count2.value}',
              );
            }),
            TextButton(
              onPressed: controller.increment2,
            child: const Text('increment2')),
          ],
        ),
      ),
    );
  }
}