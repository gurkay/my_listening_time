import 'package:flutter/material.dart';

typedef CallbackSetting = void Function(String, int);

class SettingsButton extends StatelessWidget {
  final Color myColor;
  final String myText;
  final int myValue;
  final String mySetting;
  final CallbackSetting callbackSetting;

  SettingsButton(
    this.myColor,
    this.myText,
    this.myValue,
    this.mySetting,
    this.callbackSetting,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: myColor,
      child: Text(
        myText,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: () {
        callbackSetting(
          this.mySetting,
          this.myValue,
        );
      },
    );
  }
}
