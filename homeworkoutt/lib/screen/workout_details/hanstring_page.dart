import 'package:flutter/material.dart';

class HamstringsWorkoutPage extends StatelessWidget {
  const HamstringsWorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hamstrings Workout", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE8EAF6), Colors.white],  // Light indigo to white
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
                      "lib/assets/images/hamstrings.png",
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
                            "HAMSTRINGS",
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
                  color: const Color(0xFFE8EAF6),  // Light indigo
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFC5CAE9)),  // Slightly darker indigo
                ),
                child: const Row(
                  children: [
                    Icon(Icons.fitness_center, color: Colors.indigo),
                    SizedBox(width: 8),
                    Text(
                      "Hamstring Exercises",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Exercise Cards
              _buildExerciseCard(
                  "Glute Bridges",
                  "Activates hamstrings & glutes",
                  "3 sets x 20 reps",
                  "lib/assets/images/glute_bridges.png",
                  Colors.indigo,
                  const Color(0xFFE8EAF6)  // Light indigo
              ),
              _buildExerciseCard(
                  "Single-Leg Glute Bridge",
                  "Isolates each hamstring",
                  "3 sets x 12 reps each leg",
                  "lib/assets/images/single_leg_bridge.png",
                  Colors.indigo,
                  const Color(0xFFE8EAF6)
              ),
              _buildExerciseCard(
                  "Good Mornings",
                  "Hip hinge for hamstring length",
                  "3 sets x 15 reps",
                  "lib/assets/images/good_mornings.png",
                  Colors.indigo,
                  const Color(0xFFE8EAF6)
              ),
              _buildExerciseCard(
                  "Romanian Deadlifts",
                  "Hamstring & lower back strength",
                  "3 sets x 12 reps",
                  "lib/assets/images/romanian_deadlifts.png",
                  Colors.indigo,
                  const Color(0xFFE8EAF6)
              ),
              _buildExerciseCard(
                  "Hamstring Slides",
                  "Eccentric hamstring focus",
                  "3 sets x 10 reps",
                  "lib/assets/images/hamstring_slides.png",
                  Colors.indigo,
                  const Color(0xFFE8EAF6)
              ),
              _buildExerciseCard(
                  "Lying Leg Curls",
                  "Isolated hamstring contraction",
                  "3 sets x 15 reps",
                  "lib/assets/images/lying_leg_curls.png",
                  Colors.indigo,
                  const Color(0xFFE8EAF6)
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
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    elevation: 5,
                    shadowColor: Colors.indigo.withOpacity(0.5),
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
                      "• Keep your back flat during hip hinges\n"
                          "• Focus on the stretch in the back of your legs\n"
                          "• Squeeze your glutes at the top of bridges\n"
                          "• Use a towel or socks for sliding exercises",
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