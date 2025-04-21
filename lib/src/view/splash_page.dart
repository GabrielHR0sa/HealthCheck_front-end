import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
       Navigator.of(context).popAndPushNamed('/login');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                alignment: Alignment.topCenter,
                width: largura * 1,
                height: altura * 1,
                decoration:  BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 20.0,
                      offset: Offset(0.0, 0.90),
                    ),
                  ],

                  color: Theme.of(context).colorScheme.background,
                ),
              ),
              Center(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    
                    width: largura * 1,
                    height: altura * 0.4,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 230, 230, 230),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SpinKitWave(
                          color: Color.fromARGB(255, 56, 113, 193),
                          size: 50.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
          .animate(onPlay: (controller) => controller.repeat())
          .shimmer(delay: 1000.ms, duration: 600.ms),
    );
  }
}
