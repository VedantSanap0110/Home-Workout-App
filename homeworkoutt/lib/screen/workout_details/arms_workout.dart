import 'package:flutter/material.dart';

class ArmsWorkoutPage extends StatelessWidget {
  const ArmsWorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Arms Workout", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFEBEE), Colors.white],  // Light red to white
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Image with Overlay
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "lib/assets/images/arms.png",
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                          ],
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "ARMS",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.timer, color: Colors.white),
                              SizedBox(width: 4),
                              Text(
                                "18 min",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Section Title
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFEBEE),  // Light red
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFFFCDD2)),  // Slightly darker red
                ),
                child: const Row(
                  children: [
                    Icon(Icons.fitness_center, color: Colors.red),
                    SizedBox(width: 8),
                    Text(
                      "Arm Exercises",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Exercise Cards
              _buildExerciseCard(
                  "Push-ups",
                  "Chest, triceps & core",
                  "3 sets x 15 reps",
                  "lib/assets/images/pushups.png",
                  Colors.red,
                  const Color(0xFFFFEBEE)  // Light red
              ),
              _buildExerciseCard(
                  "Tricep Dips",
                  "Focus on triceps",
                  "3 sets x 12 reps",
                  "lib/assets/images/tricep_dips.png",
                  Colors.red,
                  const Color(0xFFFFEBEE)
              ),
              _buildExerciseCard(
                  "Bicep Curls",
                  "Targets biceps with household items",
                  "3 sets x 15 reps each arm",
                  "lib/assets/images/bicep_curls.png",
                  Colors.red,
                  const Color(0xFFFFEBEE)
              ),
              _buildExerciseCard(
                  "Diamond Push-ups",
                  "Intense tricep focus",
                  "3 sets x 10 reps",
                  "lib/assets/images/diamond_pushups.png",
                  Colors.red,
                  const Color(0xFFFFEBEE)
              ),
              _buildExerciseCard(
                  "Hammer Curls",
                  "Biceps & forearm strength",
                  "3 sets x 12 reps each arm",
                  "lib/assets/images/hammer_curls.png",
                  Colors.red,
                  const Color(0xFFFFEBEE)
              ),
              _buildExerciseCard(
                  "Plank to Push-up",
                  "Full arm & core workout",
                  "3 sets x 8 reps",
                  "lib/assets/images/plank_pushup.png",
                  Colors.red,
                  const Color(0xFFFFEBEE)
              ),

              const SizedBox(height: 20),

              // Start Workout Button
              Container(
                width: double.infinity,
                height: 60,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Add navigation to workout tracking or timer
                  },
                  icon: const Icon(Icons.play_circle_filled, size: 28),
                  label: const Text(
                      "START WORKOUT",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    elevation: 5,
                    shadowColor: Colors.red.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),

              // Tips Section
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFE3F2FD),  // Light blue
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: const Color(0xFFBBDEFB)),  // Slightly darker blue
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.lightbulb, color: Colors.blue),
                        SizedBox(width: 8),
                        Text(
                          "Pro Tips",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "• Train both biceps and triceps for balanced development\n"
                          "• Use water bottles or cans as weights if needed\n"
                          "• Focus on slow, controlled movements\n"
                          "• Don't lock your elbows at the top of movements",
                      style: TextStyle(fontSize: 14, height: 1.5),
                    ),
                  ],
                ),
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
            // Exercise image
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
            // Exercise details
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
            // Arrow icon
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.arrow_forward_ios,
                color: themeColor,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}