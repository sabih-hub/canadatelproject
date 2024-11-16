import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'Bindings/all_bindings.dart';
import 'Views/Login/login_screen.dart';


void main() async{
  // await Future.delayed(const Duration( milliseconds: 1000));
  WidgetsFlutterBinding.ensureInitialized();

  // await PushNotificationService().setupInteractedMessage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, screenType) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            initialBinding: AllBindings(),
            home: const LoginScreen(),
          );
        }
    );
  }
}