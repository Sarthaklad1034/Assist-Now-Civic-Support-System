// import 'package:flutter/material.dart';
// import 'package:mobile_app/screens/complaintsDetails.dart';
// import 'package:mobile_app/screens/profilePage.dart';
// import 'package:showcaseview/showcaseview.dart';
// import '../screens/IssueReportPage.dart';
// import '../screens/mapView.dart';
// import 'myComplaints.dart' show myComplaints;
//
// class HomeDashboard extends StatefulWidget {
//   const HomeDashboard({super.key});
//
//   @override
//   State<HomeDashboard> createState() => _HomeDashboardState();
// }
//
// class _HomeDashboardState extends State<HomeDashboard> with SingleTickerProviderStateMixin {
//   late final AnimationController _animationController;
//
//   // Showcase GlobalKeys
//   final GlobalKey _issueReportKey = GlobalKey();
//   final GlobalKey _myComplaintsKey = GlobalKey();
//   final GlobalKey _mapViewKey = GlobalKey();
//   final GlobalKey _notificationKey = GlobalKey();
//   final GlobalKey _profileKey = GlobalKey();
//
//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1200),
//     )..forward();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       // Start the showcase tour after the first frame is rendered
//       ShowCaseWidget.of(context).startShowCase([
//         _issueReportKey,
//         _myComplaintsKey,
//         _mapViewKey,
//         _notificationKey,
//         // The profile key is for the IconButton in the AppBar, which is outside the list,
//         // so it might be better placed in the action list for the end of the tour.
//         // For now, we will leave it as is, but often AppBar items are showcased separately.
//       ]);
//     });
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             expandedHeight: 120,
//             floating: false,
//             pinned: true,
//             elevation: 0,
//             backgroundColor: Colors.white,
//             flexibleSpace: FlexibleSpaceBar(
//               titlePadding: const EdgeInsets.only(left: 20, bottom: 16),
//               title: const Text(
//                 'Hello, User!',
//                 style: TextStyle(
//                   color: Colors.black87,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 24,
//                 ),
//               ),
//               background: Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                     colors: [Colors.blue.shade50, Colors.white],
//                   ),
//                 ),
//               ),
//             ),
//             actions: [
//               // 🚨 FIX 1: Wrap the Notification Icon in Showcase
//               Showcase(
//                 key: _notificationKey,
//                 description: 'Check latest notifications and updates.',
//                 child: Stack(
//                   children: [
//                     IconButton(
//                       onPressed: () {},
//                       icon: const Icon(Icons.notifications_outlined, color: Colors.black87),
//                     ),
//                     Positioned(
//                       right: 8,
//                       top: 8,
//                       child: Container(
//                         padding: const EdgeInsets.all(4),
//                         decoration: const BoxDecoration(
//                           color: Colors.red,
//                           shape: BoxShape.circle,
//                         ),
//                         child: const Text(
//                           '3',
//                           style: TextStyle(color: Colors.white, fontSize: 10),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               // 🚨 FIX 2: Wrap the Profile Icon in Showcase
//               Showcase(
//                 key: _profileKey,
//                 description: 'Manage your profile and settings.',
//                 child: IconButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => const profilePage()),
//                     );
//                   },
//                   icon: const Icon(Icons.person_outline, color: Colors.black87),
//                 ),
//               ),
//
//               // Add padding for symmetry in the AppBar
//               const SizedBox(width: 8),
//             ],
//           ),
//           SliverPadding(
//             padding: const EdgeInsets.all(20),
//             sliver: SliverList(
//               delegate: SliverChildListDelegate([
//                 _buildQuickActions(),
//                 const SizedBox(height: 28),
//                 _buildSectionHeader('Recent Updates'),
//                 const SizedBox(height: 16),
//                 _buildUpdatesSection(),
//               ]),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // NOTE: This widget now has a slightly larger childAspectRatio to give text more room.
//   Widget _buildQuickActions() {
//     final actions = [
//       {
//         'icon': Icons.report_problem_outlined,
//         'title': 'Report Issue',
//         'subtitle': 'Submit civic problems',
//         'color': Colors.blue,
//         'page': const IssueReportPage(),
//         'key': _issueReportKey,
//         'desc': 'Tap here to report civic issues',
//       },
//       {
//         'icon': Icons.list_alt_outlined,
//         'title': 'My Complaints',
//         'subtitle': 'Track your issues',
//         'color': Colors.orange,
//         'page': const myComplaints(),
//         'key': _myComplaintsKey,
//         'desc': 'View and track your complaints',
//       },
//       {
//         'icon': Icons.map_outlined,
//         'title': 'Map View',
//         'subtitle': 'Explore on map',
//         'color': Colors.green,
//         'page': const mapView(),
//         'key': _mapViewKey,
//         'desc': 'See issues plotted on the map',
//       },
//       // Notifications is moved to the AppBar actions, so this placeholder is removed from the grid
//       // {
//       //   'icon': Icons.notifications_active_outlined,
//       //   'title': 'Notifications',
//       //   'subtitle': 'View updates',
//       //   'color': Colors.purple,
//       //   'page': const Placeholder(),
//       //   'key': _notificationKey,
//       //   'desc': 'Check latest notifications',
//       // },
//     ];
//
//     return GridView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 16,
//         mainAxisSpacing: 16,
//         // 🚨 FIX 3: Increased aspect ratio to give more vertical space for text
//         childAspectRatio: 1.1,
//       ),
//       itemCount: actions.length,
//       itemBuilder: (context, index) {
//         final action = actions[index];
//         final key = action['key'] as GlobalKey;
//
//         // Clamping the animation interval to ensure it doesn't exceed 1.0
//         final intervalStart = index * 0.15;
//         final intervalEnd = (0.6 + (index * 0.15)).clamp(0.0, 1.0);
//
//         return FadeTransition(
//           opacity: Tween<double>(begin: 0, end: 1).animate(
//             CurvedAnimation(
//               parent: _animationController,
//               curve: Interval(intervalStart, intervalEnd, curve: Curves.easeOut),
//             ),
//           ),
//           child: SlideTransition(
//             position: Tween<Offset>(
//               begin: const Offset(0, 0.3),
//               end: Offset.zero,
//             ).animate(
//               CurvedAnimation(
//                 parent: _animationController,
//                 curve: Interval(intervalStart, intervalEnd, curve: Curves.easeOut),
//               ),
//             ),
//             child: Showcase(
//               key: key,
//               description: action['desc'] as String,
//               child: _buildActionCard(
//                 context,
//                 action['icon'] as IconData,
//                 action['title'] as String,
//                 action['subtitle'] as String,
//                 action['color'] as Color,
//                 action['page'] as Widget,
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   // 🚨 FIX 4: The _buildActionCard method has been simplified and verified
//   // to prevent overflow by using Flexible/Expanded for the text widgets.
//   Widget _buildActionCard(
//       BuildContext context,
//       IconData icon,
//       String title,
//       String subtitle,
//       Color color,
//       Widget page,
//       ) {
//     return Material(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(20),
//       elevation: 0,
//       shadowColor: color.withOpacity(0.2),
//       child: InkWell(
//         onTap: () => Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => page),
//         ),
//         borderRadius: BorderRadius.circular(20),
//         child: Container(
//           padding: const EdgeInsets.all(20),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             border: Border.all(color: Colors.grey.shade200, width: 1),
//           ),
//           // Using a Column inside a fixed-height GridView cell requires careful management
//           child: Column(
//             mainAxisSize: MainAxisSize.min, // Use minimum space
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: color.withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Icon(icon, color: color, size: 28),
//               ),
//               const SizedBox(height: 16),
//
//               // ⚠️ FIX: Flexible is the key to preventing text overflow here.
//               // Use Expanded if you want the text block to fill all remaining vertical space.
//               Flexible(
//                 child: Text(
//                   title,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                     color: Colors.black87,
//                   ),
//                   overflow: TextOverflow.ellipsis, // Added safeguard
//                   maxLines: 2, // Limit to 2 lines
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Flexible(
//                 child: Text(
//                   subtitle,
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: Colors.grey[600],
//                   ),
//                   overflow: TextOverflow.ellipsis, // Added safeguard
//                   maxLines: 2, // Limit to 2 lines
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // ... (Other helper methods remain the same) ...
//
//   Widget _buildSectionHeader(String title) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           title,
//           style: const TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             color: Colors.black87,
//           ),
//         ),
//         TextButton(
//           onPressed: () {},
//           child: const Text('View All'),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildUpdatesSection() {
//     final updates = [
//       {
//         'icon': Icons.check_circle_outline,
//         'title': 'Issue Resolved',
//         'subtitle': 'Your pothole complaint has been fixed',
//         'time': '2 hours ago',
//         'color': Colors.green,
//       },
//       {
//         'icon': Icons.engineering_outlined,
//         'title': 'Work In Progress',
//         'subtitle': 'Street light repair is underway',
//         'time': '5 hours ago',
//         'color': Colors.orange,
//       },
//       {
//         'icon': Icons.assignment_turned_in_outlined,
//         'title': 'Complaint Assigned',
//         'subtitle': 'Your garbage issue has been assigned',
//         'time': '1 day ago',
//         'color': Colors.blue,
//       },
//     ];
//
//     return Column(
//       children: updates.asMap().entries.map((entry) {
//         final index = entry.key;
//         final update = entry.value;
//         return FadeTransition(
//           opacity: Tween<double>(begin: 0, end: 1).animate(
//             CurvedAnimation(
//               parent: _animationController,
//               curve: Interval(
//                 0.4 + (index * 0.1),
//                 0.8 + (index * 0.1),
//                 curve: Curves.easeOut,
//               ),
//             ),
//           ),
//           child: _buildUpdateCard(
//             update['icon'] as IconData,
//             update['title'] as String,
//             update['subtitle'] as String,
//             update['time'] as String,
//             update['color'] as Color,
//           ),
//         );
//       }).toList(),
//     );
//   }
//
//   Widget _buildUpdateCard(
//       IconData icon,
//       String title,
//       String subtitle,
//       String time,
//       Color color,
//       ) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: Colors.grey.shade200, width: 1),
//       ),
//       child: Row(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: color.withOpacity(0.1),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Icon(icon, color: color, size: 24),
//           ),
//           const SizedBox(width: 16),
//           Expanded( // Expanded prevents overflow in the horizontal Row
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 15,
//                     color: Colors.black87,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   subtitle,
//                   style: TextStyle(
//                     fontSize: 13,
//                     color: Colors.grey[600],
//                   ),
//                   overflow: TextOverflow.ellipsis, // Safeguard for long subtitle
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   time,
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: Colors.grey[400],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Icon(Icons.chevron_right, color: Colors.grey[400]),
//         ],
//       ),
//     );
//   }
// }
//
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mobile_app/providers/reportProvider.dart';
import 'package:mobile_app/screens/complaintsDetails.dart';
import 'package:mobile_app/screens/profilePage.dart';
import 'package:mobile_app/widgets/complaintCard.dart';
import 'package:mobile_app/widgets/complaintList.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';
import '../screens/IssueReportPage.dart';
import '../screens/mapView.dart';
import 'myComplaints.dart' show myComplaints;
import '../l10n/app_localizations.dart';

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({super.key});

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  final GlobalKey _reportKey = GlobalKey();
  final GlobalKey _complaintsKey = GlobalKey();
  final GlobalKey _mapKey = GlobalKey();
  final GlobalKey _notificationKey = GlobalKey();
  final GlobalKey _profileKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    final issues = context.watch<reportProvider>().issues;
    return Scaffold(
      backgroundColor: const Color(0xFF2C3E50),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Showcase(
                      key: _reportKey,
                      description:
                          AppLocalizations.of(context)!.tapToReportIssue,
                      tooltipBackgroundColor: const Color(0xFFFF6B35),
                      textColor: Colors.white,
                      child: _buildReportButton(),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      AppLocalizations.of(context)!.reports,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (issues.isEmpty)
                      const Text(
                        'No reports found',
                        style: TextStyle(color: Colors.white),
                      ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: issues.take(3).length,
                      itemBuilder: (context, index) {
                        return complaintCard(issue: issues[index]);
                      },
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
            _buildBottomNav(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Row(
            children: [
              Icon(Icons.location_city, color: Colors.orange[400], size: 30),
              const SizedBox(width: 8),
              const Text(
                'AssistNow',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              ShowCaseWidget.of(context).startShowCase([
                _reportKey,
                _complaintsKey,
                _mapKey,
                _notificationKey,
                _profileKey,
              ]);
            },
            icon: Icon(Icons.help, color: Colors.white),
          ),
          Showcase(
            key: _profileKey,
            description: AppLocalizations.of(context)!.profileManage,
            tooltipBackgroundColor: const Color(0xFFFF6B35),
            textColor: Colors.white,
            targetShapeBorder: const CircleBorder(),
            child: GestureDetector(
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const profilePage()),
                  ),
              child: const CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReportButton() {
    return GestureDetector(
      onTap: () {
        context.read<reportProvider>().reset();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const IssueReportPage()),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          color: const Color(0xFFFF6B35),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFFF6B35).withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.camera_alt,
                color: Color(0xFFFF6B35),
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              AppLocalizations.of(context)!.newIssue,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReportCard(
    String title,
    String status,
    String imagePath,
    int currentStep,
    String statusText,
  ) {
    return Container(
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
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 100,
                  height: 80,
                  color: Colors.grey[300],
                  child: Icon(Icons.image, size: 40, color: Colors.grey[400]),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2C3E50),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      status,
                      style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: List.generate(5, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              index < currentStep
                                  ? const Color(0xFF3498DB)
                                  : Colors.grey[300],
                          border: Border.all(
                            color:
                                index < currentStep
                                    ? const Color(0xFF3498DB)
                                    : Colors.grey[400]!,
                            width: 2,
                          ),
                        ),
                        child:
                            index < currentStep
                                ? const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 18,
                                )
                                : null,
                      ),
                    );
                  }),
                ),
              ),
              Text(
                'Status: $statusText',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2C3E50),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'View Details',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home, 'Home', true, const HomeDashboard()),
              Showcase(
                key: _mapKey,
                description: AppLocalizations.of(context)!.mapView,
                tooltipBackgroundColor: const Color(0xFFFF6B35),
                textColor: Colors.white,
                child: _buildNavItem(
                  Icons.map_outlined,
                  AppLocalizations.of(context)!.map,
                  false,
                  const mapView(),
                ),
              ),
              Showcase(
                key: _notificationKey,
                description: AppLocalizations.of(context)!.notify,
                tooltipBackgroundColor: const Color(0xFFFF6B35),
                textColor: Colors.white,
                child: _buildNavItem(
                  Icons.notifications_outlined,
                  AppLocalizations.of(context)!.notifications,
                  false,
                  const Placeholder(),
                ),
              ),
              Showcase(
                key: _complaintsKey,
                description: AppLocalizations.of(context)!.complaintsView,
                tooltipBackgroundColor: const Color(0xFFFF6B35),
                textColor: Colors.white,
                child: _buildNavItem(
                  Icons.list_alt_outlined,
                  AppLocalizations.of(context)!.reports,
                  false,
                  const myComplaints(),
                ),
              ),
              _buildNavItem(
                Icons.person_outline,
                AppLocalizations.of(context)!.account,
                false,
                const profilePage(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String label,
    bool isActive,
    Widget nextPage, {
    bool badge = false,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Icon(
                icon,
                color: isActive ? const Color(0xFF3498DB) : Colors.grey,
                size: 26,
              ),
              if (badge)
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: isActive ? const Color(0xFF3498DB) : Colors.grey,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
