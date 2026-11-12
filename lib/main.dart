import 'package:flutter/material.dart';
import 'screens/event_detail_screen.dart';
import 'screens/facility_detail_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const CampusApp());
}

class CampusApp extends StatelessWidget {
  const CampusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Informasi Civitas Kampus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[50],
        useMaterial3: true,
      ),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        FacilityDetailScreen.routeName: (context) => const FacilityDetailScreen(),
        EventDetailScreen.routeName: (context) => const EventDetailScreen(),
      },
    );
  }
}