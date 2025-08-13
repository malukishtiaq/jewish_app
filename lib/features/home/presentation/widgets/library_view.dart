import 'package:flutter/material.dart';
import 'package:jewish_app/core/ui/components/components.dart';
import 'package:jewish_app/core/ui/widgets/wave_strip.dart';
import 'package:jewish_app/core/theme/theme_globals.dart';
import 'package:jewish_app/core/theme/custom_text_styles.dart';

class LibraryView extends StatelessWidget {
  const LibraryView({super.key});

  @override
  Widget build(BuildContext context) {
    final items = const [
      'Morning Ritual',
      'Holy Objects',
      'Morning Tefila',
      'Torah Life',
      'Chanuka',
      'Dietary Laws',
      'Brachos',
      'Business',
      'Evening Ritual',
      'Shabbos',
      'Purim',
      'Pesach',
      'Yom Tov',
      'Relationships',
    ];

    return Stack(
      children: [
        // Wave top background
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: WaveStrip.defaultWave(visibleHeight: 90, imageHeight: 357),
        ),
        Positioned.fill(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SafeArea(
                bottom: false,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Text('Kitzur Shulchan Aruch',
                      style:
                          CustomTextStyles.settingsLabelTaz(context).copyWith(
                        fontSize: 18,
                        color: AppThemeColors.brandPurple,
                      )),
                ),
              ),
              Container(height: 3, color: AppThemeColors.brandOrange),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFFAFAFA),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x14000000),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      itemCount: items.length,
                      separatorBuilder: (_, __) => const Divider(
                          color: AppThemeColors.dividerBlue, height: 1),
                      itemBuilder: (context, index) {
                        return _LibraryRow(title: items[index]);
                      },
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

class _LibraryRow extends StatelessWidget {
  final String title;
  const _LibraryRow({required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Row(
        children: [
          const SizedBox(width: 16),
          const Icon(Icons.menu_book_rounded,
              color: AppThemeColors.brandOrange, size: 18),
          const SizedBox(width: 12),
          Expanded(
              child: Text(title, style: CustomTextStyles.libraryItem(context))),
          const Icon(Icons.chevron_right, color: AppThemeColors.textMuted),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
