import 'package:flutter/material.dart';

class LowerBodyPage extends StatelessWidget {
  const LowerBodyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lower Body Workouts",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF3D5AFE), // Deeper blue
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.white),
            onPressed: () {
              // Navigate to favorites or show favorites dialog
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF3D5AFE), Color(0xFF8C9EFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            // Motivational banner
            Container(
              margin: const EdgeInsets.fromLTRB(16, 10, 16, 20),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(Icons.bolt, color: Color(0xFF3D5AFE), size: 32),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Build a Stronger Lower Body",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3D5AFE),
                          ),
                        ),
                        Text(
                          "Choose a muscle group to get started!",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Grid of workout cards
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.85, // Slightly taller cards
                  ),
                  itemCount: _workouts.length,
                  itemBuilder: (context, index) {
                    final workout = _workouts[index];
                    return _buildWorkoutCard(context, workout);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      // FAB for quick workout selection
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Show dialog to choose a random workout or quick start
        },
        backgroundColor: const Color(0xFF3D5AFE),
        label: const Text("Quick Start"),
        icon: const Icon(Icons.play_arrow),
      ),
    );
  }

  Widget _buildWorkoutCard(BuildContext context, Map<String, dynamic> workout) {
    List<Color> gradientColors = workout["gradientColors"] ?? [Colors.grey, Colors.black]; // Fallback colors

    return Hero(
      tag: "workout-${workout["id"]}",
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => Navigator.pushNamed(context, workout["route"]),
          borderRadius: BorderRadius.circular(16),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 8,
            shadowColor: Colors.black38,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: gradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Stack(
                children: [
                  // Subtle pattern overlay
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Opacity(
                        opacity: 0.1,
                        child: Image.asset(
                          "assets/images/pattern.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  // Content
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Exercise count badge
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "${workout["exerciseCount"]} Exercises",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: gradientColors[0],
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Workout image
                        Image.asset(
                          workout["imagePath"],
                          height: 70,
                          width: 70,
                        ),
                        const SizedBox(height: 12),

                        // Title
                        Text(
                          workout["title"],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 6),

                        // Duration
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.timer_outlined,
                              color: Colors.white70,
                              size: 14,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              workout["duration"],
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Workout data
final List<Map<String, dynamic>> _workouts = [
  {
    "id": "quads",
    "title": "Quads",
    "imagePath": "assets/images/quads.png",
    "route": "/quads-workout",
    "exerciseCount": 6,
    "duration": "25 min",
    "gradientColors": [Color(0xFF5E35B1), Color(0xFF7C4DFF)], // Purple
  },
  {
    "id": "hamstrings",
    "title": "Hamstrings",
    "imagePath": "assets/images/hamstrings.png",
    "route": "/hamstring-workout",
    "exerciseCount": 6,
    "duration": "20 min",
    "gradientColors": [Color(0xFF1E88E5), Color(0xFF42A5F5)], // Blue
  },
  {
    "id": "calves",
    "title": "Calves",
    "imagePath": "assets/images/calves.png",
    "route": "/calves-workout",
    "exerciseCount": 4,
    "duration": "15 min",
    "gradientColors": [Color(0xFF43A047), Color(0xFF66BB6A)], // Green
  },
  {
    "id": "glutes",
    "title": "Glutes",
    "imagePath": "assets/images/glutes.png",
    "route": "/glutes-workout",
    "exerciseCount": 6,
    "duration": "25 min",
    "gradientColors": [Color(0xFFE91E63), Color(0xFFF48FB1)], // Pink
  },
];
