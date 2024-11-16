import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:testproject/Views/Home/home_screen.dart';
import 'package:testproject/Views/PasskeyAuthentication/authentication_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
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
                    gradient: const LinearGradient(
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
                      SizedBox(height: 2.h),
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w900
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 2.h,),
                      Text(
                          "Email",
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.white
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          isDense: true, // Reduces height by making the TextField dense
                          contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.transparent, // Default border color
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.blue, // Customize the color here
                              width: 1.0, // Optional: customize the border thickness
                            ),
                          ),
                          hintText: "Jhon@gmail.com",
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(188, 190, 192, 1),
                              fontSize: 13.sp
                          ),
                          filled: true,
                        ),
                      ),
                      SizedBox(height: 2.h,),
                      Text(
                        "Password",
                        style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.white
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          isDense: true, // Reduces height by making the TextField dense
                          contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.transparent, // Default border color
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.blue, // Customize the color here
                              width: 1.0, // Optional: customize the border thickness
                            ),
                          ),
                          hintText: "Password",
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(188, 190, 192, 1),
                              fontSize: 13.sp
                          ),
                          filled: true,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Center(
                        child: MaterialButton(
                          onPressed: (){
                            Get.to(()=> const HomeScreen());
                          },
                          minWidth: 80.w,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // Customize the radius as needed
                          ),
                          color: const Color.fromRGBO(0, 52, 101, 1),
                          child: Text("Signup", style: TextStyle(color: Colors.white,fontSize: 13.sp, fontWeight: FontWeight.w700),),
                        )
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.h),
                        child: Center(child: Text("or Choose", style: TextStyle(color: Colors.white, fontSize: 13.sp),)),
                      ),
                      Center(
                        child: Container(
                          width: 100.w,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Get.to(() => const AuthenticationScreen());
                            },
                            icon: SvgPicture.asset("assets/images/thumbIcon.svg"), // Icon data for elevated button
                            label: Text(
                              "Sign In with passkey",
                              style: TextStyle(
                                color: Color.fromRGBO(0, 52, 101, 1),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: const Color.fromRGBO(0, 52, 101, 1),
                              backgroundColor: Colors.white, // Icon and text color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), // Set your custom border radius here
                              ),
                              side: const BorderSide(
                                color: Colors.transparent, // Border color// Border thickness
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 1.5.h,),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: const  BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: Colors.white,
                                ),
                                height: 3.h,

                                child: Center(child: SvgPicture.asset("assets/images/googleIcon.svg")),
                              ),
                            ),
                            SizedBox(width: 5.w,),
                            Expanded(
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: Colors.white,
                                ),
                                height: 3.h,
                                child: Center(child: SvgPicture.asset("assets/images/githubIcon.svg")),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height:3.h),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Don't have an account yet?",
                                style: TextStyle(
                                  color: Colors.white, // First part in white color
                                  fontSize: 13.sp,
                                ),
                              ),
                              TextSpan(
                                text: " Register for free",
                                style: TextStyle(
                                  color: const Color.fromRGBO(5, 251, 43, 1), // Second part in blue color
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )
                        ,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
