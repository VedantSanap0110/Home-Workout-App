import 'package:flutter/material.dart';

class CalvesWorkoutPage extends StatelessWidget {
  const CalvesWorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calves Workout", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE8F5E9), Colors.white],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Exercise Cards
              _buildExerciseCard(
                  "Standing Calf Raises",
                  "Basic calf strengthening",
                  "4 sets x 25 reps",
                  "lib/assets/images/standing_calf_raises.png",
                  Colors.green,
                  const Color(0xFFE8F5E9)
              ),
              _buildExerciseCard(
                  "Single-Leg Calf Raises",
                  "Increased resistance per leg",
                  "3 sets x 15 reps each leg",
                  "lib/assets/images/single_leg_calf.png",
                  Colors.green,
                  const Color(0xFFE8F5E9)
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExerciseCard(String title, String description, String sets, String imagePath, Color themeColor, Color backgroundColor) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.fitness_center, size: 16, color: themeColor),
                      const SizedBox(width: 4),
                      Text(
                        sets,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: themeColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 20, color: themeColor),
          ],
        ),
      ),
    );
  }
}
