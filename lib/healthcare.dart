import 'package:flutter/material.dart';
import 'package:pillproject/home_screen.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class healthmonitoring extends StatefulWidget {
  healthmonitoring({super.key});

  @override
  State<healthmonitoring> createState() => _healthmonitoringState();
}

class _healthmonitoringState extends State<healthmonitoring> {
  int _currentIndex = 0;

//final CollectionReference medications = FirebaseFirestore.instance.collection('medications');
//   Future<void> addMedication() async {
//     try {
//       await medications.add({
//         'Name': medicationNameController.text,
//         'Dose': doseController.text,
//         'uid': FirebaseAuth.instance.currentUser!.uid,
//         'TypeIndex': selectedTypeIndex,
//         'MealIndex': selectedMealIndex,
//         'DoseTime': selectedTime.toString(),
//         'Reminder': selectedReminder,
//         'Days': selectedDays,
//       });
//
//       medicationNameController.clear();
//       doseController.clear();
//       selectedMealIndex=-1;
//       selectedTypeIndex=-1;
//
//     } catch ($e) {
//
//     }
//   }

  TextEditingController _bloodpressure = TextEditingController();
  TextEditingController _Weight = TextEditingController();
  TextEditingController _Temperature = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF8FAFC),
          title: Text(
            'Health Monitoring',
            style: TextStyle(color: Color(0xFF1E3E62)),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => homepage1()),
                );
              },
              icon: Icon(
                Icons.cancel_outlined,
                color: Color(0xFF1E3E62),
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xFFF8FAFC),
        body: Padding(
          padding: EdgeInsets.all(14),
          child: Column(
            children: [
              Card(
                child: ListTile(
                    title: Text('Blood pressure'),
                    subtitle: TextField(
                      decoration: InputDecoration(
                          hintText: 'Add measurement',
                          hintStyle:
                              TextStyle(color: Color(0xFFFF6500), fontSize: 12),
                          border: InputBorder.none),
                      controller: _bloodpressure,
                    ),
                    trailing: SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset('assets/blood.jpg'),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                child: ListTile(
                    title: Text('Weight'),
                    subtitle: TextField(
                      decoration: InputDecoration(
                          hintText: 'Add measurement',
                          hintStyle:
                              TextStyle(color: Color(0xFFFF6500), fontSize: 12),
                          border: InputBorder.none),
                      controller: _Weight,
                    ),
                    trailing: SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset('assets/weight.jpg'),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                child: ListTile(
                    title: Text('Temperature'),
                    subtitle: TextField(
                      decoration: InputDecoration(
                          hintText: 'Add measurement',
                          hintStyle:
                              TextStyle(color: Color(0xFFFF6500), fontSize: 12),
                          border: InputBorder.none),
                      controller: _Temperature,
                    ),
                    trailing: SizedBox(
                      child: Image.asset('assets/temperature.jpg' , height: 50,
                        width: 50,),
                    )),
              )
            ],
          ),
          // to add sized bos and card
        ),
      ),
    );
  }
}
