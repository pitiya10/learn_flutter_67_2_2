//Step 2 :app screen
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FristScreen extends StatefulWidget {
  const FristScreen({super.key});

  @override
  State<FristScreen> createState() => _FristScreenState();
}

class _FristScreenState extends State<FristScreen> {
  @override
  //อะไรที่อยากให้ทำก่อนให้เขียนใน initState
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.push(
        context, 
        MaterialPageRoute(builder: (context) => SecondPage()),
      ),
    );
  }
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orangeAccent,Colors.deepOrange],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(0.6, 0.5),
          tileMode:TileMode.repeated,
          ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('./android/assets/images/app_screen.png'),
          const SizedBox(height: 50),
          const SpinKitSpinningLines(color: Colors.white),
          ],
        ),
      );
    }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(title: const Text('Second Page')),
      body: Center(
        child: Text('Welcome to the Second Page!',
          style: TextStyle(
            fontSize: 30,
            color: Colors.pinkAccent,
            fontFamily: "ALike",
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}


