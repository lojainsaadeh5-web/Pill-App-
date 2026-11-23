import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pillproject/healthcare.dart';
import 'package:pillproject/home_screen.dart';
import 'package:pillproject/Signup_Screen.dart';


class  loginscreen extends StatefulWidget {
  loginscreen({super.key});
  @override
  State<loginscreen> createState() => _LoginState();
}

class _LoginState extends State<loginscreen> {

  TextEditingController username  = TextEditingController();
  TextEditingController password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFEBEAFF),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              child: Column (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 50,),
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300 ,
                          borderRadius: BorderRadius.circular(70)
                      ),
                      child: Image.asset(
                        'assets/Writing.jpeg' ,
                        width: 50 ,
                        height: 50,),
                    ),
                  ) ,
                  SizedBox(height:50,) ,
                  Text('Email') ,
                  SizedBox(height:10,) ,
                  TextFormField(
                    controller: username,
                    decoration: InputDecoration(
                        hintText: 'Enter Your Email',
                        hintStyle: TextStyle(fontSize: 12 , color: Colors.grey.shade600),
                        contentPadding: EdgeInsets.symmetric(vertical: 4,  horizontal: 15),
                        filled: true ,
                        fillColor: Colors.white70  ,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10) ,
                            borderSide: BorderSide(color: Colors.grey)
                        ) ,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(color: Colors.grey)
                        )
                    ),
                  ),
                  SizedBox(height: 15,),
                  Text('Password') ,
                  SizedBox(height:10,) ,
                  TextFormField(
                    controller: password,
                    decoration: InputDecoration(
                      hintText: 'Enter Your Password',
                      hintStyle: TextStyle(fontSize: 12 , color: Colors.grey.shade600),
                      contentPadding: EdgeInsets.symmetric(vertical: 4,  horizontal: 15),
                      filled: true ,
                      fillColor: Colors.white70 ,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10) ,
                          borderSide: BorderSide(color: Colors.grey)
                      ) ,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(color: Colors.grey)
                      ),
                    ),
                  ),
                  SizedBox(height: 40,),
                  Row(
                    children: [
                      SizedBox(width: 8,),
                      Container(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: (){
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context ) => signupscree())
                              );
                            },
                            child: Text( 'Sign up' , style: TextStyle( fontSize: 14 , color: Colors.grey.shade600),),)
                      ) ,
                      SizedBox(width: 180,),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text('Forgot Password?' , style: TextStyle(fontSize: 14 , color: Colors.grey.shade900),),
                      )
                    ],
                  ) ,
                  SizedBox(height: 30,) ,
                  ElevatedButton(
                      onPressed: () async{
                        try {
                          final credential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                              email: username.text,
                              password: password.text);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => homepage1(),
                              ));
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            print('No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            print('Wrong password provided for that user.');
                          }
                        }
                      },
                      child: Text('Login' , style: TextStyle(color: Colors.white), ) ,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF9AA6B2),
                      minimumSize: Size(double.maxFinite ,60) ,
                      //fixedSize: Size(200, 60)
                    ),),
                ],
              ),
            ),
          )
      ),
    );
  }
}
