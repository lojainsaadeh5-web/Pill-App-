// final CollectionReference medications = FirebaseFirestore.instance.collection('medications');
// Future<void> addMedication() async {
//   try {
//     await medications.add({
//       'Name': medicationNameController.text,
//       'Dose': doseController.text,
//       'uid': FirebaseAuth.instance.currentUser!.uid,
//       'TypeIndex': selectedTypeIndex,
//       'MealIndex': selectedMealIndex,
//       'DoseTime': selectedTime.toString(),
//       'Reminder': selectedReminder,
//       'Days': selectedDays,
//     });
//     // ScaffoldMessenger.of(context).showSnackBar(
//     //   const SnackBar(content: Text('Medication added successfully!')),
//     // );
//     medicationNameController.clear();
//     doseController.clear();
//     selectedMealIndex=-1;
//     selectedTypeIndex=-1;
//
//   } catch ($e) { // ?
//     // ScaffoldMessenger.of(context).showSnackBar(
//     //   SnackBar(content: Text('Failed to add medication: $error')),
//     // );
//   }
// }


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