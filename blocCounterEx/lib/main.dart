import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:bloccounterex/app.dart';
import 'package:bloccounterex/counter_observer.dart';

void main() {
  Bloc.observer = CounterObserver();
  runApp(const CounterApp());
}