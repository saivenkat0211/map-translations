import 'package:flutter/material.dart';
import 'package:map_translations/components/my_button.dart';
import 'package:map_translations/components/my_textfield.dart';
import 'package:map_translations/pages/auth_page.dart';
import 'package:map_translations/pages/home_actual.dart';
import 'package:map_translations/pages/home_page.dart';
import 'package:map_translations/pages/login_screen.dart';
import 'package:map_translations/pages/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});
 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'login page',
      theme: ThemeData(
        
        primarySwatch: Colors.cyan,
      ),
      home: LoginPage(),
    );
  }
}
