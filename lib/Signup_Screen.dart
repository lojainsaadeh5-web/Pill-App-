import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pillproject/healthcare.dart';
import 'package:pillproject/home_screen.dart';


class signupscree extends StatefulWidget {
  const signupscree({super.key});

  @override
  State<signupscree> createState() => _signupscreeState();
}

class _signupscreeState extends State<signupscree> {


  TextEditingController Email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFEBEAFF),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            child: Column(
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

                SizedBox(height: 15,),
                Text('Email') ,
                SizedBox(height:10,),
                TextFormField(
                  controller: Email,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Email',
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
                SizedBox(height: 15,),
                Text('Password') ,
                SizedBox(height:10,),
                TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Password',
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
                    ),
                  ),
                ),
                SizedBox(height: 150,),
                ElevatedButton(
                  onPressed: () async{
                    try {
                      final credential = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: Email.text,
                        password: password.text,
                      );
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => homepage1(),
                          ));
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                      }
                    } catch (e) {
                      print(e);
                    }

                  },
                  child: Text('Register' , style: TextStyle(color:  Colors.white),) ,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF9AA6B2),
                    minimumSize: Size(double.maxFinite ,60) ,
                  ),)
              ],
            ),

          ),),
      ),
    );
  }
}






























