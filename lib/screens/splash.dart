import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                  angle: _animation.value,
                  child: Transform.scale(
                    scale: _animation.value,
                    child: Image.asset(
                        'assets/images/logo.png'), 
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return _controller.isCompleted
                    ? FadeTransition(
                        opacity: _animation,
                        child: const Text('SPRINKLE AND SPROUT', style: TextStyle(fontSize: 25,)),
                      )
                    : const Text(" ",style: TextStyle(fontSize: 25,));
              },
            )
          ],
        ),
      ),
    );
  }
}
