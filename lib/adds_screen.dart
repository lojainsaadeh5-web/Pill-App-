import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pillproject/home_screen.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {

  TextEditingController medicationNameController = TextEditingController();
  TextEditingController doseController = TextEditingController();

  final List<String> reminderOptions = [
    'At time of event',
    'In 10 minutes',
    'In 15 minutes',
    'In 30 minutes',
    'In 1 hour',
    'No reminder',
  ];

  final List<String> dayOptions = [
    'Everyday',
    'Every other day',
    'Selected days',
  ];

  String? selectedReminder = 'No reminder';
  String? selectedDays = 'Everyday';
  TimeOfDay selectedTime = TimeOfDay.now();

  final List<Map<String, String>> medicationTypes = [
    {'icon': 'assets/tablet.png', 'label': 'Tablets'},
    {'icon': 'assets/drugs.png', 'label': 'Capsule'},
    {'icon': 'assets/injection.png', 'label': 'Injection'},
    {'icon': 'assets/eye-drops.png', 'label': 'Drops'},
  ];

  final List<Map<String, String>> mealTimes = [
    {'icon': 'assets/apple.png', 'label': 'Before meal'},
    {'icon': 'assets/core1.png', 'label': 'After meal'},
  ];

  int? selectedTypeIndex;
  int? selectedMealIndex;
  int isSelected = -1;

  final CollectionReference medications = FirebaseFirestore.instance.collection('medications');

  Future<void> addMedication() async {
    try {
      await medications.add({
        'Name': medicationNameController.text,
        'Dose': doseController.text,
        'uid': FirebaseAuth.instance.currentUser!.uid,
        'TypeIndex': selectedTypeIndex,
        'MealIndex': selectedMealIndex,
        'DoseTime': selectedTime.toString(),
        'Reminder': selectedReminder,
        'Days': selectedDays,
      });
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('Medication added successfully!')),
      // );
      medicationNameController.clear();
      doseController.clear();
      selectedMealIndex=-1;
      selectedTypeIndex=-1;

    } catch ($e) { // ?
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Failed to add medication: $error')),
      // );
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  Widget _buildGridItem({required Map<String, String> item, required bool isSelected, required VoidCallback onTap}){
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: isSelected ? Colors.blueGrey.shade600 : Colors.white,
        side: BorderSide(
          color: isSelected ? Colors.blueGrey.shade600 : Colors.grey.shade600,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            item['icon']!,
            width: 30,
            height: 30,
          ),
          const SizedBox(height: 8),
          Text(
            item['label']!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Medication',
          style: TextStyle(color: Color(0xFF1E3E62), fontSize: 25),
        ),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       Navigator.pushReplacement(
        //         context,
        //         MaterialPageRoute(builder: (context) => homepage1()),
        //       );
        //     },
        //     icon: const Icon(
        //       Icons.cancel_outlined,
        //       color: Color(0xFF1E3E62),
        //     ),
        //   ),
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView (
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Medication Types Grid
              Container(
                height: 150,
                child: GridView.builder (
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: medicationTypes.length,
                  itemBuilder: (context, index) {
                    return _buildGridItem(
                      item: medicationTypes[index],
                      isSelected: selectedTypeIndex == index,
                      onTap: () {
                        setState(() {
                          selectedTypeIndex =
                          selectedTypeIndex == index ? null : index;
                        });
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              Container(
                height: 150,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: mealTimes.length,
                  itemBuilder: (context , index ){
                    itemBuilder: (context, index) {
                      var type2 = mealTimes[index];
                      return _buildGridItem(
                        item: medicationTypes[index],
                        isSelected: selectedTypeIndex == index,
                        onTap: () {
                          setState(() {
                            selectedTypeIndex =
                            selectedTypeIndex == index ? null : index;
                          });
                        },
                      );
                  }; }

                ),
              ),
              // Medication Name Input
              const Text('Name', style: TextStyle(fontSize: 16)),
              TextFormField(
                controller: medicationNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter the name";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // Dose Input
              const Text('Dose', style: TextStyle(fontSize: 16)),
              TextFormField(
                controller: doseController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter the dose";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              // Time Selection
              ListTile(
                title: const Text('Dose Time',
                    style: TextStyle(fontSize: 16, color: Color(0xFF677D6A))),
                trailing: TextButton(
                  onPressed: () => selectTime(context),
                  child: Text(selectedTime.format(context)),
                ),
              ),
              const Divider(thickness: 1, color: Colors.grey),
              // Reminder Dropdown
              ListTile(
                title: const Text('Reminder',
                    style: TextStyle(color: Color(0xFF677D6A), fontSize: 16)),
                trailing: DropdownButton<String>(
                  value: selectedReminder,
                  items: reminderOptions
                      .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  ))
                      .toList(),
                  onChanged: (item) {
                    setState(() {
                      selectedReminder = item;
                    });
                  },
                ),
              ),
              const Divider(thickness: 1, color: Colors.grey),
              // Days Taken Dropdown
              ListTile(
                title: const Text('Days Taken',
                    style: TextStyle(color: Color(0xFF677D6A), fontSize: 16)),
                trailing: DropdownButton<String>(
                  value: selectedDays,
                  items: dayOptions
                      .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  ))
                      .toList(),
                  onChanged: (item) {
                    setState(() {
                      selectedDays = item;
                    });
                  },
                ),
              ),
              const SizedBox(height: 30),
              // Add Button
              ElevatedButton(
                onPressed: addMedication,
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF50727B),
                    minimumSize: Size(double.maxFinite ,60)
                ),
                child: const Text(
                  'Add',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}