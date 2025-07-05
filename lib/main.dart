import 'package:flutter/material.dart';
 //Step 2 :app screen
import 'package:learn_flutter_67_2_2/frist_screen.dart';

import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Step 2 :app screen
    return MaterialApp(home: FirstScreen());
  }
}