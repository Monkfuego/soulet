import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/homesl.jpg'), // Background image
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  buildFormContainer(),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      // Handle Forget Password action here
                      print('Forget Password tapped');
                    },
                    child: Text(
                      'Forget password?',
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Or login with',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: isLoading,
            child: Container(
              color: Colors.green
                  .withOpacity(0.9), // Green background during loading
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'SOUL',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'CurvyFont', // Use your desired font family
                      ),
                    ),
                    SizedBox(height: 20),
                    LinearProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Color(
                          0xff1b5e20)), // Dark green color for the loading bar
                      backgroundColor: Colors
                          .transparent, // Transparent background for the loading bar
                      minHeight: 2, // Slim loading bar
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFormContainer() {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          buildInputField('Username'),
          SizedBox(height: 10),
          buildInputField('Password', obscureText: true),
          SizedBox(height: 10),
          buildInputField('Confirm Password', obscureText: true),
          SizedBox(height: 10),
          TextButton(
            onPressed: () {
              setState(() {
                isLoading = true; // Start loading animation
                // Simulate loading process
                Future.delayed(Duration(seconds: 2), () {
                  setState(() {
                    isLoading = false; // Stop loading animation
                  });
                });
              });
            },
            child: Text('Confirm'),
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInputField(String hintText, {bool obscureText = false}) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white.withOpacity(0.5), // Adjust transparency here
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      obscureText: obscureText,
    );
  }
}
