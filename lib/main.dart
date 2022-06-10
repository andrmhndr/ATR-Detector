import 'package:atrdetector/constants.dart';
import 'home/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MainApps());
}

class MainApps extends StatelessWidget {
  const MainApps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ATR-Detector",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: thisBackgroundColor,
        primaryColor: thisPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: thisTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
