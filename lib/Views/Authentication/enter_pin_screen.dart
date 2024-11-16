import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:testproject/Controllers/enter_Pin_Controller.dart';
import 'package:testproject/Views/Home/home_screen.dart';

class EnterPinScreen extends StatefulWidget {
  const EnterPinScreen({super.key});

  @override
  State<EnterPinScreen> createState() => _EnterPinScreenState();
}

class _EnterPinScreenState extends State<EnterPinScreen> {

  void showFingerprintModal() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20), // Rounded top corners
        ),
      ),
      builder: (context) {
        return Container(
          width: 100.w,
          height: MediaQuery.of(context).size.height * 0.35, // 40% of screen height
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20), // Rounded top corners
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Authenticate with Fingerprint",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 36),
              SvgPicture.asset("assets/images/bimetricImage.svg",
                  width: 15.w, height: 10.h),
              const SizedBox(height: 14),
              Text(
                "Place your finger on fingerprint to continue",
                style: TextStyle(fontSize: 14.sp),
              ),
              SizedBox(height: 5.h),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        );
      },
    );
  }


  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showFingerprintModal();// Show modal bottom sheet automatically
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Authentication'),
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: (){
            Get.off(() => const HomeScreen());
          },
            child: const Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: const GradientBoxBorder(
                    width: 2,
                    gradient: LinearGradient(colors: [Colors.blue, Colors.red]),
                  )),
              child: Container(
                height: 110,
                width: 110,
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset("assets/images/profileImage.png"),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Syed Sabih Ahmed',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            const Text(
              '03453311212',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (index) => _buildPinBox(index)),
            ),
            const SizedBox(height: 26),
            Container(
              height: 50,
              width: 1000,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                    colors: [Color.fromRGBO(0, 133, 255, 1), Color.fromRGBO(0, 52, 101, 1)]),
              ),
              child: const Center(
                child: Text(
                  'Enter Pin',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Expanded(child: _buildNumberPad()),
          ],
        ),
      ),
    );
  }

  Widget _buildPinBox(int index) {
    return Obx((){
      return Container(
        // margin: const EdgeInsets.symmetric(horizontal: 16),
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            Get.find<EnterPinController>().pin[index],
            style: const TextStyle(fontSize: 24),
          ),
        ),
      );
    });
  }

  Widget _buildNumberPad() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNumberButton('1'),
            _buildNumberButton('2'),
            _buildNumberButton('3'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNumberButton('4'),
            _buildNumberButton('5'),
            _buildNumberButton('6'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNumberButton('7'),
            _buildNumberButton('8'),
            _buildNumberButton('9'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.backspace),
              onPressed: Get.find<EnterPinController>().onBackspacePressed,
              iconSize: 45,
            ),
            _buildNumberButton('0'),
            IconButton(
              icon: const Icon(Icons.fingerprint),
              onPressed: () {
                showFingerprintModal();
              },
              iconSize: 45,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNumberButton(String number) {
    return ElevatedButton(
      onPressed: () => Get.find<EnterPinController>().onNumberButtonPressed(number),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20),
      ),
      child: Text(
        number,
        style: const TextStyle(fontSize: 30),
      ),
    );
  }
}
