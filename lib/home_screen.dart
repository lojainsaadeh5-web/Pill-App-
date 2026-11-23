import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pillproject/Profile.dart';
import 'package:pillproject/adds_screen.dart';
import 'package:pillproject/getdata.dart';
import 'package:pillproject/healthcare.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pillproject/login_screen.dart';

class homepage1 extends StatefulWidget {
  homepage1({super.key});

  @override
  State<homepage1> createState() => _Homepage1State();
}

class _Homepage1State extends State<homepage1> {
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

  List data = [];
  int _selectedIndex = 0;
  PageController _pageController = PageController();

  getdata() async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("medications")
          .where("uid", isEqualTo: uid)
          .get();

      setState(() {
        data = querySnapshot.docs;
      });
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

//
//
// Widget _buildGridItem({required Map<String, String> item, required bool isSelected, required VoidCallback onTap}){
//   return ElevatedButton(
//     onPressed: onTap,
//     style: ElevatedButton.styleFrom(
//       shape: const CircleBorder(),
//       backgroundColor: isSelected ? Colors.blueGrey.shade600 : Colors.white,
//       side: BorderSide(
//         color: isSelected ? Colors.blueGrey.shade600 : Colors.grey.shade600,
//         width: 2,
//       ),
//     ),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Image.asset(
//           item['icon']!,
//           width: 30,
//           height: 30,
//         ),
//         const SizedBox(height: 8),
//         Text(
//           item['label']!,
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontSize: 10,
//             color: isSelected ? Colors.white : Colors.black,
//           ),
//         ),
//       ],
//     ),
//   );
// }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color(0xFFF8FAFC),
      bottomNavigationBar: GNav(
        gap: 8,
        backgroundColor: Colors.transparent,
        color: Color(0xFFFF6500), // change the color
        activeColor: Color(0xFFFF6500),
        tabBackgroundColor: Colors.white70,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
          _pageController.jumpToPage(index);
        },
        tabs: [
          GButton(icon: Icons.calendar_month_outlined, text: 'Calendar'),
          GButton(icon: Icons.add_box_outlined, text: 'Health'),
          GButton(icon: Icons.account_circle_outlined, text: 'Person'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF243642),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddScreen()),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: PageView (
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          data.isEmpty
              ? home_2() :
      ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, i) {
        // تحقق من قيمة TypeIndex وتأكد من أنها تقع ضمن النطاق الصالح
        int typeIndex = data[i]["TypeIndex"] != null &&
            data[i]["TypeIndex"] is int &&
            data[i]["TypeIndex"] >= 0 &&
            data[i]["TypeIndex"] < medicationTypes.length
            ? data[i]["TypeIndex"] as int
            : 0; // استخدم القيمة الافتراضية 0 إذا كانت خارج النطاق أو null

        return Card(
          child: ListTile(
            leading: Image.asset(
              medicationTypes[typeIndex]["icon"] ?? 'assets/default_icon.png', // صورة افتراضية إذا كانت null
            ),
            title: Text(
              "${data[i]['Name']}",
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text(" ${data[i]['Dose']} Doses"),
            trailing: Column(
              children: [
                Text('${data[i]['Days']}, ${data[i]['Reminder']}'),
                Text(
                    data[i]['MealIndex'] == '1' ? "(After Meal)" : "(Before Meal)"),
              ],
            ),
            isThreeLine: true,
            
          ),
        );
      },
    ),
    healthmonitoring(),
          profilescreen(),
          // Add more pages here
        ],
      ),
    );
  }
}
