import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Provider/counterProvider.dart';

void main() {
  runApp(
    MultiProvider(providers: [ //Provider를 여러개 사용시 MultiProvider
      ChangeNotifierProvider(create: (_) => CounterProvider()), // Provider를 사용하기 위한 Provider선언
    ],
    child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Provider Example',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Text('You have pushed the button this many times:'),
            Count(), // Count 개수를 표현할 위젯
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('increment_floatingActionButton'),

        onPressed: () => context.read<CounterProvider>().increment(), //버튼을 누를시 CounterProvier에 있는 increment 실행
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Count extends StatelessWidget { // Count 개수를 표한하는 부분을 필요없는 rebuild를 없애기 위해 따로 위젯화
  const Count({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        '${context.watch<CounterProvider>().count}', //CounterProvider 안에 있는 count 상태 읽어오기.
        key: const Key('counterState'),
    );
  }
}