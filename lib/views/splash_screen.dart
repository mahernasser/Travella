import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kimit_tours/views/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LoginScreen();
      }));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   systemNavigationBarIconBrightness: Brightness.light,
    //   systemNavigationBarDividerColor: null,
    //   statusBarColor: Color(0xFFD59898),
    //   statusBarIconBrightness: Brightness.light,
    //   statusBarBrightness: Brightness.dark,
    // ));
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.light,

      statusBarColor: Color(0xffff8d00), //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              'assets/images/splashtwo.jpg',
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 150,
              child: DefaultTextStyle(
                style: TextStyle(
                    fontFamily: 'bonus',
                    fontWeight: FontWeight.w500,
                    shadows: <Shadow>[
                      Shadow(
                        offset: const Offset(4.0, 5.0),
                        blurRadius: 10,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ],
                    color: const Color(0xFFffff38),
                    fontSize: 35),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('Where it all begin',
                        cursor: '', speed: const Duration(milliseconds: 50)),
                  ],
                  isRepeatingAnimation: false,
                  onTap: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
