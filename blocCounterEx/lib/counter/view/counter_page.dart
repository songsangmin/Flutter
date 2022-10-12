import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloccounterex/counter/counter.dart';
import 'counter_view.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider( //상태 관리를 위한 BlocProvider
      create: (_) => CounterCubit(), //CounterCubit 생성
      child: const CounterView(), //상태 관리할 View
    );
  }
}