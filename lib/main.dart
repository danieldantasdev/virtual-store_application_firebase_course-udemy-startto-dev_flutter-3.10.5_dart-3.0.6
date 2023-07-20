import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './models/models.dart';
import './screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScopedModel<User>(
      model: User(),
      child: MaterialApp(
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
            backButtonIconBuilder: (context) => const Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.white,
            ),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 4, 125, 141),
            foregroundColor: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
