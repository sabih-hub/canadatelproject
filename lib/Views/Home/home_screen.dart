import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:testproject/Controllers/home_screen_controller.dart';
import 'package:testproject/Views/Profile/edirProfileScreen.dart';

import '../Authentication/temp_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Good Morning,",
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                        Text(
                          "Jane",
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                      ],
                    )
                  ),
                  Expanded(
                    flex: 3,
                      child: InkWell(
                        onTap: (){Get.to(() => const EditProfileScreen());},
                          child: Image.asset("assets/images/profileIcon.png", width: 10.w, height: 8.h,)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: ListView(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 4.w),
                      child: SizedBox(
                        height: 12.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: Get.find<HomeController>().stories.length,
                          itemBuilder: (context, index) {
                            final story = Get.find<HomeController>().stories[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: index == 0
                                                ? Colors.transparent // No border for "Your Story"
                                                : Colors.blue, // Story border color
                                            width: 2,
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage(story["image"]!),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      if (index == 0) // Add icon only for "Your Story"
                                        Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              color: Colors.blue,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.white, // Outline for the add icon
                                                width: 2,
                                              ),
                                            ),
                                            child: const Icon(
                                              Icons.add,
                                              size: 15,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    story["name"]!,
                                    style: TextStyle(fontSize: 12),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(33, 150, 243, 1), // Blue background color
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.all(16),
                          child:  Column(
                            children: [
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // Doctor's profile image
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage('assets/images/doctor.png'), // Replace with your image path
                                  ),
                                  SizedBox(width: 16),
                                  // Doctor's info
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Dr. a Syahir',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          'General Doctor',
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Arrow icon
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                                child: const Divider(
                                  color: Color.fromRGBO(255, 255, 255, 0.25),
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(left: 2.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset("assets/images/calendar.svg"),
                                        SizedBox(width: 1.5.w),
                                        Text("Sunday, 12 June", style: TextStyle(color: Colors.white, fontSize: 12.sp),)
                                      ],
                                    ),
                                    SizedBox(width:12.w),
                                    Row(children: [
                                      SvgPicture.asset("assets/images/clock.svg"),
                                      SizedBox(width: 1.5.w,),
                                      Text("11:00 - 12:00 AM", style: TextStyle(color: Colors.white, fontSize: 12.sp),)
                                    ],)
                                  ],
                                ),
                              )
                            ],

                          )
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 5.w, top: 2.h, bottom: 1.h ),
                      child: Text("Category", style: TextStyle( fontSize: 16.sp, fontWeight: FontWeight.w700
                      ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 1.h),
                      child: SizedBox(
                        height: 10.h,
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, // 3 containers per row
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 3.2, // Adjust aspect ratio to fit the design
                          ),
                          itemCount:Get.find<HomeController>().items.length,
                          itemBuilder: (context, index) {
                            final item = Get.find<HomeController>().items[index];
                            final innerColor = Color(int.parse(item["color"]!));
                            final backgroundColor = Get.find<HomeController>().lightenColor(innerColor, 0.85);

                            return Container(
                              decoration: BoxDecoration(
                                color: backgroundColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              padding: const EdgeInsets.all(7.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // Small circular container
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: innerColor,
                                    ),
                                  ),
                                  SizedBox(width: 2.w),
                                  Text(
                                    item["text"]!,
                                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.w, top: 2.h, bottom: 1.h),
                      child: Text(
                        "Frequently Used",
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 3.w),
                      child: SizedBox(
                        height: 14.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: Get.find<HomeController>().frequentlyUsedItems.length,
                          itemBuilder: (context, index) {
                            final item = Get.find<HomeController>().frequentlyUsedItems[index];
                            final mainColor = Color(int.parse(item["color"]!));
                            final backgroundColor  = Get.find<HomeController>().lightenColor(mainColor, 0.85);

                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      Get.to(()=> const TempScreen());
                                    },
                                    child: Container(
                                      width: 70,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        color: backgroundColor,
                                        borderRadius: const BorderRadius.all(Radius.circular(10))
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: ColorFiltered(
                                          colorFilter: ColorFilter.mode(
                                            mainColor.withOpacity(0.9), // Apply color tint
                                            BlendMode.srcATop,
                                          ),
                                          child: SvgPicture.asset(
                                            item["image"]!,
                                            width: 5.w,
                                            height: 2.h,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    item["text"]!.replaceAll(" ", "\n"), // Replace spaces with new lines
                                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center, // Center-align the text if desired
                                    overflow: TextOverflow.clip,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.w, top: 2.h, bottom: 1.h),
                      child: Text(
                        "Financial Services",
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 3.w),
                      child: SizedBox(
                        height: 12.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: Get.find<HomeController>().financialServicesItem.length,
                          itemBuilder: (context, index) {
                            final item = Get.find<HomeController>().financialServicesItem[index];
                            final mainColor = Color(int.parse(item["color"]!));
                            final backgroundColor = Get.find<HomeController>().lightenColor(mainColor, 0.85);

                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        color: backgroundColor,
                                        borderRadius: const BorderRadius.all(Radius.circular(10))
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: ColorFiltered(
                                        colorFilter: ColorFilter.mode(
                                          mainColor.withOpacity(0.9), // Apply color tint
                                          BlendMode.srcATop,
                                        ),
                                        child: SvgPicture.asset(
                                          item["image"]!,
                                          width: 5.w,
                                          height: 2.h,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    item["text"]!.replaceAll(" ", "\n"), // Replace spaces with new lines
                                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center, // Center-align the text if desired
                                    overflow: TextOverflow.clip,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
