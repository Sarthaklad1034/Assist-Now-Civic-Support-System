// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:mobile_app/l10n/app_localizations.dart';
// import 'package:mobile_app/providers/languageProvider.dart';
// import 'package:provider/provider.dart';
// import '../service/profilePageController.dart'; // your component
// import '../widgets/photoUploader.dart';
//
// class profilePage extends StatelessWidget {
//   const profilePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<profilePageController>(
//       init: profilePageController(),
//       builder: (controller) {
//         return Scaffold(
//           appBar: AppBar(
//             title: Text(AppLocalizations.of(context)!.account),
//             backgroundColor: const Color(0xFFFF6B35),
//           ),
//           body: SingleChildScrollView(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // 🔥 Profile Photo Picker Container
//                 Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFFF6B35),
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   child: Column(
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.all(16),
//                         decoration: const BoxDecoration(
//                           color: Colors.white,
//                           shape: BoxShape.circle,
//                         ),
//                         child: const Icon(
//                           Icons.camera_alt,
//                           color: Color(0xFFFF6B35),
//                           size: 32,
//                         ),
//                       ),
//                       const SizedBox(height: 12),
//                       Text(
//                         AppLocalizations.of(context)!.uploadProfilePhoto,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//
//                       PhotoUploader(
//                         photo: controller.profilePhoto,
//                         onPickCamera: controller.pickFromCamera,
//                         onPickGallery: controller.pickFromGallery,
//                         onRemove:
//                             controller.profilePhoto != null
//                                 ? controller.removePhoto
//                                 : null,
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 const SizedBox(height: 30),
//
//                 // 🔥 Name Field
//                 Text(
//                   AppLocalizations.of(context)!.name,
//                   style: TextStyle(fontWeight: FontWeight.w600),
//                 ),
//                 const SizedBox(height: 6),
//                 TextField(
//                   controller: controller.nameController,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     hintText: AppLocalizations.of(context)!.enterName,
//                   ),
//                 ),
//
//                 const SizedBox(height: 20),
//
//                 // 🔥 Email Field
//                 Text(
//                   AppLocalizations.of(context)!.email,
//                   style: TextStyle(fontWeight: FontWeight.w600),
//                 ),
//                 const SizedBox(height: 6),
//                 TextField(
//                   controller: controller.emailController,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     hintText: AppLocalizations.of(context)!.enterEmail,
//                   ),
//                 ),
//
//                 const SizedBox(height: 20),
//
//                 // 🔥 Language Dropdown
//                 Text(
//                   AppLocalizations.of(context)!.preferredLanguage,
//                   style: TextStyle(fontWeight: FontWeight.w600),
//                 ),
//                 const SizedBox(height: 6),
//
//                 DropdownMenu(
//                   initialSelection:
//                       context.watch<languageProvider>().selectedLocale,
//                   onSelected: (value) {
//                     context.read<languageProvider>().changeLanguage(
//                       value as String,
//                     );
//                   },
//                   dropdownMenuEntries:
//                       languageProvider.languages
//                            .map(
//                             (language) => DropdownMenuEntry(
//                               value: language['locale'],
//                               label: language['name'],
//                             ),
//                           )
//                           .toList(),
//                 ),
//
//                 const SizedBox(height: 30),
//
//                 // 🔥 Save Button
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                       backgroundColor: const Color(0xFFFF6B35),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     onPressed: controller.saveProfile,
//                     child: Text(
//                       AppLocalizations.of(context)!.save,
//                       style: TextStyle(fontSize: 16, color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/l10n/app_localizations.dart';
import 'package:mobile_app/providers/languageProvider.dart';
import 'package:provider/provider.dart';
import '../service/profilePageController.dart';
import '../widgets/photoUploader.dart';

class profilePage extends StatelessWidget {
  const profilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final profilePageController controller  = Get.find<profilePageController>();
    return GetBuilder<profilePageController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.account),
            backgroundColor: const Color(0xFFFF6B35),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // --- PROFILE PHOTO ---
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF6B35),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Color(0xFFFF6B35),
                          size: 32,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        AppLocalizations.of(context)!.uploadProfilePhoto,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),

                      PhotoUploader(
                        photo: controller.profilePhoto,
                        onPickCamera: controller.pickFromCamera,
                        onPickGallery: controller.pickFromGallery,
                        onRemove: controller.profilePhoto != null
                            ? controller.removePhoto
                            : null,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // --- NAME ---
                Text(
                  AppLocalizations.of(context)!.name,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 6),
                TextField(
                  controller: controller.nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: AppLocalizations.of(context)!.enterName,
                  ),
                ),

                const SizedBox(height: 20),

                // --- EMAIL ---
                Text(
                  AppLocalizations.of(context)!.email,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 6),
                TextField(
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: AppLocalizations.of(context)!.enterEmail,
                  ),
                ),

                const SizedBox(height: 20),

                // --- LANGUAGE DROPDOWN ---
                Text(
                  AppLocalizations.of(context)!.preferredLanguage,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 6),

                DropdownMenu(
                  initialSelection:
                  context.watch<languageProvider>().selectedLocale,
                  onSelected: (value) {
                    context
                        .read<languageProvider>()
                        .changeLanguage(value as String);

                    controller.updateLanguage(value);
                  },
                  dropdownMenuEntries: languageProvider.languages
                      .map(
                        (language) => DropdownMenuEntry(
                      value: language['locale'],
                      label: language['name'],
                    ),
                  )
                      .toList(),
                ),

                const SizedBox(height: 30),

                // --- SAVE ---
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: const Color(0xFFFF6B35),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: controller?.saveProfile,
                    child: Text(
                      AppLocalizations.of(context)!.save,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
