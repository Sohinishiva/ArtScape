import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool ledLightsOn = false;
  bool entryOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              // Add your logo here
              Image.asset(
                'lib/assets/logo.png',
                width: 50,
                height: 50,
              ),
              SizedBox(height: 150), // Adding some space between the rows
              // Add your image here
              Image.asset(
                'lib/assets/logo.png',
                width: 200,
                height: 200,
              ),
              SizedBox(height: 100),
              // Add your main content here
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    Icons.light_mode_outlined,
                    size: 30,
                    color: Colors.grey,
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "LED Lights",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Switch(
                    value: ledLightsOn,
                    onChanged: (bool newValue) {
                      setState(() {
                        ledLightsOn = newValue;
                      });
                      // Add functionality for LED Lights switch here
                      if (ledLightsOn) {
                        // LED Lights turned on
                        // Add your logic here
                      } else {
                        // LED Lights turned off
                        // Add your logic here
                      }
                    },
                    activeColor: Colors.green.shade900,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.grey,
                  ),
                ],
              ),
              SizedBox(height: 20), // Adding some space between the rows
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.rotate_90_degrees_ccw,
                    size: 30,
                    color: Colors.grey.shade400,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ball Movement",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        entryOn ? "Status: OPEN" : "Status: LOCKED",
                        style: TextStyle(
                          color: entryOn ? Colors.green : Colors.red,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Switch(
                    value: entryOn,
                    onChanged: (bool newValue) {
                      setState(() {
                        entryOn = newValue;
                      });
                      // Add functionality for ENTRY switch here
                      if (entryOn) {
                        // Entry system turned on
                        // Add your logic here
                      } else {
                        // Entry system turned off
                        // Add your logic here
                      }
                    },
                    activeColor: Colors.green,
                    inactiveThumbColor: Colors.grey.shade400,
                    inactiveTrackColor: Colors.grey,
                  ),
                ],
              ),
              SizedBox(height: 20), // Adding some space between the rows
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.timer,
                    size: 30,
                    color: Colors.grey.shade400,
                  ),
                  Text(
                    "Timer",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Add your timer widget here
                  TimerWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TimerWidget extends StatefulWidget {
  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  int _counter = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _counter++;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_counter seconds',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
