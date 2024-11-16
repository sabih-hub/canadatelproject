import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';
import 'package:testproject/Views/Authentication/enter_pin_screen.dart';


class TempScreen extends StatefulWidget {
  const TempScreen({super.key});

  @override
  State<TempScreen> createState() => _TempScreenState();
}

class _TempScreenState extends State<TempScreen> {

  void initState() {
    super.initState();

    // Navigate to the next screen after 3 seconds
    Future.delayed(const Duration(seconds: 2), () {
      // Replace 'NextScreen' with the screen you want to navigate to
      Get.off(() => EnterPinScreen()); // Using Get.to() for navigation
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 20.w,
              height: 10.h,
              decoration:  BoxDecoration(
                color: const Color.fromRGBO(240, 255, 245, 1),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Center(child: SvgPicture.asset("assets/images/Filled.svg")),
            ),
            SizedBox(height: 1.h,),
            Text("Caller ID", style: TextStyle(fontSize: 17.sp),),
            SizedBox(height: 2.h,),
            ProgressBarAnimation(
              height: 0.5.h,
              duration: const Duration(seconds: 2),
              gradient: const LinearGradient(
                colors: [
                  Color.fromRGBO(240, 255, 245, 1),
                  Color.fromRGBO(240, 255, 245, 1),
                  Color.fromRGBO(19, 242, 160, 1),
                  Color.fromRGBO(19, 242, 160, 1),
                ],
              ),
              backgroundColor: Colors.transparent
            )
          ],
        ),
      ),
    );
  }
}
