
import 'package:flutter/material.dart';

class home_2 extends StatefulWidget{
  home_2({super.key}) ;

  @override
  State<home_2> createState() => _home_2();
}


class _home_2 extends State<home_2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Image.asset(
                'assets/home1.jpg',
                height: 400,
                width: 400,
              ),),
            SizedBox(height: 15),
            Text(
              'Here you will see your schedule for the day',
              style: TextStyle(
                color: Color(0xFF243642),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ] ,
        )
    );
  }
}