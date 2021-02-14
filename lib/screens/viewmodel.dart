import 'package:flutter/material.dart';

class Viewmodel extends ChangeNotifier {
  bool _busy = false;
  get busy => _busy;

  void turnBusy() => _busy = true;
  void turnIdle(){
    _busy = false;
    notifyListeners();
  }
}