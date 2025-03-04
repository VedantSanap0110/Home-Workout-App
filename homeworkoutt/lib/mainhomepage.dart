import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'screen/gender_page.dart';
import 'login.dart'; // Import your login page

class MainHomePage extends StatelessWidget {
  MainHomePage({super.key});

  final PageController _pageController = PageController();

  // Logout Function
  void _logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut(); // Firebase Logout
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Login()), // Navigate to Login
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error logging out: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.black),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orangeAccent, Colors.deepOrange],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Logo
            Image.asset(
              'lib/assets/images/fitness_logo.png',
              height: 150,
            ),
            const SizedBox(height: 20),

            // App Title
            const Text(
              "Home Workout App",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),

            // App Description
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                "Get fit from the comfort of your home with guided workouts designed just for you!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.white70),
              ),
            ),
            const SizedBox(height: 30),

            // Introductory Image Slider
            SizedBox(
              height: 200,
              child: PageView(
                controller: _pageController,
                children: [
                  Image.asset('lib/assets/images/workout1.png', fit: BoxFit.cover),
                  Image.asset('lib/assets/images/workout2.jpg', fit: BoxFit.cover),
                  Image.asset('lib/assets/images/workout3.jpg', fit: BoxFit.cover),
                ],
              ),
            ),
            const SizedBox(height: 15),

            // Page Indicator
            // SmoothPageIndicator(
            //   controller: _pageController,
            //   count: 3,
            //   effect: const ExpandingDotsEffect(
            //     dotHeight: 8,
            //     dotWidth: 8,
            //     activeDotColor: Colors.white,
            //   ),
            // ),
            const SizedBox(height: 30),

            // Continue Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GenderPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                "Continue",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
