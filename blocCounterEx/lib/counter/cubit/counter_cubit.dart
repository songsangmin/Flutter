import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> { //Cubit이 관리하는 상태 유형을 int로 선언
  CounterCubit() : super(0);

  void increment() => emit(state + 1); //현재 상태에 +1 하는 메서드

  void decrement() => emit(state - 1);//현재 상태에 -1 하는 메서드
}