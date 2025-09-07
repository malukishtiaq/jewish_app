import 'package:flutter/material.dart';
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
                  const SizedBox(height: 50),

                  // Welcome Section
                  _buildWelcomeSection(context),

                  // Divider Section
                  _buildDividerSection(),

                  // Progress Tracker Section
                  _buildProgressTrackerSection(context),

                  // Ritual Progress Section
                  _buildRitualProgressSection(context),

                  // Statistics Section
                  _buildStatisticsSection(context),

                  // Leadership Board Section
                  _buildLeadershipBoardSection(context),

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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.all(16),
      padding: EdgeInsets.all(screenWidth * 0.05), // Responsive padding
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
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
        children: [
          Text(
            'Welcome',
            style: TextStyle(
              color: const Color(0xFF8A5694),
              fontSize: screenWidth * 0.045, // Responsive font size
              fontFamily: 'Taz',
            ),
          ),
          SizedBox(height: screenHeight * 0.01), // Responsive spacing
          Text(
            'The WHY',
            style: TextStyle(
              color: const Color(0xFFF2A41E),
              fontSize: screenWidth * 0.05, // Responsive font size
              fontFamily: 'Taz',
            ),
          ),
          SizedBox(height: screenHeight * 0.02), // Responsive spacing
          Text(
            'Have any \'why\' questions about any aspect about Jewish practice? Try asking and find out more...',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF62606E),
              fontSize: screenWidth * 0.035, // Responsive font size
              fontFamily: 'Inter',
            ),
          ),
          SizedBox(height: screenHeight * 0.025), // Responsive spacing
          Row(
            children: [
              Expanded(
                child: Container(
                  height: screenHeight * 0.045, // Responsive height
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: const Color(0xFF8A5694),
                      width: 0.5,
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Write here',
                        hintStyle: TextStyle(
                          color: const Color(0xFF62606E),
                          fontSize: screenWidth * 0.035, // Responsive font size
                          fontFamily: 'Futura Std',
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: screenWidth * 0.02), // Responsive spacing
              Container(
                height: screenHeight * 0.045, // Responsive height
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                decoration: BoxDecoration(
                  color: const Color(0xFF8A5694),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.white,
                    width: 0.5,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Search',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.035, // Responsive font size
                      fontFamily: 'Taz',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDividerSection() {
    return Container(
      height: 3,
      color: const Color(0xFFF2A41E),
    );
  }

  Widget _buildProgressTrackerSection(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final progressSize =
        screenWidth * 0.45; // Increased from 0.35 to 0.45 to fit text properly

    return Container(
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
        children: [
          const Text(
            'Kitzur Shulchan Aruch Yomi',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF8A5694),
              fontSize: 18,
              fontFamily: 'Taz',
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Check Our Progress and Achievements',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF62606E),
              fontSize: 14,
              fontFamily: 'Futura Std',
            ),
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.calendar_today,
                color: Color(0xFF4FC4D6),
                size: 16,
              ),
              SizedBox(width: 4),
              Text(
                '06/02/22',
                style: TextStyle(
                  color: Color(0xFF4FC4D6),
                  fontSize: 16,
                  fontFamily: 'Futura Std',
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              // Completed count
              Expanded(
                child: Column(
                  children: [
                    const Text(
                      'Completed',
                      style: TextStyle(
                        color: Color(0xFF8A5694),
                        fontSize: 13,
                        fontFamily: 'Taz',
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD9CEDD),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        '5',
                        style: TextStyle(
                          color: Color(0xFF62606E),
                          fontSize: 19,
                          fontFamily: 'Futura Std',
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Circular progress indicator
              Flexible(
                child: Center(
                  child: Container(
                    width: progressSize,
                    height: progressSize,
                    child: const Stack(
                      alignment: Alignment.center,
                      children: [
                        CircularProgressIndicator(
                          value: 0.35,
                          strokeWidth: 8,
                          backgroundColor: Color(0xFF939393),
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Color(0xFFF2A41E)),
                        ),
                        Column(
                          children: [
                            Text(
                              'Siman',
                              style: TextStyle(
                                color: Color(0xFF62606E),
                                fontSize: 18, // Increased from 16
                                fontFamily: 'Taz',
                              ),
                            ),
                            SizedBox(height: 4), // Added spacing
                            Text(
                              '35%',
                              style: TextStyle(
                                color: Color(0xFFF2A41E),
                                fontSize: 38, // Increased from 34
                                fontFamily: 'Taz',
                              ),
                            ),
                            SizedBox(height: 4), // Added spacing
                            Text(
                              'Chapter',
                              style: TextStyle(
                                color: Color(0xFF62606E),
                                fontSize: 15, // Increased from 13
                                fontFamily: 'Futura Std',
                              ),
                            ),
                            SizedBox(height: 2), // Added spacing
                            Text(
                              '5',
                              style: TextStyle(
                                color: Color(0xFF62606E),
                                fontSize: 22, // Increased from 20
                                fontFamily: 'Futura Std',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Pending count
              Expanded(
                child: Column(
                  children: [
                    const Text(
                      'Pending',
                      style: TextStyle(
                        color: Color(0xFF8A5694),
                        fontSize: 13,
                        fontFamily: 'Taz',
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD9CEDD),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        '120',
                        style: TextStyle(
                          color: Color(0xFF62606E),
                          fontSize: 19,
                          fontFamily: 'Futura Std',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFF8A5694),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Learn Today',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Taz',
                  ),
                ),
                SizedBox(width: 8),
                Icon(
                  Icons.menu_book,
                  color: Color(0xFFF2A41E),
                  size: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRitualProgressSection(BuildContext context) {
    return Container(
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
        children: [
          const Text(
            'Progress',
            style: TextStyle(
              color: Color(0xFF8A5694),
              fontSize: 16,
              fontFamily: 'Taz',
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'How many have you read?',
            style: TextStyle(
              color: Color(0xFF62606E),
              fontSize: 14,
              fontFamily: 'Inter',
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
    );
  }

  Widget _buildRitualItem(BuildContext context, String title, int percentage,
      Color progressColor, IconData? icon) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonSize =
        screenWidth * 0.1; // Reduced from 0.12 to 0.1 for better proportion

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
              width: buttonSize,
              height: buttonSize * 0.6,
              decoration: BoxDecoration(
                color: icon != null
                    ? const Color(0xFFF2A41E)
                    : const Color(0xFF62606E),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: icon != null
                    ? Icon(icon, color: Colors.white, size: buttonSize * 0.4)
                    : Text(
                        '$percentage%',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: buttonSize * 0.25,
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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
        children: [
          const Text(
            'Statistics',
            style: TextStyle(
              color: Color(0xFF8A5694),
              fontSize: 16,
              fontFamily: 'Taz',
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Daily progress',
            style: TextStyle(
              color: Color(0xFF62606E),
              fontSize: 13,
              fontFamily: 'Futura Std',
            ),
          ),
          const SizedBox(height: 20),

          // Simple bar chart representation
          SizedBox(
            height: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(11, (index) {
                double height = 0.1;
                Color color = const Color(0xFF939393);

                if (index == 0) {
                  height = 0.2;
                  color = const Color(0xFF8A5694);
                } else if (index == 8) {
                  height = 0.8;
                  color = const Color(0xFFF2A41E);
                }

                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 20,
                      height: 80 * height,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${index + 1}',
                      style: const TextStyle(
                        color: Color(0xFF8A5694),
                        fontSize: 12,
                        fontFamily: 'Taz',
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeadershipBoardSection(BuildContext context) {
    return Container(
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
        children: [
          const Text(
            'Leadership Board',
            style: TextStyle(
              color: Color(0xFF8A5694),
              fontSize: 16,
              fontFamily: 'Taz',
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Top locations',
            style: TextStyle(
              color: Color(0xFF62606E),
              fontSize: 13,
              fontFamily: 'Futura Std',
            ),
          ),
          const SizedBox(height: 20),

          // Leadership board items
          _buildLeaderboardItem('1', 'New York', '1,234', true),
          const SizedBox(height: 12),
          _buildLeaderboardItem('2', 'Los Angeles', '987', false),
          const SizedBox(height: 12),
          _buildLeaderboardItem('3', 'Chicago', '756', false),
        ],
      ),
    );
  }

  Widget _buildLeaderboardItem(
      String rank, String location, String score, bool isFirst) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: isFirst ? const Color(0xFFF2A41E) : const Color(0xFFD9CEDD),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              rank,
              style: TextStyle(
                color: isFirst ? Colors.white : const Color(0xFF62606E),
                fontSize: 16,
                fontFamily: 'Taz',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            location,
            style: const TextStyle(
              color: Color(0xFF62606E),
              fontSize: 16,
              fontFamily: 'Futura Std',
            ),
          ),
        ),
        Text(
          score,
          style: const TextStyle(
            color: Color(0xFF8A5694),
            fontSize: 16,
            fontFamily: 'Taz',
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildSponsorshipSection(BuildContext context) {
    return Container(
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
        children: [
          const Text(
            'Sponsored by',
            style: TextStyle(
              color: Color(0xFF8A5694),
              fontSize: 16,
              fontFamily: 'Taz',
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Center(
              child: Text(
                'Sponsor Content',
                style: TextStyle(
                  color: Color(0xFF62606E),
                  fontSize: 14,
                  fontFamily: 'Futura Std',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
