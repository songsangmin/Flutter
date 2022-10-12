import 'package:bloc/bloc.dart';

//BlocObserver 애플리케이션의 모든 상태 변화를 관찰하는데 도움이 된다.
class CounterObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }
}