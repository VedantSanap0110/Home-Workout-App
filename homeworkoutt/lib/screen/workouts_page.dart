import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkoutPage extends StatelessWidget {
  final String selectedGender;
  final double weight;

  const WorkoutPage({super.key, required this.selectedGender, required this.weight});

  void startWorkout(BuildContext context, String workoutType) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Starting $workoutType Workout")),
    );
  }
  void startWorkoutNow(BuildContext context, String workoutType) {
    if (workoutType == "Upper Body") {
      Get.toNamed('/upper-body');
    } else if (workoutType == "Lower Body") {
      Get.toNamed('/lower-body');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Select Workout Type"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.greenAccent, Colors.deepOrange],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Choose a Workout:",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(

                  onTap: () => startWorkoutNow(context, "Upper Body"),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.redAccent.shade700,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Image.asset(
                          "lib/assets/images/upper.jpg", // Replace with actual image
                          height: 150,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Upper Body Workout",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: () => startWorkoutNow(context, "Lower Body"),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent.shade700,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Image.asset(
                          "lib/assets/images/lower.jpg", // Replace with actual image
                          height: 150,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Lower Body Workout",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),


    );
  }
}
