import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:homeworkoutt/screen/start_workout/chest.dart';
import 'package:homeworkoutt/screen/workout_details/hanstring_page.dart';
import 'package:homeworkoutt/screen/workout_details/quads_workout.dart';
import 'package:homeworkoutt/wrapper.dart';
import 'package:get/get.dart';
// import 'screen/login_page.dart';
// import 'screen/workouts_page.dart';
import 'screen/upper_body_page.dart';
import 'screen/lower_body_page.dart';
import 'screen/workout_details/chest_workout.dart';
import 'screen/workout_details/back_workout.dart';
import 'screen/workout_details/abs_workout.dart';
import 'screen/workout_details/arms_workout.dart';
import 'screen/workout_details/shoulders_workout.dart';
import 'screen/workout_details/legs_workout.dart';
import 'screen/workout_details/glutes_workout.dart';
import 'screen/workout_details/calves_workout.dart';
// import 'package:homeworkoutt/wrapper.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Workout App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),

      home: Wrapper(),
      // initialRoute: '/',
      routes: {
        // '/': (context) => const LoginPage(),
        // '/workouts': (context) => const WorkoutPage(),
        '/upper-body': (context) => const UpperBodyPage(),
        '/lower-body': (context) => const LowerBodyPage(),
        '/chest-workout': (context) => const ChestWorkoutPage(),
        '/back-workout': (context) => const BackWorkoutPage(),
        '/abs-workout': (context) => const AbsWorkoutPage(),
        '/arms-workout': (context) => const ArmsWorkoutPage(),
        '/shoulders-workout': (context) => const ShouldersWorkoutPage(),
        '/legs-workout': (context) => const LegsWorkoutPage(),
        '/glutes-workout': (context) => const GlutesWorkoutPage(),
        '/calves-workout': (context) => const CalvesWorkoutPage(),
        '/quads-workout' : (context) => const QuadsWorkoutPage(),
        '/hamstring-workout' : (context) => const HamstringsWorkoutPage(),
        '/chest-detail' : (context) => const ChestWorkoutDetailPage()
      },
    );
  }
}
