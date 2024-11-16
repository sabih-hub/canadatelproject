import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:testproject/Views/Home/home_screen.dart';

class AuthSuccessScreen extends StatefulWidget {
  const AuthSuccessScreen({super.key});

  @override
  State<AuthSuccessScreen> createState() => _AuthSuccessScreenState();
}

class _AuthSuccessScreenState extends State<AuthSuccessScreen> {
  @override

  void initState() {
    super.initState();

    // Navigate to the next screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      // Replace 'NextScreen' with the screen you want to navigate to
      Get.off(() => const  HomeScreen()); // Using Get.to() for navigation
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background with oval radial gradient
          Container(
            width: 100.w,
            height: 100.h,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Color.fromRGBO(0, 133, 255, 1),
                  Color.fromRGBO(0, 52, 101, 1),
                ],
                radius: 0.8,
                center: Alignment.center, // Adjusts the center of the gradient
                // focal: Alignment(0, -0.3), // Creates more of an oval shape
                focalRadius: 0.9, // Adjusts the shape
              ),
            ),
          ),

          Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: SvgPicture.asset("assets/images/spiral1.svg"),
              )),
          Align(
              alignment: Alignment.bottomRight,
              child: SvgPicture.asset("assets/images/spiral2.svg")),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20, bottom: 50.h),
                child: SvgPicture.asset("assets/images/spiral3.svg"),
              )),

          // Blurred container overlay
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(88, 130, 193, 0.49),
                              Color.fromRGBO(88, 130, 193, 0.11),
                            ]
                        ),
                        border: Border.all(
                            color: const Color.fromRGBO(88, 130, 193, 0.28)
                        )
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    width: 80.w,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'Spiral',
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 3.h),
                          child: Center(
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle, // Ensures the container is circular
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(5, 251, 243, 0.65), // Glow color
                                    blurRadius: 40, // Controls the spread of the glow
                                    spreadRadius: 0.5, // Controls the intensity of the glow
                                    offset: Offset(0, 0), // No offset to center the glow
                                  ),
                                ],
                              ),
                              child: SvgPicture.asset(
                                "assets/images/Check.svg", // Adjust the height as needed
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Text("Authentication Successful", style: TextStyle(color: Colors.white, fontSize: 17.sp, fontWeight: FontWeight.w700),),
                        ),
                        SizedBox(height: 4.h,),
                        Center(
                          child: Text("Redirecting you to your account", style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w400),),
                        )
                      ],
                    )
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
