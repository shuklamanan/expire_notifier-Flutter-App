import 'package:expire_notifier/firebase_options.dart';
import 'package:expire_notifier/pages/Homepage.dart';
import 'package:expire_notifier/screens/auth.screen.dart';
import 'package:expire_notifier/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Splashscreen();
            }
            if (snapshot.hasData) {
              return const HomePage();
            }
            return const AuthScreen();
          }),
      debugShowCheckedModeBanner: false,
    );
  }
}
