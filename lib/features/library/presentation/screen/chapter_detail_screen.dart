import 'package:flutter/material.dart';
import 'package:jewish_app/core/ui/components/components.dart';
import 'package:jewish_app/core/ui/widgets/wave_strip.dart';
import 'package:jewish_app/core/theme/theme_globals.dart';
import 'package:jewish_app/core/theme/custom_text_styles.dart';

class ChapterDetailScreen extends StatelessWidget {
  final String categoryTitle;
  final List<String> chapters;
  
  const ChapterDetailScreen({
    super.key,
    required this.categoryTitle,
    required this.chapters,
  });

  static const String routeName = '/chapter-detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Wave background at top
          Positioned(
            left: 0,
            top: -228,
            child: Container(
              width: 375,
              height: 337,
              child: Stack(
                children: [
                  Positioned(
                    left: -39.88,
                    top: -172.43,
                    child: Container(
                      width: 464.05,
                      height: 491.83,
                      child: WaveStrip.defaultWave(
                        visibleHeight: 337,
                        imageHeight: 491.83,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Main content
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header with back button and title
                SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.chevron_left,
                            color: AppThemeColors.brandPurple,
                            size: 24,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            categoryTitle,
                            style: CustomTextStyles.welcomeBackTaz(context).copyWith(
                              fontSize: 18,
                              color: AppThemeColors.brandPurple,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(width: 48), // Balance the back button
                      ],
                    ),
                  ),
                ),
                
                // Orange underline
                Container(height: 3, color: AppThemeColors.brandOrange),
                
                // Content area
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Container(
                      width: 343,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFAFAFA),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x14000000),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        itemCount: chapters.length,
                        separatorBuilder: (_, __) => const Divider(
                          color: AppThemeColors.dividerBlue,
                          height: 1,
                        ),
                        itemBuilder: (context, index) {
                          return _ChapterRow(
                            title: chapters[index],
                            chapterNumber: index + 1,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChapterRow extends StatelessWidget {
  final String title;
  final int chapterNumber;
  
  const _ChapterRow({
    required this.title,
    required this.chapterNumber,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Row(
        children: [
          const SizedBox(width: 16),
          const Icon(
            Icons.menu_book_rounded,
            color: AppThemeColors.brandOrange,
            size: 18,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Chapter $chapterNumber $title',
              style: CustomTextStyles.libraryItem(context),
            ),
          ),
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
