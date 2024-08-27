import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            // First Layer: Full background image
            Positioned.fill(
              child: Image.asset(
                'assets/images/splash.png', // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
            // Second Layer: Container with opacity
            Positioned.fill(
              child: Container(
                color:
                    Colors.black.withOpacity(0.5), // Semi-transparent overlay
              ),
            ),
            // Third Layer: Column with content
            Positioned.fill(
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ingin Informasi Lebih Lanjut?',
                      style: TextStyle(
                        fontSize: 54, // Font size for the title
                        fontWeight: FontWeight.bold, // Bold text for the title
                        color: const Color.fromARGB(
                            255, 255, 255, 255), // Text color
                      ),
                    ),
                    SizedBox(height: 35),
                    Text(
                      'Hubungi :',
                      style: TextStyle(
                        fontSize: 14, // Font size for the title
                        fontWeight:
                            FontWeight.normal, // Bold text for the title
                        color: Color(0xffA8A8A8), // Text color
                      ),
                    ),
                    SizedBox(height: 5),
                    TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: '867718299487', // Label text
                        labelStyle: TextStyle(
                            color: Color(0xffA8A8A8)), // Label text style
                        prefixIcon: Padding(
                          padding:
                              const EdgeInsets.all(8.0), // Padding for the icon
                          child: Icon(
                            Icons.phone,
                            color: Color(0xffA8A8A8),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(8.0), // Rounded corners
                          borderSide: BorderSide(
                              color: Color(0xffA8A8A8)), // Border color
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                              color: Colors.green), // Border color when focused
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 15.0), // Padding inside text field
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // !
            Positioned.fill(
              child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Color(0xffA8A8A8),
                          size: 24,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
