import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:map_translations/components/my_button.dart';
import 'package:map_translations/components/my_textfield.dart';
import 'package:map_translations/pages/home_page.dart';
import 'package:map_translations/pages/register_screen.dart';
class LoginPage extends StatefulWidget {
  //final Function()? onTap;
  const LoginPage({super.key});
  
  
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  void signUserIn() async{
    showDialog(
      context: context, builder: (context){
        return const Center(child: CircularProgressIndicator(),);

    },);
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    Navigator.pop(context);
    } on FirebaseAuthException catch(e){
      Navigator.pop(context);
      if(e.code == 'user-not-found'){
        wrongEmailMessage();
      }
      else if(e.code == 'wrong-password'){
        wrongPasswordMessage();
      }
    }
    //Navigator.pop(context);
  }
  void wrongEmailMessage(){
    showDialog(
      context:context,
      builder:(context){
        return const AlertDialog(title: Text("Incorrect Email"),);

      },
    );
  }
  void wrongPasswordMessage(){
    showDialog(
      context:context,
      builder:(context){
        return const AlertDialog(title: Text("Incorrect Password"),);

      },
    );
  }
  // void toSwitch(){
  //    Navigator.push(context, MaterialPageRoute(builder: ((context) => HomePage())));
  // }
  @override
 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.cyan[700],
      ),
      body: SafeArea(
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height:30),
              Icon(
                Icons.lock,
                size:80,),

                SizedBox(height:50),

              Text(
                'Welcome Back!',
                style:TextStyle(
                  color: Colors.grey[700],
                  fontSize: 24,
                ),
              ),

              SizedBox(height:30),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Email"),
                  ],
                ),
              ),
              SizedBox(height:10),
              
              MyTextField(
                controller: emailController,
                hintText: 'Enter Email',
                obscureText: false,
              ),

              SizedBox(height: 50),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Password"),
                  ],
                ),
              ),
              SizedBox(height:10),
              MyTextField(
                controller: passwordController,
                hintText: 'Enter Password',
                obscureText: true,
              ),
              SizedBox(height:10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Forgot Password?'),
                  ],
                ),
              ),
              SizedBox(height:50),
              MyButton(
                
                onTap: signUserIn,
                //toSwitch: toSwitch,
                whattodo: 'Sign In',
              ),
              SizedBox(height:50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text("New around here?"),
                  SizedBox(width:4),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: ((context) => RegisterPage())));
                    },
                    child: Text(
                      'Register Here',
                      style: TextStyle(
                      color: Colors.blue,fontWeight: FontWeight.bold),
                    ),
                    ),
                    
                  

                ],
              ),



            ],
            
            

          )
        )
        
      )
      
      )
    );
  }
}