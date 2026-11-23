import 'package:flutter/material.dart';
import 'package:pillproject/home_screen.dart';
import 'package:pillproject/login_screen.dart';


class Splash1 extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();

}

class _SplashState extends State<Splash1> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
       Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => homepage1()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Color(0xFF9AA6B2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'pillzy',
                style: TextStyle(
                  color: Color(0xFFF8FAFC),
                  fontFamily: 'Pacifico',
                  fontSize: 100,
                  shadows: [
                    Shadow(
                      offset: Offset(4, 4),
                      blurRadius: 10,
                      //color: Colors.white70.withOpacity(1),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
