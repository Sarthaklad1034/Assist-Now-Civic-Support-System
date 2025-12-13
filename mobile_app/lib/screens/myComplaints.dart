// import 'package:flutter/material.dart';
// import 'package:mobile_app/screens/complaintsDetails.dart';
// import 'package:provider/provider.dart';
// import '../l10n/app_localizations.dart';
// import '../providers/reportProvider.dart';
// import '../models/issueModel.dart';
//
// class myComplaints extends StatefulWidget {
//   const myComplaints({super.key});
//
//   @override
//   State<myComplaints> createState() => _myComplaintsState();
// }
//
// class _myComplaintsState extends State<myComplaints> with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//   }
//
//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final issues = context.watch<reportProvider>().issues;
//
//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black87,
//         title:  Text(
//           AppLocalizations.of(context)!.complaints,
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(48),
//           child: Container(
//             color: Colors.white,
//             child: TabBar(
//               controller: _tabController,
//               labelColor: Colors.blue,
//               unselectedLabelColor: Colors.grey,
//               indicatorColor: Colors.blue,
//               indicatorWeight: 3,
//               labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
//               tabs: [
//                 Tab(text: AppLocalizations.of(context)!.all),
//                 Tab(text: AppLocalizations.of(context)!.active),
//                 Tab(text: AppLocalizations.of(context)!.resolved),
//               ],
//             ),
//           ),
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: [
//           _buildList(issues),
//           _buildList(issues.where((i) =>
//           i.status == "Submitted" ||
//               i.status == "InProgress" ||
//               i.status == "Assigned").toList()),
//           _buildList(issues
//               .where((i) => i.status == "Resolved" || i.status == "Closed")
//               .toList()),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildList(List<IssueModel> issues) {
//     if (issues.isEmpty) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.inbox_outlined, size: 80, color: Colors.grey[300]),
//             const SizedBox(height: 16),
//             Text(
//               AppLocalizations.of(context)!.complaints,
//               style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.grey[600],
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               "Your submitted issues will appear here",
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Colors.grey[400],
//               ),
//             ),
//           ],
//         ),
//       );
//     }
//
//     return ListView.builder(
//       padding: const EdgeInsets.all(16),
//       itemCount: issues.length,
//       itemBuilder: (context, index) {
//         final issue = issues[index];
//         return TweenAnimationBuilder(
//           duration: Duration(milliseconds: 300 + (index * 50)),
//           tween: Tween<double>(begin: 0, end: 1),
//           builder: (context, double value, child) {
//             return Opacity(
//               opacity: value,
//               child: Transform.translate(
//                 offset: Offset(0, 20 * (1 - value)),
//                 child: child,
//               ),
//             );
//           },
//           child: _buildComplaintCard(issue),
//         );
//       },
//     );
//   }
//
//   Widget _buildComplaintCard(IssueModel issue) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: Colors.grey.shade200),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.03),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (_) => complaintsDetails(issue: issue),
//               ),
//             );
//           },
//           borderRadius: BorderRadius.circular(16),
//           child: Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Image or icon
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(12),
//                       child: issue.photo != null
//                           ? Image.file(
//                         issue.photo!,
//                         width: 80,
//                         height: 80,
//                         fit: BoxFit.cover,
//                       )
//                           : Container(
//                         width: 80,
//                         height: 80,
//                         color: Colors.grey[100],
//                         child: Icon(
//                           Icons.image_not_supported_outlined,
//                           size: 32,
//                           color: Colors.grey[400],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//
//                     // Content
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                   issue.category ?? "Other",
//                                   style: const TextStyle(
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.blue,
//                                   ),
//                                 ),
//                               ),
//                               _buildStatusChip(issue.status),
//                             ],
//                           ),
//                           const SizedBox(height: 8),
//                           Text(
//                             issue.description ?? "No description",
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style: const TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.black87,
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           if (issue.address != null)
//                             Row(
//                               children: [
//                                 Icon(
//                                   Icons.location_on_outlined,
//                                   size: 14,
//                                   color: Colors.grey[500],
//                                 ),
//                                 const SizedBox(width: 4),
//                                 Expanded(
//                                   child: Text(
//                                     issue.address!,
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(
//                                       fontSize: 13,
//                                       color: Colors.grey[600],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 12),
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                   decoration: BoxDecoration(
//                     color: Colors.grey[50],
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.calendar_today_outlined,
//                             size: 14,
//                             color: Colors.grey[600],
//                           ),
//                           const SizedBox(width: 6),
//                           Text(
//                             issue.raisedDate?.toLocal().toString().split(' ')[0] ?? "Unknown",
//                             style: TextStyle(
//                               fontSize: 13,
//                               color: Colors.grey[700],
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             AppLocalizations.of(context)!.viewDetails,
//                             style: TextStyle(
//                               fontSize: 13,
//                               color: Colors.blue[700],
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                           const SizedBox(width: 4),
//                           Icon(
//                             Icons.arrow_forward_ios,
//                             size: 12,
//                             color: Colors.blue[700],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildStatusChip(String? status) {
//     final statusInfo = _getStatusInfo(status);
//
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//       decoration: BoxDecoration(
//         color: statusInfo['color'].withOpacity(0.1),
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(
//           color: statusInfo['color'].withOpacity(0.3),
//           width: 1,
//         ),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(
//             statusInfo['icon'],
//             size: 12,
//             color: statusInfo['color'],
//           ),
//           const SizedBox(width: 4),
//           Text(
//             status ?? "Unknown",
//             style: TextStyle(
//               color: statusInfo['color'],
//               fontSize: 11,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Map<String, dynamic> _getStatusInfo(String? status) {
//
//     switch (status) {
//       case "Resolved":
//       case "Closed":
//         return {
//           'color': Colors.green,
//           'icon': Icons.check_circle,
//         };
//       case "InProgress":
//         return {
//           'color': Colors.orange,
//           'icon': Icons.engineering,
//         };
//       case "Assigned":
//         return {
//           'color': Colors.blue,
//           'icon': Icons.assignment_turned_in,
//         };
//       case "Submitted":
//         return {
//           'color': Colors.purple,
//           'icon': Icons.upload,
//         };
//       default:
//         return {
//           'color': Colors.grey,
//           'icon': Icons.help_outline,
//         };
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:mobile_app/l10n/app_localizations_as.dart';
import 'package:mobile_app/screens/complaintsDetails.dart';
import 'package:mobile_app/widgets/complaintList.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../providers/reportProvider.dart';
import '../models/issueModel.dart';

class myComplaints extends StatefulWidget {
  const myComplaints({super.key});

  @override
  State<myComplaints> createState() => _myComplaintsState();
}

class _myComplaintsState extends State<myComplaints>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final issues = context.watch<reportProvider>().issues;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        title: Text(
          AppLocalizations.of(context)!.complaints,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs:  [
            Tab(text: AppLocalizations.of(context)!.all),
            Tab(text: AppLocalizations.of(context)!.active),
            Tab(text:AppLocalizations.of(context)!.resolved),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // All
          complaintList(issues: issues),

          // Active
          complaintList(
            issues: issues
                .where((i) =>
            i.status == "Submitted" ||
                i.status == "InProgress" ||
                i.status == "Assigned")
                .toList(),
          ),

          // Resolved
          complaintList(
            issues: issues
                .where((i) =>
            i.status == "Resolved" ||
                i.status == "Closed")
                .toList(),
          ),
        ],
      ),
    );
  }
}
