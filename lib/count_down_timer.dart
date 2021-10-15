import 'dart:async';
import './timer_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CountDownTimer {
  double _radius = 1;
  bool _isActive = true;
  Timer timer;
  Duration _time;
  Duration _fullTime;
  int work = 30;
  int shortBreak = 5;
  int longBreak = 20;
  
  String returnTime(Duration t) {
  
  }
}
