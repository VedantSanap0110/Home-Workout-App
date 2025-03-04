import 'package:flutter/material.dart';

class AbsWorkoutPage extends StatelessWidget {
  const AbsWorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Abs Workout", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.amber,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFFDE7), Colors.white],  // Light amber to white
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
                      "lib/assets/images/abs.png",
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
                            "ABS",
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
                                "20 min",
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
                  color: const Color(0xFFFFFDE7),  // Light amber
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFFFF59D)),  // Slightly darker amber
                ),
                child: const Row(
                  children: [
                    Icon(Icons.fitness_center, color: Colors.amber),
                    SizedBox(width: 8),
                    Text(
                      "Core Exercises",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Exercise Cards
              _buildExerciseCard(
                  "Crunches",
                  "Basic core activation",
                  "3 sets x 20 reps",
                  "lib/assets/images/crunches.png",
                  Colors.amber,
                  const Color(0xFFFFFDE7)  // Light amber
              ),
              _buildExerciseCard(
                  "Plank",
                  "Builds core stability",
                  "3 sets x 30 seconds",
                  "lib/assets/images/plank.png",
                  Colors.amber,
                  const Color(0xFFFFFDE7)
              ),
              _buildExerciseCard(
                  "Russian Twists",
                  "Works obliques & rotational strength",
                  "3 sets x 20 reps",
                  "lib/assets/images/russian_twists.png",
                  Colors.amber,
                  const Color(0xFFFFFDE7)
              ),
              _buildExerciseCard(
                  "Mountain Climbers",
                  "Dynamic core & cardio exercise",
                  "3 sets x 30 seconds",
                  "lib/assets/images/mountain_climbers.png",
                  Colors.amber,
                  const Color(0xFFFFFDE7)
              ),
              _buildExerciseCard(
                  "Leg Raises",
                  "Targets lower abs",
                  "3 sets x 15 reps",
                  "lib/assets/images/leg_raises.png",
                  Colors.amber,
                  const Color(0xFFFFFDE7)
              ),
              _buildExerciseCard(
                  "Bicycle Crunches",
                  "Works entire core & obliques",
                  "3 sets x 20 reps",
                  "lib/assets/images/bicycle_crunches.png",
                  Colors.amber,
                  const Color(0xFFFFFDE7)
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
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.white,
                    elevation: 5,
                    shadowColor: Colors.amber.withOpacity(0.5),
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
                      "• Breathe out during the contraction phase\n"
                          "• Quality over quantity - focus on full range of motion\n"
                          "• Keep your lower back supported\n"
                          "• Don't pull on your neck during crunches",
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