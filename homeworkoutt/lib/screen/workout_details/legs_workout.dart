import 'package:flutter/material.dart';

class LegsWorkoutPage extends StatelessWidget {
  const LegsWorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Legs Workout")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/legs.png", height: 200),
            const SizedBox(height: 20),
            _buildExerciseCard("Squats", "Builds leg strength and stability."),
            _buildExerciseCard("Lunges", "Great for balance and leg muscles."),
            _buildExerciseCard("Leg Press", "Targets quads, hamstrings, and glutes."),
            _buildExerciseCard("Step-ups", "Improves leg endurance and strength."),
          ],
        ),
      ),
    );
  }

  Widget _buildExerciseCard(String title, String description) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(description, style: const TextStyle(fontSize: 16, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
