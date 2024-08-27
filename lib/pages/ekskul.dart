import 'package:flutter/material.dart';

class ExtracurricularScreen extends StatefulWidget {
  const ExtracurricularScreen({super.key});

  @override
  State<ExtracurricularScreen> createState() => _ExtracurricularStateScreen();
}

class _ExtracurricularStateScreen extends State<ExtracurricularScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff252525),
        iconTheme: IconThemeData(color: Colors.white),

        // leading: Padding(
        //   padding: const EdgeInsets.only(
        //       left: 8, right : 0), // Adjust padding to move the widget more left
        //   child: IconButton(
        //     icon: Icon(Icons.arrow_back),
        //     onPressed: () {
        //       Navigator.pop(context); // Navigate back to the previous screen
        //     },
        //   ), // Use SchoolInfoWidget as the leading widget
        // ),

        title: Text(
          'Daftar Eskul',
          style: TextStyle(
            fontSize: 30, // Font size for the title
            fontWeight: FontWeight.bold, // Bold text for the title
            color: const Color.fromARGB(255, 255, 255, 255), // Text color
          ),
        ),
      ),
      backgroundColor: Color(0xff252525),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ImageGradientCard(
              //   imagePath:
              //       'assets/images/sekolah 1.png', // Replace with your image path
              //   text: 'Your Text Here',
              // ),
              // SizedBox(height: 15),
              // ImageGradientCard(
              //   imagePath:
              //       'assets/images/sekolah 1.png', // Replace with your image path
              //   text: 'Your Text Here',
              // ),
              // SizedBox(height: 15),
              // ImageGradientCard(
              //   imagePath:
              //       'assets/images/sekolah 1.png', // Replace with your image path
              //   text: 'Your Text Here',
              // ),
              // SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}

class SchoolInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15, left: 15),
      child: Align(
        alignment: Alignment.centerLeft, // Aligns the text to the left side
        child: Text(
          'Daftar Eskul',
          style: TextStyle(
            fontSize: 30, // Font size for the title
            fontWeight: FontWeight.bold, // Bold text for the title
            color: const Color.fromARGB(255, 255, 255, 255), // Text color
          ),
        ),
      ),
    );
  }
}

class ImageGradientCard extends StatelessWidget {
  final String imagePath; // Image path to be passed to the widget
  final String text; // Text to be displayed at the bottom left

  ImageGradientCard({
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      margin: EdgeInsets.all(16.0), // Margin around the card
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 56, 56, 56), // Border color
          width: 2.0, // Border width
        ),
        borderRadius: BorderRadius.circular(12.0), // Rounded corners
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0), // Rounded corners
        child: Stack(
          children: [
            // Background image with gradient
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath), // Image asset path
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Gradient overlay
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Colors.black
                          .withOpacity(0.6), // Darker color at bottom left
                      Colors.black
                          .withOpacity(0.1), // Lighter color at top right
                    ],
                    stops: [0.0, 1.0], // Gradient stops
                  ),
                ),
              ),
            ),
            // Text at the bottom left
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                color: Colors.transparent, // Semi-transparent background for text readability
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
