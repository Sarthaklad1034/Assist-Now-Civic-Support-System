// import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:mobile_app/l10n/app_localizations_en.dart';
// import 'package:mobile_app/providers/languageProvider.dart';
// import 'package:mobile_app/providers/reportProvider.dart';
// import 'package:mobile_app/screens/HomeDashboard.dart';
// import 'package:device_preview/device_preview.dart';
// import 'package:mobile_app/screens/IssueReportPage.dart';
// import 'package:mobile_app/screens/mapView.dart';
// import 'package:mobile_app/service/locationService.dart';
// import 'package:mobile_app/service/mediaService.dart';
// import 'package:mobile_app/service/profilePageController.dart';
// import 'package:mobile_app/service/speechToTextService.dart';
// import 'package:provider/provider.dart';
// import 'package:showcaseview/showcaseview.dart';
//
// import 'l10n/app_localizations.dart';
//
// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider<reportProvider>(
//           create:
//               (_) => reportProvider(
//                 LocationService(),
//                 speechToTextService(),
//                 mediaService(),
//               )..refreshLocation(),
//         ),
//         ChangeNotifierProvider<languageProvider>(
//           create:(context)=> languageProvider() ,
//         ),
//       ],
//       child: DevicePreview(enabled: true, builder: (context) => const MyApp()),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ShowCaseWidget(
//       autoPlay: true,
//       autoPlayDelay: Duration(seconds: 2),
//       builder: (BuildContext context) {
//         return MaterialApp(
//           supportedLocales: [
//             const Locale('en'),
//             const Locale('hi'),
//             const Locale('mr'),
//             const Locale('gu'),
//             const Locale('ta'),
//             const Locale('te'),
//             const Locale('bn'),
//             const Locale('kn'),
//             const Locale('ml'),
//             const Locale('or'),
//             const Locale('as')
//           ],
//           locale: context.watch<languageProvider>().selectedLocale,
//           localizationsDelegates: [
//             GlobalMaterialLocalizations.delegate,
//             GlobalCupertinoLocalizations.delegate,
//             AppLocalizations.delegate,
//             GlobalWidgetsLocalizations.delegate,
//           ],
//           useInheritedMediaQuery: true,
//           title: 'Flutter Demo',
//           theme: ThemeData(
//             colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//             useMaterial3: true,
//           ),
//           home: const HomeDashboard(),
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:device_preview/device_preview.dart';
import 'package:showcaseview/showcaseview.dart';

// Local imports
import 'package:mobile_app/l10n/app_localizations.dart';
import 'package:mobile_app/providers/languageProvider.dart';
import 'package:mobile_app/providers/reportProvider.dart';
import 'package:mobile_app/screens/HomeDashboard.dart';
import 'package:mobile_app/service/locationService.dart';
import 'package:mobile_app/service/mediaService.dart';
import 'package:mobile_app/service/speechToTextService.dart';
import 'package:mobile_app/service/profilePageController.dart';

void main() {
  // Register GetX controller (global access)
  Get.put(profilePageController());

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<reportProvider>(
          create: (_) => reportProvider(
            LocationService(),
            speechToTextService(),
            mediaService(),
          )..refreshLocation(),
        ),
        ChangeNotifierProvider<languageProvider>(
          create: (_) => languageProvider(),
        ),
      ],
      child: DevicePreview(
        enabled: true,
        builder: (context) => const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      autoPlay: true,
      autoPlayDelay: const Duration(seconds: 2),
      builder: (context) {
        return MaterialApp(
          useInheritedMediaQuery: true,
          locale: context.watch<languageProvider>().selectedLocale,
          supportedLocales: const [
            Locale('en'),
            Locale('hi'),
            Locale('mr'),
            Locale('gu'),
            Locale('ta'),
            Locale('te'),
            Locale('bn'),
            Locale('kn'),
            Locale('ml'),
            Locale('or'),
            Locale('as'),
          ],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          title: 'City Issues App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomeDashboard(),
        );
      },
    );
  }
}
