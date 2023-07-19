import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import './screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
        primarySwatch: Colors.blue,
        primaryColor: const Color.fromARGB(255, 4, 125, 141),
        actionIconTheme: ActionIconThemeData(
          drawerButtonIconBuilder: (context) => const Icon(
            Icons.menu,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
