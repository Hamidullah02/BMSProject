import 'package:construction/screens/inspectionlist_screen.dart';
import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';
import 'screens/search_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const RuBIMSApp());
}

class RuBIMSApp extends StatelessWidget {
  const RuBIMSApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMS',
      theme: ThemeData(
        primaryColor: const Color(0xdd1a47b8),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1a47b8),
          primary: const Color(0xFF1a47b8),
          secondary: const Color(0xFF2196F3),
        ),
        useMaterial3: true,
      ),

      home:Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF1a47b8),
          title: const Text('BMS',style: TextStyle(color: Colors.white,fontSize: 28),),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const SearchScreen(),
    const InspectionListScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF1E40AF),
        unselectedItemColor: const Color(0xFF64748B),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Inspections'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}