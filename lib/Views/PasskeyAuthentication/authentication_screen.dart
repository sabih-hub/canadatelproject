import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import 'package:testproject/Views/PasskeyAuthentication/auth_success_screen.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override

  void initState() {
    super.initState();

    // Navigate to the next screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      // Replace 'NextScreen' with the screen you want to navigate to
      Get.off(() => const  AuthSuccessScreen()); // Using Get.to() for navigation
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
                      SizedBox(height: 3.h),
                      Text(
                        'Passkey Sign in',
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w900
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 0.5.h,),
                      Text(
                        "Place your finger on the senser to continue",
                        style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.white
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 4.h),
                        child: Center(child: SvgPicture.asset("assets/images/bimetricImage.svg")),
                      ),
                      Center(
                          child: MaterialButton(
                            onPressed: (){
                              Get.back();
                            },
                            minWidth: 80.w,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Customize the radius as needed
                            ),
                            color: Color.fromRGBO(0, 52, 101, 1),
                            child: Text("Cancel", style: TextStyle(color: Colors.white,fontSize: 13.sp, fontWeight: FontWeight.w700),),
                          )
                      ),
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
