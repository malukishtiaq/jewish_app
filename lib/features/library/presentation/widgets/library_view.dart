import 'package:flutter/material.dart';
import 'package:jewish_app/core/ui/components/components.dart';
import 'package:jewish_app/core/ui/widgets/wave_strip.dart';
import 'package:jewish_app/core/theme/theme_globals.dart';
import 'package:jewish_app/core/theme/custom_text_styles.dart';
import 'package:jewish_app/features/library/presentation/widgets/chapter_detail_view.dart';

class LibraryView extends StatefulWidget {
  const LibraryView({super.key});

  @override
  State<LibraryView> createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView> {
  String? _selectedCategory;
  List<String>? _selectedChapters;

  @override
  Widget build(BuildContext context) {
    // If a category is selected, show chapter detail view
    if (_selectedCategory != null && _selectedChapters != null) {
      return ChapterDetailView(
        categoryTitle: _selectedCategory!,
        chapters: _selectedChapters!,
        onBack: () {
          setState(() {
            _selectedCategory = null;
            _selectedChapters = null;
          });
        },
      );
    }

    // Show library index view
    return _buildLibraryIndex();
  }

  Widget _buildLibraryIndex() {
    const items = [
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
                        return _LibraryRow(
                          title: items[index],
                          onTap: () => _showChapterDetail(items[index]),
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
    );
  }

  void _showChapterDetail(String categoryTitle) {
    final chapters = _getChaptersForCategory(categoryTitle);
    setState(() {
      _selectedCategory = categoryTitle;
      _selectedChapters = chapters;
    });
  }

  List<String> _getChaptersForCategory(String category) {
    switch (category) {
      case 'Morning Ritual':
        return [
          'Waking up in the morning',
          'Washing hands',
          'Wearing clothes and carrying oneself',
          'Using the restroom and asher yatzar',
        ];
      case 'Holy Objects':
        return [
          'Tefillin',
          'Tallit',
          'Mezuzah',
          'Torah scroll',
        ];
      case 'Morning Tefila':
        return [
          'Modeh Ani',
          'Birkot HaShachar',
          'Pesukei D\'Zimra',
          'Shema and Amidah',
        ];
      case 'Torah Life':
        return [
          'Learning Torah',
          'Teaching Torah',
          'Honoring Torah scholars',
          'Torah study schedule',
        ];
      case 'Chanuka':
        return [
          'Lighting the menorah',
          'Chanuka prayers',
          'Chanuka customs',
          'Chanuka foods',
        ];
      case 'Dietary Laws':
        return [
          'Kashrut basics',
          'Meat and dairy separation',
          'Kosher certification',
          'Kitchen preparation',
        ];
      case 'Brachos':
        return [
          'Before eating',
          'After eating',
          'Special occasions',
          'New experiences',
        ];
      case 'Business':
        return [
          'Honest business practices',
          'Contracts and agreements',
          'Employee relations',
          'Customer service',
        ];
      case 'Evening Ritual':
        return [
          'Evening prayers',
          'Bedtime Shema',
          'Preparing for sleep',
          'Reflection and gratitude',
        ];
      case 'Shabbos':
        return [
          'Preparing for Shabbos',
          'Shabbos meals',
          'Shabbos activities',
          'Havdalah',
        ];
      case 'Purim':
        return [
          'Reading Megillah',
          'Purim feast',
          'Giving gifts',
          'Charity on Purim',
        ];
      case 'Pesach':
        return [
          'Preparing for Pesach',
          'Seder preparation',
          'Seder night',
          'Pesach foods',
        ];
      case 'Yom Tov':
        return [
          'Rosh Hashanah',
          'Yom Kippur',
          'Sukkot',
          'Shavuot',
        ];
      case 'Relationships':
        return [
          'Family relationships',
          'Marriage',
          'Parenting',
          'Community relations',
        ];
      default:
        return [
          'Chapter 1 Introduction',
          'Chapter 2 Basic concepts',
          'Chapter 3 Practical application',
          'Chapter 4 Advanced topics',
        ];
    }
  }
}

class _LibraryRow extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _LibraryRow({
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 44,
        child: Row(
          children: [
            const SizedBox(width: 16),
            const Icon(Icons.menu_book_rounded,
                color: AppThemeColors.brandOrange, size: 18),
            const SizedBox(width: 12),
            Expanded(
                child:
                    Text(title, style: CustomTextStyles.libraryItem(context))),
            const Icon(Icons.chevron_right, color: AppThemeColors.textMuted),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
