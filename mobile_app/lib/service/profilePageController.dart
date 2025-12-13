// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
//
// class ProfileController extends GetxController {
//   File? profilePhoto;
//
//   final nameController = TextEditingController();
//   final emailController = TextEditingController();
//
//   // 🔥 Replace this list later with localization languages
//   final List<String> languages = [
//     "English",
//     "Hindi",
//     "Marathi",
//     "Gujarati",
//     "Tamil",
//     "Telugu",
//     "Bengali",
//     "Kannada",
//     "Malayalam",
//     "Odia",
//   ];
//
//   String? selectedLanguage;
//
//   // --- PHOTO PICKER FUNCTIONS ---
//
//   Future<void> pickFromCamera() async {
//     final picked = await ImagePicker().pickImage(source: ImageSource.camera);
//     if (picked != null) {
//       profilePhoto = File(picked.path);
//       update();
//     }
//   }
//
//   Future<void> pickFromGallery() async {
//     final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (picked != null) {
//       profilePhoto = File(picked.path);
//       update();
//     }
//   }
//
//   void removePhoto() {
//     profilePhoto = null;
//     update();
//   }
//
//   // --- LANGUAGE SELECT ---
//   void updateLanguage(String? value) {
//     selectedLanguage = value;
//     update();
//   }
//
//   // --- SAVE PROFILE ---
//   void saveProfile() {
//     // TODO: Connect to Firestore or backend
//     Get.snackbar(
//       "Success",
//       "Profile updated successfully",
//       snackPosition: SnackPosition.BOTTOM,
//     );
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class profilePageController extends GetxController {
  File? profilePhoto;

  final nameController = TextEditingController();
  final emailController = TextEditingController();

  String? selectedLanguage;

  @override
  void onInit() {
    super.onInit();
    selectedLanguage = null; // will be set by provider/default config
  }

  // --- PHOTO PICKER FUNCTIONS ---
  Future<void> pickFromCamera() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.camera);
    if (picked != null) {
      profilePhoto = File(picked.path);
      update();
    }
  }

  Future<void> pickFromGallery() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      profilePhoto = File(picked.path);
      update();
    }
  }

  void removePhoto() {
    profilePhoto = null;
    update();
  }

  // --- LANGUAGE SELECT ---
  void updateLanguage(String? value) {
    selectedLanguage = value;
    update();
  }

  // --- SAVE PROFILE ---
  void saveProfile() {
    Get.snackbar(
      "Success",
      "Profile updated successfully",
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
