import 'package:flutter/material.dart';
import 'package:jewish_app/core/ui/components/components.dart';
import 'package:jewish_app/features/home/presentation/widgets/app_bottom_navigation.dart';
import 'package:jewish_app/features/library/library.dart';
import 'package:jewish_app/features/profile/presentation/widgets/profile_view.dart';
import 'package:jewish_app/features/settings/presentation/widgets/settings_view.dart';

class HomeScreen extends StatefulWidget {
  final int initialIndex;
  
  const HomeScreen({
    super.key,
    this.initialIndex = 0,
  });

  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  final List<Widget> _tabs = [
    const Center(child: Text('Home Content')),
    const LibraryView(),
    const SettingsView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.onPrimary,
      body: SafeArea(
        top: true,
        bottom: false,
        child: _tabs[_currentIndex],
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: AppBottomNavigation(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
        ),
      ),
    );
  }
}
