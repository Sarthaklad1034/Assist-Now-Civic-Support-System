// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
// import '../l10n/app_localizations.dart';
// import '../models/issueModel.dart';
//
// class complaintsDetails extends StatefulWidget {
//   final IssueModel issue;
//   const complaintsDetails({super.key, required this.issue});
//
//   @override
//   State<complaintsDetails> createState() => _complaintsDetailsState();
// }
//
// class _complaintsDetailsState extends State<complaintsDetails> {
//   int _rating = 0;
//   final TextEditingController _feedbackController = TextEditingController();
//
//   @override
//   void dispose() {
//     _feedbackController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final issue = widget.issue;
//
//     return Scaffold(
//       backgroundColor: const Color(0xFF2C3E50),
//       body: SafeArea(
//         child: Column(
//           children: [
//             _buildHeader(context, issue),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     _buildImageSection(issue),
//                     _buildDetailsCard(issue),
//                     _buildProgressSection(),
//                     _buildIssueTypeGrid(),
//                     if (issue.lat != null && issue.lng != null)
//                       _buildMapSection(issue),
//                     const SizedBox(height: 20),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildHeader(BuildContext context, IssueModel issue) {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       child: Row(
//         children: [
//           IconButton(
//             icon: const Icon(Icons.arrow_back, color: Colors.white),
//             onPressed: () => Navigator.pop(context),
//           ),
//           const Spacer(),
//           Icon(Icons.location_city, color: Colors.orange[400], size: 24),
//           const SizedBox(width: 8),
//           const Text(
//             'AssistNow',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const Spacer(),
//           const CircleAvatar(
//             radius: 18,
//             backgroundImage: NetworkImage('https://via.placeholder.com/150'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildImageSection(IssueModel issue) {
//     return Container(
//       margin: const EdgeInsets.all(20),
//       height: 200,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         color: Colors.white,
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(16),
//         child: issue.photo != null
//             ? Image.file(issue.photo!, fit: BoxFit.cover)
//             : Container(
//           color: Colors.grey[300],
//           child: const Center(
//             child: Icon(Icons.image, size: 60, color: Colors.grey),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDetailsCard(IssueModel issue) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 20),
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             issue.description ?? 'Pothole on Main St.',
//             style: const TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: Color(0xFF2C3E50),
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             issue.address ?? 'Main Street',
//             style: TextStyle(
//               fontSize: 14,
//               color: Colors.grey[600],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildProgressSection() {
//     final issue = widget.issue;
//     return Container(
//       margin: const EdgeInsets.all(20),
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: _buildTimeline(issue.status),
//     );
//   }
//
//
//   Widget _buildTimeline(String? status) {
//     // Define the ordered statuses
//     final steps = [
//       AppLocalizations.of(context)!.reportSubmitted,
//       AppLocalizations.of(context)!.assigned,
//       AppLocalizations.of(context)!.workStarted,
//       AppLocalizations.of(context)!.resolved,
//     ];
//
//     // Map your IssueModel.status to an index
//     final statusMap = {
//       "Submitted": 0,
//       "Assigned": 1,
//       "InProgress": 2,
//       "Resolved": 3,
//       "Closed": 3,
//     };
//     final currentIndex = statusMap[status] ?? 0;
//
//     return Row(
//       children: List.generate(steps.length, (index) {
//         final isActive = index <= currentIndex;
//         final isCurrent = index == currentIndex;
//
//         return Expanded(
//           child: Column(
//             children: [
//               Container(
//                 width: 36,
//                 height: 36,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: isActive ? const Color(0xFF3498DB) : Colors.grey[300],
//                   border: Border.all(
//                     color: isCurrent ? const Color(0xFFFF6B35) : Colors.transparent,
//                     width: 3,
//                   ),
//                 ),
//                 child: isActive
//                     ? const Icon(Icons.check, color: Colors.white, size: 20)
//                     : null,
//               ),
//               const SizedBox(height: 6),
//               Text(
//                 steps[index],
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 10,
//                   color: isActive ? const Color(0xFF2C3E50) : Colors.grey,
//                   fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
//                 ),
//               ),
//             ],
//           ),
//         );
//       }),
//     );
//   }
//
//
//   Widget _buildProgressLine(bool isActive) {
//     return Expanded(
//       child: Container(
//         height: 2,
//         margin: const EdgeInsets.only(bottom: 30),
//         color: isActive ? const Color(0xFF3498DB) : Colors.grey[300],
//       ),
//     );
//   }
//
//
//   Widget _buildIssueTypeGrid() {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//            Text(
//             AppLocalizations.of(context)!.issueType,
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Color(0xFF2C3E50),
//             ),
//           ),
//           const SizedBox(height: 16),
//           GridView.count(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             crossAxisCount: 4,
//             mainAxisSpacing: 12,
//             crossAxisSpacing: 12,
//             children: [
//               _buildIssueTypeCard(Icons.directions_car, AppLocalizations.of(context)!.pothole, false),
//               _buildIssueTypeCard(Icons.streetview, AppLocalizations.of(context)!.streetFilled, false),
//               _buildIssueTypeCard(Icons.water_drop_outlined, AppLocalizations.of(context)!.leakWaste, false),
//               _buildIssueTypeCard(Icons.lightbulb_outline, AppLocalizations.of(context)!.electricity, false),
//               _buildIssueTypeCard(Icons.delete_outline, AppLocalizations.of(context)!.garbage, false),
//               _buildIssueTypeCard(Icons.remove_road_outlined, AppLocalizations.of(context)!.roadBlock, false),
//               _buildIssueTypeCard(Icons.public_rounded, AppLocalizations.of(context)!.publicSpaces, false),
//               _buildIssueTypeCard(Icons.electrical_services, AppLocalizations.of(context)!.electrical, false),
//               _buildIssueTypeCard(Icons.forest, AppLocalizations.of(context)!.parkDamage, false),
//               _buildIssueTypeCard(Icons.fire_extinguisher, AppLocalizations.of(context)!.fireDamage, false),
//               _buildIssueTypeCard(Icons.more_horiz, AppLocalizations.of(context)!.other, false),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildIssueTypeCard(IconData icon, String label, bool isSelected) {
//     return Container(
//       decoration: BoxDecoration(
//         color: isSelected ? const Color(0xFFFF6B35) : Colors.grey[100],
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(
//           color: isSelected ? const Color(0xFFFF6B35) : Colors.grey[300]!,
//           width: 2,
//         ),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             icon,
//             color: isSelected ? Colors.white : const Color(0xFF2C3E50),
//             size: 24,
//           ),
//           const SizedBox(height: 4),
//           Text(
//             label,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 10,
//               color: isSelected ? Colors.white : const Color(0xFF2C3E50),
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildMapSection(IssueModel issue) {
//     return Container(
//       margin: const EdgeInsets.all(20),
//       height: 200,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         color: Colors.white,
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(16),
//         child: FlutterMap(
//           options: MapOptions(
//             initialCenter: LatLng(issue.lat!, issue.lng!),
//             initialZoom: 15,
//           ),
//           children: [
//             TileLayer(
//               urlTemplate: "https://cartodb-basemaps-a.global.ssl.fastly.net/light_all/{z}/{x}/{y}.png",
//               userAgentPackageName: "com.cityissues.app",
//             ),
//               //will use MapTiler in future
//             MarkerLayer(
//               markers: [
//                 Marker(
//                   point: LatLng(issue.lat!, issue.lng!),
//                   width: 40,
//                   height: 40,
//                   child: const Icon(
//                     Icons.location_on,
//                     color: Colors.red,
//                     size: 40,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobile_app/l10n/app_localizations_as.dart';
import '../l10n/app_localizations.dart';
import '../models/issueModel.dart';

class complaintsDetails extends StatefulWidget {
  final IssueModel issue;
  const complaintsDetails({super.key, required this.issue});

  @override
  State<complaintsDetails> createState() => _complaintsDetailsState();
}

class _complaintsDetailsState extends State<complaintsDetails> {
  int _rating = 0;
  final TextEditingController _feedbackController = TextEditingController();

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final issue = widget.issue;

    return Scaffold(
      backgroundColor: const Color(0xFF2C3E50),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context, issue),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildImageSection(issue),
                    _buildDetailsCard(issue),
                    _buildProgressSection(),
                    _buildDepartmentInfo(),
                    _buildIssueTypeGrid(),
                    if (issue.lat != null && issue.lng != null)
                      _buildMapSection(issue),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, IssueModel issue) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          const Spacer(),
          Icon(Icons.location_city, color: Colors.orange[400], size: 24),
          const SizedBox(width: 8),
          const Text(
            'AssistNow',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          const CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSection(IssueModel issue) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: issue.photo != null
            ? Image.file(issue.photo!, fit: BoxFit.cover)
            : Container(
          color: Colors.grey[300],
          child: const Center(
            child: Icon(Icons.image, size: 60, color: Colors.grey),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailsCard(IssueModel issue) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            issue.description ?? 'Pothole on Main St.',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            issue.address ?? 'Main Street',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressSection() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildProgressStep(AppLocalizations.of(context)!.reportSubmitted, true, true),
              _buildProgressLine(true),
              _buildProgressStep(AppLocalizations.of(context)!.assigned, true, false),
              _buildProgressLine(true),
              _buildProgressStep(AppLocalizations.of(context)!.workStarted, true, false),
              _buildProgressLine(false),
              _buildProgressStep(AppLocalizations.of(context)!.resolved, false, false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgressStep(String label, bool isComplete, bool isCurrent) {
    return Column(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isComplete ? const Color(0xFF3498DB) : Colors.grey[300],
            border: Border.all(
              color: isCurrent ? const Color(0xFFFF6B35) : Colors.transparent,
              width: 3,
            ),
          ),
          child: isComplete
              ? const Icon(Icons.check, color: Colors.white, size: 20)
              : null,
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10,
            color: isComplete ? const Color(0xFF2C3E50) : Colors.grey,
            fontWeight: isComplete ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildProgressLine(bool isActive) {
    return Expanded(
      child: Container(
        height: 2,
        margin: const EdgeInsets.only(bottom: 30),
        color: isActive ? const Color(0xFF3498DB) : Colors.grey[300],
      ),
    );
  }

  Widget _buildDepartmentInfo() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Department',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Large, deep to loon near Iterar Ion Main St Frecingtocer and 0d 5th Ave, causing damage tho vehicles.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
              height: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Roads Department\nReport ID: #CF-2023-01-15-004',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIssueTypeGrid() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            AppLocalizations.of(context)!.issueType,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C3E50),
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
              _buildIssueTypeCard(Icons.directions_car, AppLocalizations.of(context)!.pothole, true),
              _buildIssueTypeCard(Icons.streetview, AppLocalizations.of(context)!.streetFilled, false),
              _buildIssueTypeCard(Icons.water_drop_outlined, AppLocalizations.of(context)!.leakWaste, false),
              _buildIssueTypeCard(Icons.camera_outdoor_sharp, AppLocalizations.of(context)!.animalControl, false),
              _buildIssueTypeCard(Icons.lightbulb_outline, AppLocalizations.of(context)!.electricity, false),
              _buildIssueTypeCard(Icons.delete_outline, AppLocalizations.of(context)!.garbage, false),
              _buildIssueTypeCard(Icons.remove_road_outlined, AppLocalizations.of(context)!.roadBlock, false),
              _buildIssueTypeCard(Icons.public_rounded, AppLocalizations.of(context)!.publicSpaces, false),
              _buildIssueTypeCard(Icons.electrical_services, AppLocalizations.of(context)!.electrical, false),
              _buildIssueTypeCard(Icons.forest, AppLocalizations.of(context)!.parkDamage, false),
              _buildIssueTypeCard(Icons.fire_extinguisher, AppLocalizations.of(context)!.fireDamage, false),
              _buildIssueTypeCard(Icons.more_horiz, AppLocalizations.of(context)!.other, false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIssueTypeCard(IconData icon, String label, bool isSelected) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFFF6B35) : Colors.grey[100],
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
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
              color: isSelected ? Colors.white : const Color(0xFF2C3E50),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMapSection(IssueModel issue) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: FlutterMap(
          options: MapOptions(
            initialCenter: LatLng(issue.lat!, issue.lng!),
            initialZoom: 15,
          ),
          children: [
        TileLayer(
              urlTemplate: "https://cartodb-basemaps-a.global.ssl.fastly.net/light_all/{z}/{x}/{y}.png",
              userAgentPackageName: "com.cityissues.app",
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: LatLng(issue.lat!, issue.lng!),
                  width: 40,
                  height: 40,
                  child: const Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 40,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}