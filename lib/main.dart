import 'package:flutter/material.dart';
 //Step 2 :app screen
import 'package:learn_flutter_67_2_2/frist_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Step 2 :app screen
    return MaterialApp(home:FristScreen());
  }
}