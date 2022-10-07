import 'package:get/get.dart';

class Controller extends GetxController { // GetxController extend
  var count1 = 0; // 변수 선언
  var count2 = 0.obs; // ovservable 변수 선언

  void increment1(){
    count1++;
    update(); // 변수를 증가한 걸 화면에 알려줌. Provider에 notifyListenr()와 동일.
  }

  void increment2() => count2.value++; //Rx 값에 접근할 때는 .value 사용

  @override
  void onInit() {
    super.onInit(); // 꼭 호출

    once(count2, (_){ // count2가 처음으로 변경 되었을 때만 호출
      print('$_이 처음으로 변경되었습니다.');
    });
    ever(count2, (_){ // count2가 변경될 때마다 호출
      print('$_이 변경되었습니다.');
    });
    debounce( // count2가 변경되다가 마지막 변경 후, 1초간 변경이 없을 때 호출
      count2,
        (_) {
        print('$_가 마지막으로 변경된 이후, 1초간 변경이 없습니다.');
        },
      time: const Duration(seconds: 1),
    );
    interval( // count2가 변경되고 있는 동안, 1초마다 호출
      count2,
            (_) {
              print('$_가 변경되는 중입니다.(1초마다 호출)');
            },
      time: const Duration(seconds: 1),
    );
  }
}