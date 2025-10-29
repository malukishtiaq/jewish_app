import 'package:flutter/material.dart';
import 'package:jewish_app/features/home/presentation/screen/home_screen.dart';
import 'package:jewish_app/features/library/library.dart';
import 'package:jewish_app/features/settings/presentation/widgets/settings_view.dart';
import 'package:jewish_app/features/profile/presentation/widgets/profile_view.dart';

/// Main Navigation Screen - This is the primary home route with bottom navigation
/// When users navigate to '/home', they get this complete experience
class MainNavigationScreen extends StatefulWidget {
  static const String routeName = '/main';

  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const LibraryScreen(),
    const SettingsView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      height: 83,
      decoration: const BoxDecoration(
        color: Color(0xFF8A5694),
        boxShadow: [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 8,
            offset: Offset(2, 0),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, 'Home', 0),
            _buildNavItem(Icons.library_books, 'Library', 1),
            _buildNavItem(Icons.settings, 'Settings', 2),
            _buildNavItem(Icons.person, 'Profile', 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isActive = _currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isActive ? const Color(0xFFF2A41E) : Colors.white,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isActive ? const Color(0xFFF2A41E) : Colors.white,
              fontSize: 10,
              fontFamily: 'Inter',
            ),
          ),
        ],
      ),
    );
  }
}
