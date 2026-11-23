import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pillproject/home_screen.dart';

import 'login_screen.dart';



class profilescreen extends StatefulWidget {
  const profilescreen({super.key});

  @override
  State<profilescreen> createState() => _profilescreenState();
}

class _profilescreenState extends State<profilescreen> {
  TextEditingController username = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF8FAFC),
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => loginscreen()));
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      backgroundColor: Color(0xFFF8FAFC),
      body: Padding(
          padding: EdgeInsets.all(14) ,
      child: Container(
        child:Column(
          children: [
            Card(
              child: ListTile(
                  title: Text('Your Name'),
                  subtitle: TextField(
                    decoration: InputDecoration(
                        hintText: 'Name',
                        hintStyle:
                        TextStyle(color: Color(0xFFFF6500), fontSize: 12),
                        border: InputBorder.none),
                    controller: username,
                  ),
              trailing: Image.asset('assets/woman.png' , )),
            ),
            SizedBox(height: 10,),
            Card(
              child: ListTile(
                title: Text('Change Password '),
                subtitle: TextField(
                  decoration: InputDecoration(
                      hintText: 'Name',
                      hintStyle:
                      TextStyle(color: Color(0xFFFF6500), fontSize: 12),
                      border: InputBorder.none),
                  controller: username,
                ),
                trailing: Image.asset('assets/ResetPassword.jpeg'),
              ),
            )
          ],
        )
        ),
      ),
    );
  }
}
