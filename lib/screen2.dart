import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive sizing
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 57, 55, 161),
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: screenWidth * 0.08,
              height: screenWidth * 0.08,
            ),
            SizedBox(width: screenWidth * 0.02),
            Text(
              'News',
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.045,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/screen3');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 97, 97, 255),
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.06,
                    vertical: screenHeight * 0.02,
                  ),
                ),
                child: Text(
                  'Breaking News',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.035,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              newsArticleWidget(
                imagePath: 'assets/images/new1.jpg',
                title: 'Tesla Cybertruck\n',
                description:
                '''Cybertruck Gets MASSIVE Upgrades for 2025! From performance boosts to cutting-edge technology, the 2025 Cybertruck is set to dominate the roads like never before. ''',
                screenWidth: screenWidth,
              ),
              SizedBox(height: screenHeight * 0.02),
              newsArticleWidget(
                imagePath: 'assets/images/new2.jpg',
                title: 'Corona-Virus\n',
                description:
                'The Coronavirus Tracker is no longer being updated due to the unfeasibility of providing statistically valid global totals, as the majority of countries have now stopped reporting.',
                screenWidth: screenWidth,
              ),
              SizedBox(height: screenHeight * 0.02),
              newsArticleWidget(
                imagePath: 'assets/images/new3.png',
                title: 'AI Technology\n',
                description:
                '''AI has been developing on a very high pace.The field of artificial intelligence is helping research organizations like OpenAI to develop safe and beneficial AI.''',
                screenWidth: screenWidth,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget newsArticleWidget({
    required String imagePath,
    required String title,
    required String description,
    required double screenWidth,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imagePath,
          height: screenWidth * 0.45,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        SizedBox(height: screenWidth * 0.02),
        RichText(
          text: TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontSize: screenWidth * 0.035,
            ),
            children: [
              TextSpan(
                text: '$title ',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                ),
              ),
              TextSpan(
                text: description,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
