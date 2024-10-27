import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkle_and_sprout/controllers/auth_controller.dart';
import 'package:sprinkle_and_sprout/screens/sign_in.dart';
import 'package:sprinkle_and_sprout/widgets/custom_button.dart';
import 'package:sprinkle_and_sprout/widgets/logo_hero.dart';

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
      duration: const Duration(milliseconds: 850),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    // Start the animation
    _controller.forward();

    // Check authentication status and navigate after a delay
    Future.delayed(const Duration(seconds: 2), _checkAuthentication);
  }

  // Auth check and navigation
  void _checkAuthentication() async {
    final authController = Get.find<AuthController>();
    await authController.checkUserVerification();

    if (authController.isUserVerified.value) {
      Get.offNamed('/home');
    } else {
      Get.offNamed('/login');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Display the splash screen animation
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 30),
              Column(
                children: [
                  LogoWithAnimation(animation: _animation),
                  AppName(animation: _animation, controller: _controller),
                ],
              ),
              const SizedBox(),
              GetStarted(animation: _animation, controller: _controller),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class LogoWithAnimation extends StatelessWidget {
  const LogoWithAnimation({
    super.key,
    required Animation<double> animation,
  }) : _animation = animation;

  final Animation<double> _animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return Transform.scale(
          scale: _animation.value,
          child: const LogoHero(),
        );
      },
    );
  }
}

class AppName extends StatelessWidget {
  const AppName({
    super.key,
    required Animation<double> animation,
    required AnimationController controller,
  })  : _animation = animation,
        _controller = controller;

  final Animation<double> _animation;
  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return _controller.isCompleted
            ? FadeTransition(
                opacity: _animation,
                child: const Text('ECO-METER',
                    style: TextStyle(
                      color: Color.fromRGBO(153, 154, 148, 1),
                      fontSize: 45,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(255, 143, 142, 142),
                        ),
                      ],
                    )),
              )
            : const Text(" ",
                style: TextStyle(
                  fontSize: 25,
                ));
      },
    );
  }
}

class GetStarted extends StatelessWidget {
  const GetStarted({
    super.key,
    required Animation<double> animation,
    required AnimationController controller,
  })  : _animation = animation,
        _controller = controller;

  final Animation<double> _animation;
  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return _controller.isCompleted
            ? FadeTransition(
                opacity: _animation,
                child: GreenButton(
                    text: "Get Started",
                    onPressed: () => Get.off(() => SignInScreen())),
              )
            : const Text(" ",
                style: TextStyle(
                  fontSize: 35,
                ));
      },
    );
  }
}
