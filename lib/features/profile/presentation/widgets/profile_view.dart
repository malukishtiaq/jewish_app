import 'package:jewish_app/core/ui/components/components.dart';
import 'package:jewish_app/core/ui/widgets/wave_strip.dart';
import 'package:jewish_app/features/profile/presentation/widgets/update_profile_view.dart';
import 'package:jewish_app/features/bookmarks/bookmarks.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool _isEditing = false;
  bool _showBookmarks = false;

  static const Color _purple = Color(0xFF8A5694);
  static const Color _orange = Color(0xFFF2A41E);
  static const Color _divider = Color(0xFFE9EFFF);

  @override
  Widget build(BuildContext context) {
    // If editing, show update profile view
    if (_isEditing) {
      return UpdateProfileView(
        onBack: () {
          setState(() {
            _isEditing = false;
          });
        },
      );
    }

    // If showing bookmarks, show bookmarks view
    if (_showBookmarks) {
      return BookmarksView(
        onBack: () {
          setState(() {
            _showBookmarks = false;
          });
        },
      );
    }

    // Show main profile view
    return _buildMainProfile();
  }

  Widget _buildMainProfile() {
    return Stack(
      children: [
        // Background wave clipped to show only the bottom slice
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: WaveStrip.defaultWave(
            visibleHeight: 100,
            imageHeight: 357,
          ),
        ),
        // Foreground content over the wave
        Positioned.fill(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 50),
              SafeArea(
                bottom: false,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0)
                          .copyWith(right: 8),
                  child: Row(
                    children: [
                      const Spacer(),
                      const Text(
                        'Profile',
                        style: TextStyle(
                          fontFamily: 'Taz',
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: _purple,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () => _showEditProfile(),
                        child: const Text(
                          'Edit',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF6C7C89),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(height: 3, color: _orange),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildAvatar(context),
                      AppSpaces.lg,
                      _buildProgress(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showEditProfile() {
    setState(() {
      _isEditing = true;
    });
  }

  // wave header is handled as a background in the Stack above

  Widget _buildAvatar(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: _purple, width: 10),
              ),
              child: const ClipOval(
                child: ColoredBox(color: Color(0xFFD9D9D9)),
              ),
            ),
            Positioned(
              right: 3,
              bottom: 14,
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Color(0xFFEC164F),
                  shape: BoxShape.circle,
                ),
                child: const Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Center(
                      child: Icon(
                        Icons.photo_camera_back_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    Positioned(
                      right: -2,
                      top: -2,
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.add,
                          size: 12,
                          color: Color(0xFFEC164F),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildProgress(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 44,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: const BoxDecoration(color: _orange),
          child: const Text(
            'PROGRESS',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        _buildDivider(),
        _progressRow(
          icon: Icons.task_alt,
          label: 'Overall Progress',
          trailing: '0,7%',
        ),
        _buildDivider(),
        _progressRow(
          icon: Icons.check_circle_outline,
          label: 'Chapters Completed',
          trailing: '5',
        ),
        _buildDivider(),
        _progressRow(
          icon: Icons.playlist_add_check_circle_outlined,
          label: 'Chapters Started',
          trailing: '0',
        ),
        _buildDivider(),
        _progressRow(
          icon: Icons.bookmark_outline,
          label: 'Bookmarks (5)',
          trailing: null,
          trailingIcon: Icons.chevron_right,
          onTap: () => _showBookmarksView(),
        ),
        _buildDivider(),
      ],
    );
  }

  Widget _progressRow({
    required IconData icon,
    required String label,
    String? trailing,
    IconData? trailingIcon,
    VoidCallback? onTap,
  }) {
    Widget rowContent = Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      child: Row(
        children: [
          Icon(icon, color: _orange, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontFamily: 'Taz',
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: _purple,
              ),
            ),
          ),
          if (trailing != null)
            Text(
              trailing,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color(0xFF252525),
              ),
            ),
          if (trailingIcon != null)
            Icon(trailingIcon, color: const Color(0xFF6C7C89)),
        ],
      ),
    );

    // If onTap is provided, wrap with InkWell for tap functionality
    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        splashColor: _purple.withValues(alpha: 0.1),
        highlightColor: _purple.withValues(alpha: 0.05),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: rowContent,
        ),
      );
    }

    return rowContent;
  }

  Widget _buildDivider() {
    return const Divider(color: _divider, height: 1, thickness: 1);
  }

  void _showBookmarksView() {
    setState(() {
      _showBookmarks = true;
    });
  }
}
