import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kulina/ui/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food.id',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Listener(
        onPointerMove: (PointerMoveEvent event) async {},
        child: const MyHomePage(title: 'Food.id'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController searchInput = TextEditingController();

  _startUp() async {}

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    _startUp();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food.id',
      theme: ThemeData(
        primaryColor: const Color(0xFF2ecc71),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFFf27935),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
