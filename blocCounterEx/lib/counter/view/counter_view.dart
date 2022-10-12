import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloccounterex/counter/counter.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Bloc Counter Example')),
      body: Center(
        child: BlocBuilder<CounterCubit, int>( // 상태 변화에 변경되어야 할 부분은 Text 하나이기에
          builder: (context, state) {  // Text 하나만 Wrapping. 상태가 변화할 때마다 업데이트
            return Text('$state', style: textTheme.headline2); //State호출
          },
        ),
      ),
      floatingActionButton: Column( //+ - 버튼을 구현하기 위한 Column
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            key: const Key('counterView_increment_floatingActionButton'),
            child: const Icon(Icons.add),
            onPressed: () => context.read<CounterCubit>().increment(),//CounterCubit의 increment 함수 호출
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            key: const Key('counterView_decrement_floatingActionButton'),
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CounterCubit>().decrement(),//CounterCubit decrement 함수 호출
          ),
        ],
      ),
    );
  }
}