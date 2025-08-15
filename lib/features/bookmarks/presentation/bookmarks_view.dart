import 'package:flutter/material.dart';
import 'package:jewish_app/core/ui/components/components.dart';
import 'package:jewish_app/core/ui/widgets/wave_strip.dart';
import 'package:jewish_app/core/theme/theme_globals.dart';

class BookmarksView extends StatelessWidget {
  final VoidCallback onBack;

  const BookmarksView({
    super.key,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Wave background at top
        Positioned(
          left: 0,
          top: -228,
          child: SizedBox(
            width: 375,
            height: 337,
            child: Stack(
              children: [
                Positioned(
                  left: -39.88,
                  top: -172.43,
                  child: SizedBox(
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
                        onPressed: onBack,
                        icon: const Icon(
                          Icons.arrow_back,
                          color: AppThemeColors.brandPurple,
                          size: 24,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'Bookmarks',
                        style: TextStyle(
                          fontFamily: 'Taz',
                          fontSize: 18,
                          color: AppThemeColors.brandPurple,
                        ),
                      ),
                      const Spacer(),
                      const SizedBox(width: 48), // Balance the back button
                    ],
                  ),
                ),
              ),

              // Orange underline
              Container(height: 3, color: AppThemeColors.brandOrange),

              // Bookmarks list
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: _buildBookmarksList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBookmarksList() {
    // Sample bookmark data - you can replace with real data
    final bookmarks = [
      'Kitzur Shulchan Arukh 5',
      'Kitzur Shulchan Arukh 15',
      'Kitzur Shulchan Arukh 3',
      'Kitzur Shulchan Arukh 1',
      'Kitzur Shulchan Arukh 10',
    ];

    return ListView.separated(
      itemCount: bookmarks.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final isEven = index % 2 == 0;
        return _BookmarkItem(
          title: bookmarks[index],
          backgroundColor: isEven
              ? const Color(0xFFFEF6E8) // Light orange
              : const Color(0xFFF3EEF4), // Light purple
          onDelete: () => _deleteBookmark(index),
        );
      },
    );
  }

  void _deleteBookmark(int index) {
    // Handle bookmark deletion logic here
    // You can show a confirmation dialog or directly remove the item
    // For now, just a placeholder for the delete functionality
  }
}

class _BookmarkItem extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final VoidCallback onDelete;

  const _BookmarkItem({
    required this.title,
    required this.backgroundColor,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      height: 55,
      decoration: ShapeDecoration(
        color: backgroundColor,
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
      child: Row(
        children: [
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xFF62606E),
                fontSize: 16,
                fontFamily: 'Futura Std',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          IconButton(
            onPressed: onDelete,
            icon: const Icon(
              Icons.delete_outline,
              color: Color(0xFF62606E),
              size: 20,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
