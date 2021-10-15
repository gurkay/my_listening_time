import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const TimerHomePage(),
    );
  }
}

class TimerHomePage extends StatelessWidget {
  final double defaultPadding = 5.0;
  final CountDownTimer countDownTimer = CountDownTimer();

  @override
  Widget build(BuildContext context) {
    final List<PopupMenuItem<String>> menuItems = List<PopupMenuItem<String>>();
    menuItems.add(
      PopupMenuItem(
        value: 'Settings',
        child: Text('Settings'),
      )
    );
    countDownTimer.startWork();
    return MaterialApp(
      title: 'My Work Timer',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home:Scaffold(
        appBar: AppBar(
          title: const Text('My work timer'),
          actions: [
            PopupMenuButton<String>(
              itemBuilder: (BuildContext context){
                return menuItems.toList();
              },
              onSelected: (s) {
                if(s == 'Settings') {
                  goToSettings(context);
                }
              },
            ),
          ],
        ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double availableWidth = constraints.maxWidth;
          return Column(
            children: [
              Row(
                children: [
                  Padding(padding: EdgeInsets.all(defaultPadding)),
                  Expanded(
                    child: ProductivityButton(
                      color: Color(0xff009688),
                      text: 'Work',
                      onPressed: () => countDownTimer.startWork(),
                    ),
                  ),
                  Expanded(
                    child: ProductivityButton(
                      color: Color(0xff607D8B),
                      text: 'Short Break',
                      onPressed: () => countDownTimer.startBreak(true),
                    ),
                  ),
                  Expanded(
                    child: ProductivityButton(
                      color: Color(0xff455A64),
                      text: 'Long Break',
                      onPressed: () => countDownTimer.startWork(false),
                    ),
                  ),                  
                ],
              ),
              Expanded(
                child: StreamBuilder(
                  initialData: TimerModel('00:00', 1),
                  stream: countDownTimer.stream(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    TimerModel timerModel = snapshot.data;
                    return Container(
                      child: CircularPercentIndicator(
                        radius: availableWidth /2 ,
                        lineWidth: 10.0,
                        percent: (timerModel.percent == null) ? 1 : timer.percent,
                        center: Text(
                          (timerModel==null)?'00:00':timerModel.time,
                          style: Theme.of(context).textTheme.headline4,
                          progressColor: Color(0xff009688),
                        ),
                      ),
                    );
                  }
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ProductivityButton(
                      color: Color(0xff212121),
                      text: 'Stop',
                      onPressed: () => countDownTimer.stopTimer(),
                    ),
                  ),
                  Expanded(
                    child: ProductivityButton(
                      color: Color(0xff009688),
                      text: 'Restart',
                      onPressed: () => countDownTimer.startTimer(),
                    ),
                  ),                  
                ],
              ),
            ],
          );
        }
      ),
    );
  }
      
  void emptyMethod() {}
  void goToSettings(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder:(context) => SettingsScreen()));
  }
}
