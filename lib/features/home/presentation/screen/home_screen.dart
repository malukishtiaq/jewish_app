import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/progress_bar.dart';
import 'package:jewish_app/core/ui/widgets/wave_strip.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Wave background at top
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: WaveStrip.defaultWave(visibleHeight: 100, imageHeight: 357),
          ),

          // Main content
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Top spacing for wave
                  const SizedBox(height: 20),

                  // Welcome Section
                  _buildWelcomeSection(context),

                  // Divider Section
                  _buildDividerSection(),

                  // Progress Tracker Section
                  _buildProgressTrackerSection(context),

                  // Divider Section
                  _buildDividerSection(),

                  // Ritual Progress Section
                  _buildRitualProgressSection(context),

                  // Divider Section
                  _buildDividerSection(),

                  // Statistics Section
                  _buildStatisticsSection(context),

                  // Divider Section
                  _buildDividerSection(),

                  // Leadership Board Section
                  _buildLeadershipBoardSection(context),

                  // Divider Section
                  _buildDividerSection(),

                  // Sponsorship Section
                  _buildSponsorshipSection(context),

                  // Bottom spacing for navigation
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomeSection(BuildContext context) {
    return Column(
      children: [
        // Welcome text - outside the card
        const Text(
          'Welcome',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF8A5694),
            fontSize: 18,
            fontFamily: 'Taz',
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 16),

        // Card container
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFFF8F7F9),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              const Text(
                'The WHY',
                style: TextStyle(
                  color: Color(0xFFF2A41E),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Taz',
                  letterSpacing: 0.8,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Have any \'why\' questions about any aspect about Jewish practice? Try asking and find out more...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF62606E),
                  fontSize: 13,
                  fontFamily: 'Inter',
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: Container(
                      width: 265,
                      height: 37,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        style: const TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 14,
                          fontFamily: 'Futura Std',
                        ),
                        decoration: InputDecoration(
                          hintText: 'Write here',
                          hintStyle: TextStyle(
                            color: const Color(0xFF62606E).withOpacity(0.6),
                            fontSize: 14,
                            fontFamily: 'Futura Std',
                          ),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          isDense: true,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 3,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          // TODO: Handle search action
                        },
                        borderRadius: BorderRadius.circular(6),
                        child: Ink(
                          height: 37,
                          decoration: BoxDecoration(
                            color: const Color(0xFF8A5694),
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF8A5694).withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              'Search',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Taz',
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDividerSection() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Container(
          width: 103,
          height: 3,
          decoration: const BoxDecoration(
            color: Color(0x4062606E), // #62606E with 40 opacity
          ),
        ),
      ),
    );
  }

  Widget _buildProgressTrackerSection(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final progressSize = screenWidth * 0.38;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          // Title
          const Text(
            'Kitzur Shulchan Aruch Yomi',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF8A5694),
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: 'Taz',
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 6),

          // Subtitle
          const Text(
            'Check Our Progress and Achievements',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF62606E),
              fontSize: 13,
              fontFamily: 'Futura Std',
              height: 1.4,
            ),
          ),
          const SizedBox(height: 14),

          // Date with better formatting
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF4FC4D6).withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color(0xFF4FC4D6).withOpacity(0.3),
                width: 1,
              ),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  color: Color(0xFF4FC4D6),
                  size: 14,
                ),
                SizedBox(width: 6),
                Text(
                  'June 2, 2022',
                  style: TextStyle(
                    color: Color(0xFF4FC4D6),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Futura Std',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Progress Section - Redesigned for proper alignment
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Completed badge - Left
              _buildCountBadge('Completed', '5', true),

              // Circular progress indicator - Center
              SizedBox(
                width: progressSize,
                height: progressSize,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Background circle
                    SizedBox(
                      width: progressSize - 10,
                      height: progressSize - 10,
                      child: const CircularProgressIndicator(
                        value: 1.0,
                        strokeWidth: 10,
                        backgroundColor: Colors.transparent,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xFFE5E5E5),
                        ),
                      ),
                    ),

                    // Progress circle with red dot using CustomPaint
                    SizedBox(
                      width: progressSize,
                      height: progressSize,
                      child: TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 0.0, end: 0.35),
                        duration: const Duration(milliseconds: 1500),
                        curve: Curves.easeOutCubic,
                        builder: (context, value, child) {
                          return CustomPaint(
                            painter: ProgressWithDotPainter(
                              progress: value,
                              progressColor: const Color(0xFFF2A41E),
                              dotColor: const Color(0xFFD92934),
                              strokeWidth: 10,
                            ),
                          );
                        },
                      ),
                    ),

                    // Center content
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Siman',
                          style: TextStyle(
                            color: Color(0xFF62606E),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Taz',
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 2),
                        TweenAnimationBuilder<double>(
                          tween: Tween<double>(begin: 0.0, end: 35.0),
                          duration: const Duration(milliseconds: 1500),
                          curve: Curves.easeOutCubic,
                          builder: (context, value, child) {
                            return Text(
                              '${value.toInt()}%',
                              style: const TextStyle(
                                color: Color(0xFFF2A41E),
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Taz',
                                height: 1.0,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'Chapter',
                          style: TextStyle(
                            color: Color(0xFF62606E),
                            fontSize: 12,
                            fontFamily: 'Futura Std',
                          ),
                        ),
                        const SizedBox(height: 1),
                        const Text(
                          '5',
                          style: TextStyle(
                            color: Color(0xFF62606E),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Futura Std',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Pending badge - Right
              _buildCountBadge('Pending', '120', false),
            ],
          ),
          const SizedBox(height: 24),

          // Learn Today Button
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                // TODO: Navigate to learning screen
              },
              borderRadius: BorderRadius.circular(8),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF8A5694), Color(0xFF6D4473)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF8A5694).withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: SizedBox(
                  height: 48,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Learn Today',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Taz',
                          letterSpacing: 0.5,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.menu_book_rounded,
                        color: Color(0xFFF2A41E),
                        size: 22,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCountBadge(String label, String count, bool isCompleted) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF8A5694),
            fontSize: 11,
            fontWeight: FontWeight.w600,
            fontFamily: 'Taz',
            letterSpacing: 0.3,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          constraints: const BoxConstraints(
            minWidth: 48,
            minHeight: 40,
          ),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
          decoration: BoxDecoration(
            color: isCompleted
                ? const Color(0xFFD9CEDD).withOpacity(0.6)
                : const Color(0xFFD9CEDD).withOpacity(0.4),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0xFF8A5694).withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Center(
            child: Text(
              count,
              style: const TextStyle(
                color: Color(0xFF62606E),
                fontSize: 19,
                fontWeight: FontWeight.bold,
                fontFamily: 'Futura Std',
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRitualProgressSection(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                color: Color(0x14000000),
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SVG Icon and Progress text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/svg/auto_stories_FILL0_wght400_GRAD0_opsz48.svg',
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                      Color(0xFF8A5694),
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Progress',
                    style: TextStyle(
                      color: Color(0xFF8A5694),
                      fontSize: 16,
                      fontFamily: 'Taz',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Center(
                child: Text(
                  'How many have you read?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF62606E),
                    fontSize: 14,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Divider
              Center(
                child: Container(
                  width: 100,
                  height: 1,
                  color: const Color(0x4062606E),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Siman',
                style: TextStyle(
                  color: Color(0xFF8A5694),
                  fontSize: 16,
                  fontFamily: 'Taz',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'How many Parshas have you completed?',
                style: TextStyle(
                  color: Color(0xFF62606E),
                  fontSize: 13,
                  fontFamily: 'Futura Std',
                ),
              ),
              const SizedBox(height: 20),

              // Ritual items
              _buildRitualItem(
                context,
                'Morning Ritual 1 - Waking up in the morning',
                100,
                const Color(0xFFF2A41E),
                Icons.check,
              ),
              const SizedBox(height: 16),
              _buildRitualItem(
                context,
                'Morning Ritual 2 - Washing hands',
                30,
                const Color(0xFFD92934),
                null,
              ),
              const SizedBox(height: 16),
              _buildRitualItem(
                context,
                'Morning Ritual 3 - Wearing clothes and.....',
                65,
                const Color(0xFFD92934),
                null,
              ),
            ],
          ),
        ),

        // Bottom shadow strip
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          height: 7,
          decoration: const ShapeDecoration(
            color: Color(0x3F62606E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRitualItem(BuildContext context, String title, int percentage,
      Color progressColor, IconData? icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.menu_book,
              color: Color(0xFF8A5694),
              size: 20,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF62606E),
                  fontSize: 13,
                  fontFamily: 'Inter',
                ),
              ),
            ),
            Container(
              width: 47,
              height: 29,
              decoration: ShapeDecoration(
                color: icon != null
                    ? const Color(0xFFF2A41E)
                    : const Color(0xFF62606E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Center(
                child: icon != null
                    ? Icon(icon, color: Colors.white, size: 18)
                    : Text(
                        '$percentage%',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Futura Std',
                        ),
                      ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        CustomProgressBar(
          progress: percentage.toDouble(),
          progressColor: progressColor,
        ),
      ],
    );
  }

  Widget _buildStatisticsSection(BuildContext context) {
    // Hardcoded data for 11 days
    final List<Map<String, dynamic>> chartData = [
      {'day': 1, 'minutes': 8, 'isHighlight': false},
      {'day': 2, 'minutes': 27, 'isHighlight': false},
      {'day': 3, 'minutes': 25, 'isHighlight': false},
      {'day': 4, 'minutes': 38, 'isHighlight': false},
      {'day': 5, 'minutes': 34, 'isHighlight': false},
      {'day': 6, 'minutes': 27, 'isHighlight': false},
      {'day': 7, 'minutes': 18, 'isHighlight': false},
      {'day': 8, 'minutes': 40, 'isHighlight': false},
      {'day': 9, 'minutes': 45, 'isHighlight': true}, // Highlighted day
      {'day': 10, 'minutes': 35, 'isHighlight': false},
      {'day': 11, 'minutes': 42, 'isHighlight': false},
    ];

    final maxMinutes = 60.0;
    final chartHeight = 200.0;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Statistics',
            style: TextStyle(
              color: Color(0xFF8A5694),
              fontSize: 18,
              fontWeight: FontWeight.w600,
              fontFamily: 'Taz',
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Daily progress',
            style: TextStyle(
              color: Color(0xFF62606E),
              fontSize: 13,
              fontFamily: 'Futura Std',
            ),
          ),
          const SizedBox(height: 24),

          // Chart Area
          SizedBox(
            height: chartHeight + 30, // Extra space for labels
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Y-axis labels
                SizedBox(
                  width: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _buildYAxisLabel('60min'),
                      _buildYAxisLabel('50min'),
                      _buildYAxisLabel('40min'),
                      _buildYAxisLabel('30min'),
                      _buildYAxisLabel('20min'),
                      _buildYAxisLabel('10min'),
                      _buildYAxisLabel('Daily'),
                    ],
                  ),
                ),
                const SizedBox(width: 8),

                // Chart with bars
                Expanded(
                  child: Stack(
                    children: [
                      // Grid lines
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          7,
                          (index) => Container(
                            height: 1,
                            color: const Color(0xFF8A5694).withOpacity(0.1),
                          ),
                        ),
                      ),

                      // Bars
                      Column(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: chartData.map((data) {
                                final barHeight =
                                    (data['minutes'] / maxMinutes) *
                                        (chartHeight - 30);
                                return _buildBar(
                                  data['day'].toString(),
                                  barHeight,
                                  data['isHighlight'],
                                );
                              }).toList(),
                            ),
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Legend
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLegendItem(
                const Color(0xFF8A5694),
                'more study time',
              ),
              const SizedBox(width: 24),
              _buildLegendItem(
                const Color(0xFFF2A41E),
                'day you studied less',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildYAxisLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        color: Color(0xFF62606E),
        fontSize: 10,
        fontFamily: 'Futura Std',
      ),
    );
  }

  Widget _buildBar(String day, double height, bool isHighlight) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 8, // Fixed thin width for bars
              height: height,
              decoration: BoxDecoration(
                color: isHighlight
                    ? const Color(0xFFF2A41E)
                    : const Color(0xFF8A5694).withOpacity(0.7),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(3),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              day,
              style: const TextStyle(
                color: Color(0xFF8A5694),
                fontSize: 11,
                fontWeight: FontWeight.w500,
                fontFamily: 'Taz',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF62606E),
            fontSize: 11,
            fontFamily: 'Futura Std',
          ),
        ),
      ],
    );
  }

  Widget _buildLeadershipBoardSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          const Text(
            'Leadership Board',
            style: TextStyle(
              color: Color(0xFF8A5694),
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: 'Taz',
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 6),

          // Description
          const Text(
            'Check the best listeners, the best track and the best placements in the last week',
            style: TextStyle(
              color: Color(0xFF62606E),
              fontSize: 12,
              fontFamily: 'Futura Std',
              height: 1.4,
            ),
          ),
          const SizedBox(height: 20),

          // Map Section
          const Center(
            child: Text(
              'Map',
              style: TextStyle(
                color: Color(0xFF8A5694),
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Taz',
              ),
            ),
          ),
          const SizedBox(height: 16),

          // World Map with Markers
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xFF8A5694).withOpacity(0.15),
                width: 1,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                children: [
                  // Background - plain white
                  Container(
                    color: Colors.white,
                  ),

                  // World map SVG from Figma
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: SvgPicture.asset(
                        'assets/images/svg/world_map.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  // Location markers with better positioning
                  Positioned(
                    left: 70,
                    top: 65,
                    child: _buildMapMarker(),
                  ),
                  Positioned(
                    left: 95,
                    top: 85,
                    child: _buildMapMarker(),
                  ),
                  Positioned(
                    right: 85,
                    top: 60,
                    child: _buildMapMarker(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Top Locations Header
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top Locations',
                style: TextStyle(
                  color: Color(0xFF8A5694),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Taz',
                ),
              ),
              Text(
                'See All',
                style: TextStyle(
                  color: Color(0xFFD4A574),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Futura Std',
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Column Headers
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: const Color(0xFF8A5694).withOpacity(0.2),
                  width: 1,
                ),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Last 7 Days',
                  style: TextStyle(
                    color: Color(0xFFD4A574),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Futura Std',
                  ),
                ),
                Text(
                  'Plays',
                  style: TextStyle(
                    color: Color(0xFF62606E),
                    fontSize: 12,
                    fontFamily: 'Futura Std',
                  ),
                ),
              ],
            ),
          ),

          // Location Items
          _buildLocationItem('🇺🇸', 'Valey Stream', '200'),
          _buildLocationItem('🇨🇦', 'New York', '15'),
          _buildLocationItem('🇫🇮', 'Tel Aviv', '5'),
        ],
      ),
    );
  }

  Widget _buildMapMarker() {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: const Color(0xFFE5D5E8).withOpacity(0.8),
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFF8A5694).withOpacity(0.3),
          width: 2,
        ),
      ),
      child: Center(
        child: Container(
          width: 8,
          height: 8,
          decoration: const BoxDecoration(
            color: Color(0xFF8A5694),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  Widget _buildLocationItem(String flag, String location, String plays) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: const Color(0xFF8A5694).withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Text(
            flag,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              location,
              style: const TextStyle(
                color: Color(0xFF333333),
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: 'Futura Std',
              ),
            ),
          ),
          Text(
            plays,
            style: const TextStyle(
              color: Color(0xFF333333),
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontFamily: 'Futura Std',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSponsorshipSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Container(
            width: 343,
            height: 156,
            decoration: ShapeDecoration(
              color: const Color(0xFFF5F5F5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x14000000),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Orange sponsor badge with overlapping gradient border
                Center(
                  child: SizedBox(
                    width: 250.29,
                    height: 52, // Combined height to account for overlap
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // Gray divider line with gradient fade at top
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 10.29,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  const Color(0xFFD9D9D9),
                                  const Color(0xFFD9D9D9).withOpacity(0.0),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // Orange sponsor badge - overlapping with gradient
                        Positioned(
                          top: 2, // Slight overlap with gradient
                          left: 15,
                          right: 15,
                          child: ClipPath(
                            clipper: SponsorBadgeClipper(),
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF47C26),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Text(
                                  'This App is\nsponsored by',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Futura Std',
                                    height: 1.4,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 21),

                // Text content
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    'The Alan and Mindy Peyser in honor of Paul Peyser - Pinchas ben David a\'h',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF62606E),
                      fontSize: 12,
                      fontFamily: 'Futura Std',
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom shadow strip
          Container(
            width: 343,
            height: 7,
            decoration: const ShapeDecoration(
              color: Color(0x3F62606E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom clipper for sponsor badge curved bottom
class SponsorBadgeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Start from top left
    path.moveTo(0, 0);

    // Top edge
    path.lineTo(size.width, 0);

    // Right edge
    path.lineTo(size.width, size.height - 12);

    // Curved bottom - right side
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height - 8,
      size.width * 0.55,
      size.height,
    );

    // Curved bottom - center
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height + 2,
      size.width * 0.45,
      size.height,
    );

    // Curved bottom - left side
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height - 8,
      0,
      size.height - 12,
    );

    // Left edge back to start
    path.lineTo(0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// Custom painter for world map
class WorldMapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFD4A574)
      ..style = PaintingStyle.fill;

    final width = size.width;
    final height = size.height;

    // Draw more detailed world map shapes with better proportions
    final path = Path();

    // Scale factors for better proportions
    final scaleX = width;
    final scaleY = height;

    // North America - More detailed shape
    path.moveTo(scaleX * 0.10, scaleY * 0.32);
    path.lineTo(scaleX * 0.12, scaleY * 0.28);
    path.lineTo(scaleX * 0.14, scaleY * 0.25);
    path.lineTo(scaleX * 0.17, scaleY * 0.24);
    path.lineTo(scaleX * 0.20, scaleY * 0.26);
    path.lineTo(scaleX * 0.22, scaleY * 0.30);
    path.lineTo(scaleX * 0.24, scaleY * 0.33);
    path.lineTo(scaleX * 0.26, scaleY * 0.36);
    path.lineTo(scaleX * 0.27, scaleY * 0.42);
    path.lineTo(scaleX * 0.28, scaleY * 0.48);
    path.lineTo(scaleX * 0.29, scaleY * 0.54);
    path.lineTo(scaleX * 0.28, scaleY * 0.60);
    path.lineTo(scaleX * 0.26, scaleY * 0.64);
    path.lineTo(scaleX * 0.23, scaleY * 0.66);
    path.lineTo(scaleX * 0.20, scaleY * 0.66);
    path.lineTo(scaleX * 0.17, scaleY * 0.64);
    path.lineTo(scaleX * 0.15, scaleY * 0.60);
    path.lineTo(scaleX * 0.13, scaleY * 0.55);
    path.lineTo(scaleX * 0.12, scaleY * 0.48);
    path.lineTo(scaleX * 0.11, scaleY * 0.42);
    path.lineTo(scaleX * 0.10, scaleY * 0.36);
    path.close();

    // Central America
    path.moveTo(scaleX * 0.23, scaleY * 0.62);
    path.lineTo(scaleX * 0.24, scaleY * 0.60);
    path.lineTo(scaleX * 0.25, scaleY * 0.62);
    path.lineTo(scaleX * 0.26, scaleY * 0.64);
    path.lineTo(scaleX * 0.25, scaleY * 0.65);
    path.lineTo(scaleX * 0.24, scaleY * 0.64);
    path.close();

    // South America - More elongated
    path.moveTo(scaleX * 0.25, scaleY * 0.66);
    path.lineTo(scaleX * 0.27, scaleY * 0.65);
    path.lineTo(scaleX * 0.29, scaleY * 0.68);
    path.lineTo(scaleX * 0.30, scaleY * 0.72);
    path.lineTo(scaleX * 0.31, scaleY * 0.78);
    path.lineTo(scaleX * 0.30, scaleY * 0.84);
    path.lineTo(scaleX * 0.28, scaleY * 0.88);
    path.lineTo(scaleX * 0.26, scaleY * 0.90);
    path.lineTo(scaleX * 0.24, scaleY * 0.88);
    path.lineTo(scaleX * 0.23, scaleY * 0.84);
    path.lineTo(scaleX * 0.22, scaleY * 0.78);
    path.lineTo(scaleX * 0.23, scaleY * 0.72);
    path.lineTo(scaleX * 0.24, scaleY * 0.68);
    path.close();

    // Europe - More detailed
    path.moveTo(scaleX * 0.46, scaleY * 0.26);
    path.lineTo(scaleX * 0.48, scaleY * 0.24);
    path.lineTo(scaleX * 0.51, scaleY * 0.23);
    path.lineTo(scaleX * 0.54, scaleY * 0.24);
    path.lineTo(scaleX * 0.56, scaleY * 0.26);
    path.lineTo(scaleX * 0.57, scaleY * 0.29);
    path.lineTo(scaleX * 0.58, scaleY * 0.32);
    path.lineTo(scaleX * 0.57, scaleY * 0.36);
    path.lineTo(scaleX * 0.55, scaleY * 0.38);
    path.lineTo(scaleX * 0.52, scaleY * 0.39);
    path.lineTo(scaleX * 0.49, scaleY * 0.38);
    path.lineTo(scaleX * 0.47, scaleY * 0.36);
    path.lineTo(scaleX * 0.46, scaleY * 0.32);
    path.lineTo(scaleX * 0.45, scaleY * 0.29);
    path.close();

    // Africa - More accurate shape
    path.moveTo(scaleX * 0.48, scaleY * 0.42);
    path.lineTo(scaleX * 0.50, scaleY * 0.40);
    path.lineTo(scaleX * 0.53, scaleY * 0.40);
    path.lineTo(scaleX * 0.56, scaleY * 0.42);
    path.lineTo(scaleX * 0.58, scaleY * 0.46);
    path.lineTo(scaleX * 0.59, scaleY * 0.52);
    path.lineTo(scaleX * 0.59, scaleY * 0.58);
    path.lineTo(scaleX * 0.58, scaleY * 0.64);
    path.lineTo(scaleX * 0.56, scaleY * 0.70);
    path.lineTo(scaleX * 0.54, scaleY * 0.74);
    path.lineTo(scaleX * 0.51, scaleY * 0.76);
    path.lineTo(scaleX * 0.48, scaleY * 0.75);
    path.lineTo(scaleX * 0.46, scaleY * 0.72);
    path.lineTo(scaleX * 0.45, scaleY * 0.66);
    path.lineTo(scaleX * 0.45, scaleY * 0.58);
    path.lineTo(scaleX * 0.46, scaleY * 0.50);
    path.lineTo(scaleX * 0.47, scaleY * 0.45);
    path.close();

    // Middle East
    path.moveTo(scaleX * 0.58, scaleY * 0.38);
    path.lineTo(scaleX * 0.60, scaleY * 0.36);
    path.lineTo(scaleX * 0.62, scaleY * 0.38);
    path.lineTo(scaleX * 0.63, scaleY * 0.42);
    path.lineTo(scaleX * 0.62, scaleY * 0.46);
    path.lineTo(scaleX * 0.60, scaleY * 0.48);
    path.lineTo(scaleX * 0.58, scaleY * 0.46);
    path.lineTo(scaleX * 0.57, scaleY * 0.42);
    path.close();

    // Asia - Large detailed shape
    path.moveTo(scaleX * 0.62, scaleY * 0.22);
    path.lineTo(scaleX * 0.66, scaleY * 0.20);
    path.lineTo(scaleX * 0.70, scaleY * 0.20);
    path.lineTo(scaleX * 0.75, scaleY * 0.22);
    path.lineTo(scaleX * 0.80, scaleY * 0.25);
    path.lineTo(scaleX * 0.84, scaleY * 0.28);
    path.lineTo(scaleX * 0.87, scaleY * 0.32);
    path.lineTo(scaleX * 0.89, scaleY * 0.36);
    path.lineTo(scaleX * 0.90, scaleY * 0.42);
    path.lineTo(scaleX * 0.89, scaleY * 0.48);
    path.lineTo(scaleX * 0.87, scaleY * 0.52);
    path.lineTo(scaleX * 0.84, scaleY * 0.55);
    path.lineTo(scaleX * 0.80, scaleY * 0.56);
    path.lineTo(scaleX * 0.76, scaleY * 0.55);
    path.lineTo(scaleX * 0.72, scaleY * 0.52);
    path.lineTo(scaleX * 0.69, scaleY * 0.48);
    path.lineTo(scaleX * 0.67, scaleY * 0.44);
    path.lineTo(scaleX * 0.65, scaleY * 0.40);
    path.lineTo(scaleX * 0.64, scaleY * 0.36);
    path.lineTo(scaleX * 0.63, scaleY * 0.30);
    path.lineTo(scaleX * 0.62, scaleY * 0.26);
    path.close();

    // Southeast Asia/Indonesia
    path.moveTo(scaleX * 0.74, scaleY * 0.58);
    path.lineTo(scaleX * 0.77, scaleY * 0.57);
    path.lineTo(scaleX * 0.80, scaleY * 0.59);
    path.lineTo(scaleX * 0.82, scaleY * 0.62);
    path.lineTo(scaleX * 0.81, scaleY * 0.65);
    path.lineTo(scaleX * 0.78, scaleY * 0.66);
    path.lineTo(scaleX * 0.75, scaleY * 0.64);
    path.lineTo(scaleX * 0.73, scaleY * 0.61);
    path.close();

    // Australia
    path.moveTo(scaleX * 0.76, scaleY * 0.70);
    path.lineTo(scaleX * 0.79, scaleY * 0.68);
    path.lineTo(scaleX * 0.83, scaleY * 0.69);
    path.lineTo(scaleX * 0.86, scaleY * 0.72);
    path.lineTo(scaleX * 0.87, scaleY * 0.76);
    path.lineTo(scaleX * 0.85, scaleY * 0.80);
    path.lineTo(scaleX * 0.82, scaleY * 0.82);
    path.lineTo(scaleX * 0.78, scaleY * 0.81);
    path.lineTo(scaleX * 0.75, scaleY * 0.78);
    path.lineTo(scaleX * 0.74, scaleY * 0.74);
    path.close();

    canvas.drawPath(path, paint);

    // Add subtle border to continents for better definition
    final borderPaint = Paint()
      ..color = const Color(0xFFB88A54)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

// Custom painter for circular progress with red dot indicator
class ProgressWithDotPainter extends CustomPainter {
  final double progress;
  final Color progressColor;
  final Color dotColor;
  final double strokeWidth;

  ProgressWithDotPainter({
    required this.progress,
    required this.progressColor,
    required this.dotColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    // Draw progress arc
    final progressPaint = Paint()
      ..color = progressColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Start angle at bottom (90 degrees = π/2 radians)
    const startAngle = 3.14159 / 2; // 90 degrees in radians (bottom)
    final sweepAngle = 2 * 3.14159 * progress; // Progress percentage as radians

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );

    // Draw red dot at the end of the arc
    if (progress > 0) {
      final endAngle = startAngle + sweepAngle;
      final dotX = center.dx + radius * cos(endAngle);
      final dotY = center.dy + radius * sin(endAngle);

      final dotPaint = Paint()
        ..color = dotColor
        ..style = PaintingStyle.fill;

      canvas.drawCircle(
        Offset(dotX, dotY),
        8.5, // Dot radius (17/2)
        dotPaint,
      );
    }
  }

  @override
  bool shouldRepaint(ProgressWithDotPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
