/// The above code defines two screens in a Flutter app, with the first screen checking internet
/// connectivity before navigating to the second screen.
// Step 2: App Screen
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//Step 3
import 'package:connectivity_plus/connectivity_plus.dart';

//Step 4 : Show toast message
import 'package:fluttertoast/fluttertoast.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}
            
class _FirstScreenState extends State<FirstScreen> {
  @override
  void initState() {
    super.initState();

//Step 3 : Check internet connection
    chechInternetConnection();
  }

  Future<void> chechInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    // This condition is for demo purposes only to explain every connection type.
    // Use conditions which work for your requirements.
    if (connectivityResult == ConnectivityResult.mobile) {
      // Mobile network available.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // Wi-fi is available.
      // Note for Android:
      // When both mobile and Wi-Fi are turned on system will return Wi-Fi only as active network type
    } else if (connectivityResult == ConnectivityResult.ethernet) {
      // Ethernet connection available.
    } else if (connectivityResult == ConnectivityResult.vpn) {
      // Vpn connection active.
      // Note for iOS and macOS:
      // There is no separate network interface type for [vpn].
      // It returns [other] on any device (also simulator)
    } else if (connectivityResult == ConnectivityResult.bluetooth) {
      // Bluetooth connection available.
    } else if (connectivityResult == ConnectivityResult.other) {
      // Connected to a network which is not in the above mentioned networks.
    } else if (connectivityResult == ConnectivityResult.none) {
      // No available network types
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.blue,
          size: 50.0,
        ),
      ),
    );
  }
}

//Step 4 : Show toast message
void _showToast(String msg){
  Fluttertoast.showToast(
    msg : msg,
    toastLength : Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor : Colors.green,
    textColor: Colors.white,
    fontSize:14.0,
  );
  _timer ();
}

//Step 4 : shoe toast Message
void _timer(){
  Timer(const Duration(seconds:3), 
    () => Navigator.push(
    context,
    MaterialPageRoute(builder:  (context) => SecondPage())
    ),
  );
}

void _showAleetDialog(BuildContext context, String title, String msg){
  showDialog(
      context: context,
      builder: (BuildContext context) {
     return AlertDialog(
     title: Text(
      title
      style: TextStyle(
        fontSize: 20,
        color: Colors.red
        fontFamily: "Alike",
        fontWeight: FontWeight.w500,

      ),
     ), 
      
      content: Text(msg),
      actions: <Widget>[
        ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.deepOrange),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text("OK", style: TextStyle(fontSize: 16, color: Colors.amber, fontFamily: "Alike" fontWeight: Fontweight.w500),)
        ),
      )
      (onPressed: onPressed, child: child),
      ],
     );
    }
    );
}
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Page')),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orangeAccent, Colors.deepOrange],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(0.6, 0.5),
            tileMode: TileMode.repeated,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Image.asset('assets/images/cartoon.jpg'),
              const SizedBox(height: 50),
              const SpinKitSpinningLines(color: Colors.white),
              const SizedBox(height: 30),
              const Text(
                'Welcome to the Second Page!',
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 253, 45, 191),
                  fontFamily: 'Alike',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}