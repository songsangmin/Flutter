import 'package:flutter/foundation.dart';

class CounterProvider with ChangeNotifier, DiagnosticableTreeMixin {
  int _count = 0;

  int get count => _count;

  void increment() { //증가 함수
    _count++;
    notifyListeners(); //이 함수를 통해 화면 상태 변경을 알려준다.
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    // TODO: implement debugFillProperties
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count)); //property 제공을 위한 count add
  }
}