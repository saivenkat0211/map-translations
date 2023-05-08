import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:map_translations/components/my_button.dart';
import 'package:map_translations/components/my_textfield.dart';
import 'package:map_translations/pages/email_otp.dart';
import 'package:map_translations/pages/home_page.dart';
import 'package:email_otp/email_otp.dart';
import 'login_screen.dart';
import 'mobile_otp.dart';
class RegisterPage extends StatefulWidget {
  //final Function()? onTap;
  const RegisterPage({super.key});
  
  
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final usernameController = TextEditingController();
  final mailotp = TextEditingController();
  
  EmailOTP myauth = EmailOTP();
  // void signUserUp() async {
  //     if (await myauth.verifyOTP(otp: mailotp.text) == true) {
  //       try {
  //         UserCredential userCredential = await FirebaseAuth.instance
  //             .createUserWithEmailAndPassword(
  //                 email: emailController.text, password: passwordController.text);

  //         var db = FirebaseFirestore.instance;

  //         final person_x = <String, String>{
  //           "Name": usernameController.text,
  //           "Mail": emailController.text,
  //           "Password": passwordController.text,
  //         };

  //         db
  //             .collection("users")
  //             .doc("man")
  //             .set(person_x)
  //             .onError((e, _) => print("Error writing document: $e"));

  //         Navigator.push(context,
  //             MaterialPageRoute(builder: (context) => HomePage()));
  //       } on FirebaseAuthException catch (e) {
  //         if (e.code == 'weak-password') {
  //           showErrorMessage(e.code);
  //           // ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //         } else if (e.code == 'email-already-in-use') {
  //           // print('The account already exists for that email.');
  //           // const snackBar = SnackBar(
  //           //   content: Text('email-already-in-use'),
  //           // );
  //           // ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //           showErrorMessage(e.code);
  //         }
  //       } catch (e) {
  //         print(e);
  //       }
  //     } else {
  //       showErrorMessage("Incorrect otp");
  //       //ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //     }
  //   }
  // void signUserUp() async{
  //   showDialog(
  //     context: context, builder: (context){
  //       return const Center(child: CircularProgressIndicator(),);

  //   },);
    // try{
    //   if(passwordController.text == confirmpasswordController.text){
    //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
    //   email: emailController.text,
    //   password: passwordController.text,
    //   );
    //   // Navigator.pop(context);
    //   // Navigator.push(context, MaterialPageRoute(builder: ((context) => HomePage())));
    //   }
    //   if(passwordController.text!= confirmpasswordController.text){
    //     Navigator.pop(context);
    //     showErrorMessage("Password's do not match");
    //     return;
        
    //   }
    
    // Navigator.pop(context);
    // }
    //we create a collection called users and then we create documents with the uid of the user 
  //   try{
  //     if(passwordController.text == confirmpasswordController.text){
  //     UserCredential res = await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //           email: emailController.text, password: passwordController.text);
  //       //store user data in firebase database
  //       await FirebaseFirestore.instance.collection('users').doc(res.user!.uid).set({
  //         'uid': res.user!.uid,
  //         'username': usernameController.text,
  //         'email': emailController.text,
  //         'password': passwordController.text,
  //       });
  //       Navigator.push(context, MaterialPageRoute(builder: ((context) => HomePage())));

  //       //Navigator.pop(context);
  //       }
  //     if(passwordController.text!= confirmpasswordController.text){
  //       //Navigator.pop(context);
  //       showErrorMessage("Password's do not match");
  //       return;
        
  //     }
  //  } on FirebaseAuthException catch(e){
  //     //Navigator.pop(context);
  //     showErrorMessage(e.code);
  //   }
  //   //Navigator.pop(context);
  // }
  void showErrorMessage(String s){
    showDialog(
      context:context,
      builder:(context){
        return AlertDialog(title: Center(child: Text(s),) );

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
        title: Text("Register"),
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
                'Create an Account',
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
                    Text("Username"),
                  ],
                ),
              ),
              SizedBox(height:10),
              
              MyTextField(
                controller: usernameController,
                hintText: 'Enter Username',
                obscureText: false,
              ),
              SizedBox(height: 20),
              
              
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
              
              
              SizedBox(height: 20),
              
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
              // SizedBox(height:20),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       Text("Confirm Password"),
              //     ],
              //   ),
              // ),
              // SizedBox(height:10),
              // MyTextField(
              //   controller: confirmpasswordController,
              //   hintText: 'Confirm Password',
              //   obscureText: true,
              // ),
              // SizedBox(height:10),
              
              // SizedBox(height:50),
              // MyButton(
              //   onTap: signUserUp,
              //   //toSwitch: toSwitch, 
              //   whattodo: 'Sign Up',
              // ),
              SizedBox(height: 20),
              
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("OTP"),
                  ],
                ),
              ),
              SizedBox(height:10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    //width: 300,
                    child: TextField(
                      controller: mailotp,
                      // keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintText: 'Enter OTP',
                          suffixIcon: TextButton(
                            child: Text("Send OTP"),
                            onPressed: () async {
                              myauth.setConfig(
                                appEmail: "20bd1a6638@gmail.com",
                                appName: "Email OTP",
                                userEmail: emailController.text,
                                otpLength: 6,
                                otpType: OTPType.digitsOnly,
                              );
                              if (await myauth.sendOTP() == true) {
                                print("OTP sent successfully");
                              } else {
                                print("OTP could not be sent");
                                const snackBar = SnackBar(
                                  content: Text('Please enter valid Email Id'),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                  ),
                  SizedBox(height:30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Text("Mobile OTP"),
                      SizedBox(width:4),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: ((context) => phone_otp())));
                        },
                        //onTap: widget.onTap,
                        child: Text(
                          'Mobile OTP',
                          style: TextStyle(
                              color: Colors.blue,fontWeight: FontWeight.bold),
                        ),
                      ),],),
                  //
                  GestureDetector(
                    onTap:() async {
                if (await myauth.verifyOTP(otp: mailotp.text) == false) {
                  try {
                    UserCredential userCredential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: emailController.text, password: passwordController.text);

                    var db = FirebaseFirestore.instance;

                    final person_x = <String, String>{
                      "username": usernameController.text,
                      "email": emailController.text,
                      "password": passwordController.text,
                    };

                    db
                        .collection("users")
                        .doc()
                        .set(person_x)
                        .onError((e, _) => print("Error writing document: $e"));

                    // ignore: use_build_context_synchronously
                    Navigator.push(context,MaterialPageRoute(builder: (context) => const HomePage()));
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                      const snackBar = SnackBar(
                        content: Text('The password provided is too weak.'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                      const snackBar = SnackBar(
                        content: Text('email-already-in-use'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  } catch (e) {
                    print(e);
                  }
                } else {
                  const snackBar = SnackBar(
                    content: Text('Incorrect OTP entered'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
                    child:Container(
                      padding : EdgeInsets.all(25),
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30),
                      ),


                    child: Center(
                      child:Text(
                        "SignUp",
                        style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        ),
                      ),

                    ),),
                  ),

              SizedBox(height:50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text("Already Have an Account?"),
                  SizedBox(width:4),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: ((context) => LoginPage())));
                    },
                    //onTap: widget.onTap,
                    child: Text(
                      'Login Here',
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