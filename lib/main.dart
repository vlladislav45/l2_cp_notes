import 'package:flutter/material.dart';
import 'package:l2_notes/routes/route.dart';
import 'package:l2_notes/widgets/home_page.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await firebase_core.Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyApp> {
  final AppRouter _router = AppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      onGenerateRoute: _router.onGenerateRoute,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _router.dispose();
  }
}