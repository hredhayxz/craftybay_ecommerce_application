import 'package:craftybay_ecommerce_application/presentation/state_holders/auth/read_profile_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/screens/auth/create_profile_screen.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReadProfileScreen extends StatefulWidget {
  const ReadProfileScreen({super.key});

  @override
  State<ReadProfileScreen> createState() => _ReadProfileScreenState();
}

class _ReadProfileScreenState extends State<ReadProfileScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(seconds: 3)).then((value) async =>
          await Get.find<ReadProfileController>().readProfileData());

      Get.find<ReadProfileController>().readProfileModel.data!.isNotEmpty
          ? Get.offAll(() => const MainBottomNavScreen())
          : Get.offAll(() => CreateProfileScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
