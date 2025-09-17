import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'manager_screen.dart';
import 'greenhouses_screen.dart';
import 'plants_screen.dart';
import 'login_screen.dart';
import 'farmer_home_screen.dart';
import 'plant_detail_screen.dart';
import 'plant_history_screen.dart';
import 'alert_screen.dart';
import 'system_reports_screen.dart';
import 'manage_farmers_screen.dart';
import 'archived_trends_screen.dart';
import 'settings_screen.dart';
import 'settings_manager_screen.dart';
import 'settings_admin_screen.dart';
import 'generate_reports_screen.dart';
import 'admin_home_screen.dart';
import 'manage_greenhouses_screen.dart';
import 'manage_managers_screen.dart';
import 'manage_plants_screen.dart';

void main() {
  runApp(SmartAgriGuardApp());
}

class SmartAgriGuardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Agri-Guard',
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/manager': (context) => ManagerScreen(),
        '/manager_panel': (context) => ManagerScreen(),
        '/greenhouses': (context) => GreenhousesScreen(),
        '/plants': (context) => PlantsScreen(),
        '/login': (context) => LoginScreen(),
        '/farmer_home': (context) => FarmerHomeScreen(),
        '/plant_detail': (context) => PlantDetailScreen(),
        '/plant_history': (context) => PlantHistoryScreen(),
        '/alerts': (context) => AlertScreen(),
        '/system_reports': (context) => SystemReportsScreen(),
        '/generate_reports': (context) => GenerateReportsScreen(),
        '/manage_farmers': (context) => ManageFarmersScreen(),
        '/archived_trends': (context) => ArchivedTrendsScreen(),
        '/settings': (context) => SettingsScreen(),
        '/settings_manager': (context) => SettingsManagerScreen(),
        '/settings_admin': (context) => SettingsAdminScreen(),
        '/admin_home': (context) => AdminHomeScreen(),
        '/manage_greenhouses': (context) => ManageGreenhousesScreen(),
        '/manage_managers': (context) => ManageManagersScreen(),
        '/manage_plants': (context) => ManagePlantsScreen(),
      },
    );
  }
}
