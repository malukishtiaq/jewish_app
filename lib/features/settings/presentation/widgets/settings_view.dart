import 'package:flutter/material.dart';
import 'package:jewish_app/core/common/utils/utils.dart';
import 'package:jewish_app/core/ui/components/components.dart';
import 'package:jewish_app/core/ui/widgets/wave_strip.dart';
import 'package:jewish_app/core/theme/theme_globals.dart';
import 'package:jewish_app/core/theme/custom_text_styles.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  static const Color purple = AppThemeColors.brandPurple;
  static const Color orange = AppThemeColors.brandOrange;

  bool darkMode = false;

  void _handleLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text(
            'Log Out',
            style: TextStyle(
              fontFamily: 'Taz',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFF8A5694),
            ),
          ),
          content: const Text(
            'Are you sure you want to log out?',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              color: Color(0xFF62606E),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text(
                'Cancel',
                style: TextStyle(
                  fontFamily: 'Taz',
                  fontSize: 14,
                  color: Color(0xFF6C7C89),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8A5694),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.of(dialogContext).pop();
                Utils.logout();
              },
              child: const Text(
                'Log Out',
                style: TextStyle(
                  fontFamily: 'Taz',
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Wave background at top
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: WaveStrip.defaultWave(visibleHeight: 100, imageHeight: 357),
        ),

        Positioned.fill(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header overlay
              SafeArea(
                bottom: false,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    children: [
                      const Spacer(),
                      Text(
                        'Settings',
                        style: CustomTextStyles.welcomeBackTaz(context)
                            .copyWith(fontSize: 28, color: purple),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              Container(height: 3, color: orange),

              // Body
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: AppSpacing.horizontalLG,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const _SectionHeader(title: 'ACCOUNT'),
                        const _LinedRow(
                          label: 'Email',
                          trailingText: 'johnpaul@myemail.com',
                          boldTrailing: false,
                        ),
                        const _ChevronRow(label: 'Notifications'),
                        const _SectionHeader(title: 'PREFERENCES'),
                        _SwitchRow(
                          label: 'Enable Dark Mode',
                          value: darkMode,
                          onChanged: (v) => setState(() => darkMode = v),
                        ),
                        const _LinedRow(
                            label: 'Start Date', trailingText: '05/05/2022'),
                        const _LinedRow(
                            label: 'Chapter',
                            trailingText: 'Chapter 1 - Washing hands'),
                        const _LinedRow(
                            label: 'Cycle Type', trailingText: '7 Days'),
                        const _LinedRow(
                            label: 'Turn Notification',
                            trailingText: 'Turn Notification'),
                        const _LinedRow(
                            label: 'Select Time', trailingText: '09:00 AM'),
                        const _SectionHeader(title: 'INFORMATION'),
                        _ChevronRow(
                          label: 'Log out',
                          rightIcon: Icons.logout_outlined,
                          onTap: () => _handleLogout(context),
                        ),
                        24.verticalSpace,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(color: Color(0xFFF2A41E)),
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Colors.white,
          letterSpacing: 0.4,
        ),
      ),
    );
  }
}

class _LinedRow extends StatelessWidget {
  final String label;
  final String? trailingText;
  final bool boldTrailing;
  const _LinedRow(
      {required this.label, this.trailingText, this.boldTrailing = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 56,
          alignment: Alignment.center,
          child: Row(
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontFamily: 'Taz',
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF8A5694),
                ),
              ),
              const Spacer(),
              if (trailingText != null)
                Text(
                  trailingText!,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight:
                        boldTrailing ? FontWeight.w700 : FontWeight.w500,
                    color: const Color(0xFF6C7C89),
                  ),
                  textAlign: TextAlign.right,
                ),
            ],
          ),
        ),
        const Divider(
            color: AppThemeColors.dividerBlue, height: 1, thickness: 1),
      ],
    );
  }
}

class _ChevronRow extends StatelessWidget {
  final String label;
  final IconData? rightIcon;
  final VoidCallback? onTap;
  const _ChevronRow({
    required this.label,
    this.rightIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: SizedBox(
            height: 56,
            child: Row(
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontFamily: 'Taz',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF8A5694),
                  ),
                ),
                const Spacer(),
                Icon(rightIcon ?? Icons.chevron_right,
                    color: const Color(0xFF6C7C89)),
              ],
            ),
          ),
        ),
        const Divider(
            color: AppThemeColors.dividerBlue, height: 1, thickness: 1),
      ],
    );
  }
}

class _SwitchRow extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;
  const _SwitchRow(
      {required this.label, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 56,
          child: Row(
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontFamily: 'Taz',
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF8A5694),
                ),
              ),
              const Spacer(),
              Switch(
                value: value,
                onChanged: onChanged,
                activeColor: const Color(0xFF8A5694),
              ),
            ],
          ),
        ),
        const Divider(
            color: AppThemeColors.dividerBlue, height: 1, thickness: 1),
      ],
    );
  }
}
