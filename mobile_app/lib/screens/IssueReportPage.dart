// import 'package:flutter/material.dart';
// import 'package:mobile_app/l10n/app_localizations.dart';
// import 'package:provider/provider.dart';
// import '../widgets/issueTypeCard.dart';
// import '../widgets/prioritySelector.dart';
// import '../widgets/photoUploader.dart';
// import '../widgets/locationTile.dart';
// import '../providers/reportProvider.dart';
// import '../models/issueModel.dart';
//
// class IssueReportPage extends StatefulWidget {
//   const IssueReportPage({super.key});
//
//   @override
//   State<IssueReportPage> createState() => _IssueReportPageState();
// }
//
// class _IssueReportPageState extends State<IssueReportPage> {
//   final TextEditingController _controller = TextEditingController();
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final p = context.watch<reportProvider>();
//
//     return Scaffold(
//       backgroundColor: const Color(0xFF2C3E50),
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF2C3E50),
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: Row(
//           children: [
//             Icon(Icons.location_city, color: Colors.orange[400], size: 24),
//             const SizedBox(width: 8),
//              Text(
//               AppLocalizations.of(context)!.newIssue,
//               style: TextStyle(color: Colors.white, fontSize: 18),
//             ),
//           ],
//         ),
//         actions: [
//           const CircleAvatar(
//             radius: 18,
//             backgroundImage: NetworkImage('https://via.placeholder.com/150'),
//           ),
//           const SizedBox(width: 16),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Photo Upload Section
//                   Container(
//                     width: double.infinity,
//                     padding: const EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFFF6B35),
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     child: Column(
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.all(16),
//                           decoration: const BoxDecoration(
//                             color: Colors.white,
//                             shape: BoxShape.circle,
//                           ),
//                           child: const Icon(
//                             Icons.camera_alt,
//                             color: Color(0xFFFF6B35),
//                             size: 32,
//                           ),
//                         ),
//                         const SizedBox(height: 12),
//                          Text(
//                           AppLocalizations.of(context)!.addPhoto,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         PhotoUploader(
//                           photo: p.issue.photo,
//                           onPickCamera: p.pickFromCamera,
//                           onPickGallery: p.pickFromGallery,
//                           onRemove: p.issue.photo != null ? p.removePhoto : null,
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//
//                   // Progress Indicators
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       _buildStepIndicator('1', true, 'Photo'),
//                       _buildStepLine(true),
//                       _buildStepIndicator('2', p.issue.address != null, AppLocalizations.of(context)!.location),
//                       _buildStepLine(p.issue.address != null),
//                       _buildStepIndicator('3', p.issue.description != null && p.issue.category!=null, AppLocalizations.of(context)!.details),
//                       _buildStepLine(p.issue.description != null && p.issue.category != null),
//                       _buildStepIndicator('✓', false, AppLocalizations.of(context)!.done),
//                     ],
//                   ),
//                   const SizedBox(height: 30),
//
//                   // Issue Type
//                    Text(
//                     AppLocalizations.of(context)!.issueType,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   GridView.count(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     crossAxisCount: 4,
//                     mainAxisSpacing: 12,
//                     crossAxisSpacing: 12,
//                     children: [
//                       issueTypeCard(
//                         icon: Icons.directions_car,
//                         label: AppLocalizations.of(context)!.pothole,
//                         category: 'Pothole',
//                       ),
//                       issueTypeCard(
//                         icon: Icons.lightbulb_outline,
//                         label: AppLocalizations.of(context)!.streetFilled,
//                         category: 'Streetlight',
//                       ),
//                       issueTypeCard(
//                         icon: Icons.water_drop_outlined,
//                         label: AppLocalizations.of(context)!.leakWaste,
//                         category: 'Water leak',
//                       ),
//                       issueTypeCard(
//                         icon: Icons.more_horiz,
//                         label: AppLocalizations.of(context)!.other,
//                         category: 'Other',
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 30),
//
//                   // Description
//                    Text(
//                      AppLocalizations.of(context)!.description,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   Container(
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             const Expanded(
//                               child: Text(
//                                 'Detailed Description (Optional)',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                             ),
//                             IconButton(
//                               icon: Icon(
//                                 p.isListening ? Icons.stop : Icons.mic,
//                                 color: p.isListening ? Colors.red : const Color(0xFF3498DB),
//                               ),
//                               onPressed: () => p.toggleListen(_controller),
//                             ),
//                           ],
//                         ),
//                         TextField(
//                           controller: _controller,
//                           maxLines: 3,
//                           onChanged: p.setDescription,
//                           decoration: const InputDecoration(
//                             border: InputBorder.none,
//                             hintText: 'Add details about the issue...',
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//
//                   // Location
//                   LocationTile(
//                     address: p.issue.address,
//                     loading: p.isGettingLocation,
//                     onRefresh: p.refreshLocation,
//                   ),
//
//                   const SizedBox(height: 16),
//
//                   // Priority (using your existing widget)
//                   Container(
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     child: PrioritySelector(
//                       value: p.issue.priority ?? IssuePriority.low,
//                       onChanged: p.setPriority,
//                     ),
//                   ),
//
//                   if (p.error != null) ...[
//                     const SizedBox(height: 16),
//                     Container(
//                       padding: const EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         color: Colors.red.shade100,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Text(
//                         p.error!,
//                         style: const TextStyle(color: Colors.red),
//                       ),
//                     ),
//                   ],
//                 ],
//               ),
//             ),
//           ),
//           // Submit Button
//           Container(
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.1),
//                   blurRadius: 10,
//                 ),
//               ],
//             ),
//             child: SafeArea(
//               child: SizedBox(
//                 width: double.infinity,
//                 height: 54,
//                 child: ElevatedButton(
//                   onPressed: p.isSubmitting
//                       ? null
//                       : () async {
//                     final ok = await p.submit();
//                     if (ok && context.mounted) {
//                       Navigator.pop(context);
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFFFF6B35),
//                     foregroundColor: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     elevation: 0,
//                   ),
//                   child: p.isSubmitting
//                       ? const CircularProgressIndicator(color: Colors.white)
//                       :  Text(
//                     AppLocalizations.of(context)!.submitReport,
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildStepIndicator(String label, bool isActive, String text) {
//     return Column(
//       children: [
//         Container(
//           width: 36,
//           height: 36,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: isActive ? const Color(0xFFFF6B35) : Colors.grey[400],
//           ),
//           child: Center(
//             child: Text(
//               label,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 14,
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(height: 4),
//         Text(
//           text,
//           style: TextStyle(
//             color: isActive ? Colors.white : Colors.grey[400],
//             fontSize: 10,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildStepLine(bool isActive) {
//     return Container(
//       width: 30,
//       height: 2,
//       color: isActive ? const Color(0xFFFF6B35) : Colors.grey[400],
//       margin: const EdgeInsets.only(bottom: 20),
//     );
//   }
//
//   Widget _buildIssueTypeCard(IconData icon, String label, String category, reportProvider p) {
//     final isSelected = p.issue.category == category;
//     return GestureDetector(
//       onTap: () => p.setCategory(category),
//       child: Container(
//         decoration: BoxDecoration(
//           color: isSelected ? const Color(0xFFFF6B35) : Colors.white,
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(
//             color: isSelected ? const Color(0xFFFF6B35) : Colors.grey[300]!,
//             width: 2,
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               icon,
//               color: isSelected ? Colors.white : const Color(0xFF2C3E50),
//               size: 28,
//             ),
//             const SizedBox(height: 8),
//             Text(
//               label,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 11,
//                 color: isSelected ? Colors.white : const Color(0xFF2C3E50),
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//version 2
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../l10n/app_localizations.dart';
// import '../widgets/prioritySelector.dart';
// import '../widgets/photoUploader.dart';
// import '../widgets/locationTile.dart';
// import '../providers/reportProvider.dart';
// import '../models/issueModel.dart';
//
// class IssueReportPage extends StatefulWidget {
//   const IssueReportPage({super.key});
//
//   @override
//   State<IssueReportPage> createState() => _IssueReportPageState();
// }
//
// class _IssueReportPageState extends State<IssueReportPage> {
//   final TextEditingController _controller = TextEditingController();
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final p = context.watch<reportProvider>();
//
//     return Scaffold(
//       backgroundColor: const Color(0xFF2C3E50),
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF2C3E50),
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: Row(
//           children: [
//             Icon(Icons.location_city, color: Colors.orange[400], size: 24),
//             const SizedBox(width: 8),
//             const Text(
//               'Report New Issue',
//               style: TextStyle(color: Colors.white, fontSize: 18),
//             ),
//           ],
//         ),
//         actions: [
//           const CircleAvatar(
//             radius: 18,
//             backgroundImage: NetworkImage('https://via.placeholder.com/150'),
//           ),
//           const SizedBox(width: 16),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Photo Upload Section
//                   Container(
//                     width: double.infinity,
//                     padding: const EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFFF6B35),
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     child: Column(
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.all(16),
//                           decoration: const BoxDecoration(
//                             color: Colors.white,
//                             shape: BoxShape.circle,
//                           ),
//                           child: const Icon(
//                             Icons.camera_alt,
//                             color: Color(0xFFFF6B35),
//                             size: 32,
//                           ),
//                         ),
//                         const SizedBox(height: 12),
//                          Text(
//                           AppLocalizations.of(context)!.addPhoto,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         PhotoUploader(
//                           photo: p.issue.photo,
//                           onPickCamera: p.pickFromCamera,
//                           onPickGallery: p.pickFromGallery,
//                           onRemove: p.issue.photo != null ? p.removePhoto : null,
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//
//                   // Progress Indicators
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       // Step 1: Photo (always active if on this page)
//                       _buildStepIndicator('1', p.issue.photo != null, 'Photo'),
//                       _buildStepLine(p.issue.photo != null),
//
//                       // Step 2: Issue Type (active when category selected)
//                       _buildStepIndicator('2', p.issue.category != null, AppLocalizations.of(context)!.details),
//                       _buildStepLine(p.issue.category != null),
//
//                       // Step 3: Description & Location (active when both filled)
//                       _buildStepIndicator('3', p.issue.description != null && p.issue.address != null, AppLocalizations.of(context)!.location),
//                       _buildStepLine(p.issue.description != null && p.issue.address != null && p.issue.priority != null),
//
//                       // Step 4: Done (active when all required fields complete)
//                       _buildStepIndicator('✓',
//                           p.issue.photo != null &&
//                               p.issue.category != null &&
//                               p.issue.description != null &&
//                               p.issue.address != null &&
//                               p.issue.priority != null,
//                           'Done'),
//                     ],
//                   ),
//                   const SizedBox(height: 30),
//
//                   // Issue Type
//                    Text(
//                     AppLocalizations.of(context)!.issueType,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   GridView.count(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     crossAxisCount: 4,
//                     mainAxisSpacing: 12,
//                     crossAxisSpacing: 12,
//                     children: [
//                       _buildIssueTypeCard(Icons.directions_car, AppLocalizations.of(context)!.pothole, 'Pothole', p),
//                       _buildIssueTypeCard(Icons.streetview, AppLocalizations.of(context)!.streetFilled, 'Street filled', p),
//                       _buildIssueTypeCard(Icons.water_drop_outlined, AppLocalizations.of(context)!.leakWaste, 'Water leak', p),
//                       _buildIssueTypeCard(Icons.camera_outdoor_sharp, AppLocalizations.of(context)!.animalControl, 'Animal control', p),
//                       _buildIssueTypeCard(Icons.lightbulb_outline, AppLocalizations.of(context)!.electricity, 'Electricity', p),
//                       _buildIssueTypeCard(Icons.delete_outline, AppLocalizations.of(context)!.garbage, 'Garbage', p),
//                       _buildIssueTypeCard(Icons.remove_road_outlined, AppLocalizations.of(context)!.roadBlock, 'Road block', p),
//                       _buildIssueTypeCard(Icons.public_rounded, AppLocalizations.of(context)!.publicSpaces, 'Public spaces', p),
//                       _buildIssueTypeCard(Icons.electrical_services, AppLocalizations.of(context)!.electrical, 'Electrical', p),
//                       _buildIssueTypeCard(Icons.forest, AppLocalizations.of(context)!.parkDamage, 'Park damage', p),
//                       _buildIssueTypeCard(Icons.fire_extinguisher, AppLocalizations.of(context)!.fireDamage, 'Fire damage', p),
//                       _buildIssueTypeCard(Icons.more_horiz, AppLocalizations.of(context)!.other, 'Other', p),
//
//                       _buildIssueTypeCard(Icons.more_horiz_sharp, AppLocalizations.of(context)!.other, 'Other', p),
//                     ],
//                   ),
//                   const SizedBox(height: 30),
//
//                   // Description
//                   const Text(
//                     'Description',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   Container(
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             const Expanded(
//                               child: Text(
//                                 'Detailed Description (Optional)',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                             ),
//                             IconButton(
//                               icon: Icon(
//                                 p.isListening ? Icons.stop : Icons.mic,
//                                 color: p.isListening ? Colors.red : const Color(0xFF3498DB),
//                               ),
//                               onPressed: () => p.toggleListen(_controller),
//                             ),
//                           ],
//                         ),
//                         TextField(
//                           controller: _controller,
//                           maxLines: 3,
//                           onChanged: p.setDescription,
//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             hintText: AppLocalizations.of(context)!.detailedDescription,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//
//                   // Location
//                   LocationTile(
//                     address: p.issue.address,
//                     loading: p.isGettingLocation,
//                     onRefresh: p.refreshLocation,
//                   ),
//
//                   const SizedBox(height: 16),
//
//                   // Priority (using your existing widget)
//                   Container(
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     child: PrioritySelector(
//                       value: p.issue.priority ?? IssuePriority.low,
//                       onChanged: p.setPriority,
//                     ),
//                   ),
//
//                   if (p.error != null) ...[
//                     const SizedBox(height: 16),
//                     Container(
//                       padding: const EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         color: Colors.red.shade100,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Text(
//                         p.error!,
//                         style: const TextStyle(color: Colors.red),
//                       ),
//                     ),
//                   ],
//                 ],
//               ),
//             ),
//           ),
//           // Submit Button
//           Container(
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.1),
//                   blurRadius: 10,
//                 ),
//               ],
//             ),
//             child: SafeArea(
//               child: SizedBox(
//                 width: double.infinity,
//                 height: 54,
//                 child: ElevatedButton(
//                   onPressed: p.isSubmitting
//                       ? null
//                       : () async {
//                     final ok = await p.submit();
//                     if (ok && context.mounted) {
//                       Navigator.pop(context);
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFFFF6B35),
//                     foregroundColor: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     elevation: 0,
//                   ),
//                   child: p.isSubmitting
//                       ? const CircularProgressIndicator(color: Colors.white)
//                       :  Text(
//                     AppLocalizations.of(context)!.submitReport,
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildStepIndicator(String label, bool isActive, String text) {
//     return Column(
//       children: [
//         Container(
//           width: 36,
//           height: 36,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: isActive ? const Color(0xFFFF6B35) : Colors.grey[400],
//           ),
//           child: Center(
//             child: Text(
//               label,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 14,
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(height: 4),
//         Text(
//           text,
//           style: TextStyle(
//             color: isActive ? Colors.white : Colors.grey[400],
//             fontSize: 10,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildStepLine(bool isActive) {
//     return Container(
//       width: 30,
//       height: 2,
//       color: isActive ? const Color(0xFFFF6B35) : Colors.grey[400],
//       margin: const EdgeInsets.only(bottom: 20),
//     );
//   }
//
//   Widget _buildIssueTypeCard(IconData icon, String label, String category, reportProvider p) {
//     final isSelected = p.issue.category == category;
//     return GestureDetector(
//       onTap: () => p.setCategory(category),
//       child: Container(
//         decoration: BoxDecoration(
//           color: isSelected ? const Color(0xFFFF6B35) : Colors.white,
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(
//             color: isSelected ? const Color(0xFFFF6B35) : Colors.grey[300]!,
//             width: 2,
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               icon,
//               color: isSelected ? Colors.white : const Color(0xFF2C3E50),
//               size: 28,
//             ),
//             const SizedBox(height: 8),
//             Text(
//               label,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 11,
//                 color: isSelected ? Colors.white : const Color(0xFF2C3E50),
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:mobile_app/l10n/app_localizations_as.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../widgets/prioritySelector.dart';
import '../widgets/photoUploader.dart';
import '../widgets/locationTile.dart';
import '../providers/reportProvider.dart';
import '../models/issueModel.dart';

class IssueReportPage extends StatefulWidget {
  const IssueReportPage({super.key});

  @override
  State<IssueReportPage> createState() => _IssueReportPageState();
}

class _IssueReportPageState extends State<IssueReportPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final p = context.watch<reportProvider>();

    return Scaffold(
      backgroundColor: const Color(0xFF2C3E50),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C3E50),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Icon(Icons.location_city, color: Colors.orange[400], size: 24),
            const SizedBox(width: 8),
             Text(
              AppLocalizations.of(context)!.newIssue,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
        actions: [
          const CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Photo Upload Section
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
                          AppLocalizations.of(context)!.addPhoto,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        PhotoUploader(
                          photo: p.issue.photo,
                          onPickCamera: p.pickFromCamera,
                          onPickGallery: p.pickFromGallery,
                          onRemove: p.issue.photo != null ? p.removePhoto : null,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Progress Indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Step 1: Photo (always active if on this page)
                      _buildStepIndicator('1', p.issue.photo != null, 'Photo'),
                      _buildStepLine(p.issue.photo != null),

                      // Step 2: Issue Type (active when category selected)
                      _buildStepIndicator('2', p.issue.category != null && p.issue.description!=null, AppLocalizations.of(context)!.details),
                      _buildStepLine(p.issue.category != null && p.issue.description!=null),

                      // Step 3: Description & Location (active when both filled)
                      _buildStepIndicator('3', p.issue.address != null, AppLocalizations.of(context)!.location),
                      _buildStepLine(p.issue.address != null && p.issue.priority != null),

                      // Step 4: Done (active when all required fields complete)
                      _buildStepIndicator('✓',
                          p.issue.photo != null &&
                              p.issue.category != null &&
                              p.issue.description != null &&
                              p.issue.address != null &&
                              p.issue.priority != null,
                          AppLocalizations.of(context)!.done),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // Issue Type
                  const Text(
                    'Issue Type',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                      children: [
                      _buildIssueTypeCard(Icons.directions_car, AppLocalizations.of(context)!.pothole, 'Pothole', p),
                      _buildIssueTypeCard(Icons.streetview, AppLocalizations.of(context)!.streetFilled, 'Street filled', p),
                      _buildIssueTypeCard(Icons.water_drop_outlined, AppLocalizations.of(context)!.leakWaste, 'Water leak', p),
                      _buildIssueTypeCard(Icons.camera_outdoor_sharp, AppLocalizations.of(context)!.animalControl, 'Animal control', p),
                      _buildIssueTypeCard(Icons.lightbulb_outline, AppLocalizations.of(context)!.electricity, 'Electricity', p),
                      _buildIssueTypeCard(Icons.delete_outline, AppLocalizations.of(context)!.garbage, 'Garbage', p),
                      _buildIssueTypeCard(Icons.remove_road_outlined, AppLocalizations.of(context)!.roadBlock, 'Road block', p),
                      _buildIssueTypeCard(Icons.public_rounded, AppLocalizations.of(context)!.publicSpaces, 'Public spaces', p),
                      _buildIssueTypeCard(Icons.electrical_services, AppLocalizations.of(context)!.electrical, 'Electrical', p),
                      _buildIssueTypeCard(Icons.forest, AppLocalizations.of(context)!.parkDamage, 'Park damage', p),
                      _buildIssueTypeCard(Icons.fire_extinguisher, AppLocalizations.of(context)!.fireDamage, 'Fire damage', p),
                      _buildIssueTypeCard(Icons.more_horiz, AppLocalizations.of(context)!.other, 'Other', p),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // Description
                   Text(
                    AppLocalizations.of(context)!.description,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                AppLocalizations.of(context)!.detailedDescription,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                p.isListening ? Icons.stop : Icons.mic,
                                color: p.isListening ? Colors.red : const Color(0xFF3498DB),
                              ),
                              onPressed: () => p.toggleListen(_controller),
                            ),
                          ],
                        ),
                        TextField(
                          controller: _controller,
                          maxLines: 3,
                          onChanged: p.setDescription,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Add details about the issue...',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Location
                  LocationTile(
                    address: p.issue.address,
                    loading: p.isGettingLocation,
                    onRefresh: p.refreshLocation,
                  ),

                  const SizedBox(height: 16),

                  // Priority (using your existing widget)
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: PrioritySelector(
                      value: p.issue.priority ?? IssuePriority.low,
                      onChanged: p.setPriority,
                    ),
                  ),

                  if (p.error != null) ...[
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        p.error!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          // Submit Button
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                ),
              ],
            ),
            child: SafeArea(
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: p.isSubmitting
                      ? null
                      : () async {
                    final ok = await p.submit();
                    if (ok && context.mounted) {
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6B35),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: p.isSubmitting
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(
                    AppLocalizations.of(context)!.submitReport,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepIndicator(String label, bool isActive, String text) {
    return Column(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? const Color(0xFFFF6B35) : Colors.grey[400],
          ),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          text,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.grey[400],
            fontSize: 10,
          ),
        ),
      ],
    );
  }

  Widget _buildStepLine(bool isActive) {
    return Container(
      width: 30,
      height: 2,
      color: isActive ? const Color(0xFFFF6B35) : Colors.grey[400],
      margin: const EdgeInsets.only(bottom: 20),
    );
  }

  Widget _buildIssueTypeCard(IconData icon, String label, String category, reportProvider p) {
    final isSelected = p.issue.category == category;
    return GestureDetector(
      onTap: () => p.setCategory(category),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFF6B35) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFFFF6B35) : Colors.grey[300]!,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : const Color(0xFF2C3E50),
              size: 28,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                color: isSelected ? Colors.white : const Color(0xFF2C3E50),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}