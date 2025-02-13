import 'package:flutter/material.dart';

import 'Widget/AddWaterBtn.dart';

class WaterTracker extends StatefulWidget {
  const WaterTracker({super.key});

  @override
  State<WaterTracker> createState() => _WaterTrackerState();
}

class _WaterTrackerState extends State<WaterTracker> {
  late int _currentIntake = 0;
  final int _goal = 2000;

  void _waterAdd(int amount) {
    setState(() {
      if (_currentIntake < _goal) {
        _currentIntake = (_currentIntake + amount).clamp(0, _goal);
        if(_currentIntake == _goal){
          print("your goal is successful");
        }
      }
      else(
      print("your goal is over, please set new goal")
      );
    });
  }

  void _restWater(){
    setState(() {
      _currentIntake = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    double progress = (_currentIntake/_goal).clamp(0.0, 1.0);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Water Tracker',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 2,
                    )
                  ]),
              child: Column(
                children: [
                  Text(
                    "Today's Intake",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('${_currentIntake} ml',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  child: CircularProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey.shade500,
                    color: Colors.lightBlueAccent,
                    strokeWidth: 10,
                  ),
                ),
                Text('${(progress * 100).toInt()} %',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlueAccent))
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Wrap(
              spacing: 15,
              children: [
                AddWaterBtn(
                  amount: 100,
                  onClick: () => _waterAdd(100),
                ),
                AddWaterBtn(
                  amount: 200,
                  onClick: () => _waterAdd(200),
                ),
                AddWaterBtn(
                  amount: 300,
                  onClick: () => _waterAdd(300),
                ),
                AddWaterBtn(
                  amount: 500,
                  onClick: () => _waterAdd(500),
                ),
                AddWaterBtn(
                  amount: 1000,
                  onClick: () => _waterAdd(1000),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: ()=>_restWater(),
                    child: Text(
                      'Reset',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
