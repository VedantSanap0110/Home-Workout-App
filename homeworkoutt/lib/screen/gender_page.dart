import 'package:flutter/material.dart';
import 'weight_page.dart';

class GenderPage extends StatelessWidget {
  const GenderPage({super.key});

  void _selectGender(BuildContext context, String gender) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WeightPage(selectedGender: gender)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Gender"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        elevation: 0,
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
            const Text(
              "Choose Your Gender",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildGenderCard(context, "Male", "lib/assets/images/male.jpg", Colors.blue),
                const SizedBox(width: 30),
                _buildGenderCard(context, "Female", "lib/assets/images/female.jpg", Colors.pink),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderCard(BuildContext context, String gender, String imagePath, Color borderColor) {
    return GestureDetector(
      onTap: () => _selectGender(context, gender),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: borderColor, width: 3),
        ),
        elevation: 8,
        shadowColor: Colors.black45,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Image.asset(imagePath, height: 120),
              const SizedBox(height: 15),
              Text(
                gender,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: borderColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
