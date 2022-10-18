import 'package:flutter/cupertino.dart';

class CounterController extends ValueNotifier<int> {
  CounterController() : super(0);

  increment() => value++;
}