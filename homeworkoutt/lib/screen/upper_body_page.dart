import 'package:flutter/material.dart';

class UpperBodyPage extends StatelessWidget {
  const UpperBodyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Upper Body Workouts",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF3D5AFE),
        elevation: 0,
        centerTitle: true,
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
                  const Icon(Icons.fitness_center, color: Color(0xFF3D5AFE), size: 32),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Strengthen Your Upper Body",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3D5AFE),
                          ),
                        ),
                        Text(
                          "Select a muscle group to begin!",
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.85,
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
    );
  }

  Widget _buildWorkoutCard(BuildContext context, Map<String, dynamic> workout) {
    List<Color> gradientColors = workout["gradientColors"] ?? [Colors.grey, Colors.black];

    return InkWell(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(workout["imagePath"], height: 70, width: 70),
              const SizedBox(height: 12),
              Text(
                workout["title"],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> _workouts = [
  {
    "id": "chest",
    "title": "Chest",
    "imagePath": "lib/assets/images/chest.png",
    "route": "/chest-workout",
    "gradientColors": [Color(0xFFE53935), Color(0xFFFF8A80)], // Deeper red to light coral
  },
  {
    "id": "back",
    "title": "Back",
    "imagePath": "lib/assets/images/back.png",
    "route": "/back-workout",
    "gradientColors": [Color(0xFF1565C0), Color(0xFF64B5F6)], // Deep blue to light blue
  },
  {
    "id": "abs",
    "title": "Abs",
    "imagePath": "lib/assets/images/abs.png",
    "route": "/abs-workout",
    "gradientColors": [Color(0xFFFFA000), Color(0xFFFFD54F)], // Deep amber to light amber
  },
  {
    "id": "arms",
    "title": "Arms",
    "imagePath": "lib/assets/images/arms.png",
    "route": "/arms-workout",
    "gradientColors": [Color(0xFFE53935), Color(0xFFFF8A80)], // Deep purple to light purple
  },
  {
    "id": "shoulders",
    "title": "Shoulders",
    "imagePath": "lib/assets/images/shoulders.png",
    "route": "/shoulders-workout",
    "gradientColors": [Color(0xFF2E7D32), Color(0xFF81C784)], // Deep green to light green
  },
];