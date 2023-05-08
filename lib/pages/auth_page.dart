import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:map_translations/pages/home_actual.dart';
import 'package:map_translations/pages/home_page.dart';
import 'package:map_translations/pages/login_screen.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({ Key? key }) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream : FirebaseAuth.instance.authStateChanges(),
        builder: (context ,snapshot){
          if(snapshot.hasData){
            return HomeActual();

          }
          else{
            return LoginPage();
          }
        },
      ),
    );
  }
}