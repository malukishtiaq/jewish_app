import 'package:jewish_app/core/ui/components/components.dart';
import '../widgets/app_bottom_navigation.dart';
import '../../../profile/presentation/widgets/profile_view.dart';
import '../../../settings/presentation/widgets/settings_view.dart';
import '../../presentation/widgets/library_view.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/HomeScreen';
  final int initialIndex;
  const HomeScreen({super.key, this.initialIndex = 0});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _currentIndex;

  final List<Widget> _tabs = const [
    Center(child: Text('Home')),
    LibraryView(),
    SettingsView(),
    ProfileView(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.onPrimary,
      body: SafeArea(top: true, bottom: false, child: _tabs[_currentIndex]),
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
