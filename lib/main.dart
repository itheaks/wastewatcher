import 'package:flutter/material.dart';
import 'package:wastewatcher/ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Waste Watcher',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: SplashScreen(), // Use SplashScreen as the initial screen
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    // Create the animation
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController!);

    // Start the animation
    _animationController!.forward();

    // Wait for the animation to complete
    _animationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Animation completed, navigate to the main UI screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const UI()),
        );
      }
    });
  }

  @override
  void dispose() {
    // Dispose the animation controller
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FadeTransition(
          opacity: _animation!,
          child: Image.asset('assets/img.png'), // Replace with your splash screen image
        ),
      ),
    );
  }
}
