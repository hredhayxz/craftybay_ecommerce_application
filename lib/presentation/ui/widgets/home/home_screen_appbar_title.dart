import 'package:craftybay_ecommerce_application/presentation/state_holders/auth/auth_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/auth/read_profile_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/theme_manager_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/screens/auth/update_profile_screen.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/utility/assets_path.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/circular_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeScreenAppbarTitle extends StatefulWidget {
  const HomeScreenAppbarTitle({super.key});

  @override
  State<HomeScreenAppbarTitle> createState() => _HomeScreenAppbarTitleState();
}

class _HomeScreenAppbarTitleState extends State<HomeScreenAppbarTitle> {
  ThemeMode? currentThemeMode;

  @override
  void initState() {
    super.initState();
    _loadThemeMode();
  }

  Future<void> _loadThemeMode() async {
    final ThemeMode themeMode = await ThemeManager.getThemeMode();
    setState(() {
      currentThemeMode = themeMode;
    });
  }

  void _toggleTheme() async {
    if (currentThemeMode == ThemeMode.light) {
      currentThemeMode = ThemeMode.dark;
      Get.changeThemeMode(ThemeMode.dark);
    } else {
      currentThemeMode = ThemeMode.light;
      Get.changeThemeMode(ThemeMode.light);
    }
    await ThemeManager.setThemeMode(currentThemeMode!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AssetsPath.craftyBayNavLogoSVG,
        ),
        const Spacer(),
        CircularIconButton(
          icon: Icons.person,
          onTap: () async {
            await Get.find<ReadProfileController>().readProfileData();
            Get.to(() => const UpdateProfileScreen());
          },
        ),
        const SizedBox(
          width: 8,
        ),
        CircularIconButton(
          icon: Icons.call,
          onTap: () {
            launchUrlString("tel://${008801861883575}");
          },
        ),
        const SizedBox(
          width: 8,
        ),
        CircularIconButton(
          icon: Icons.notifications_none,
          onTap: () {},
        ),
        const SizedBox(
          width: 8,
        ),
        CircularIconButton(
          icon: currentThemeMode == ThemeMode.light
              ? Icons.sunny
              : Icons.nightlight,
          onTap: _toggleTheme,
        ),
        const SizedBox(
          width: 12,
        ),
        CircularIconButton(
          icon: Icons.logout,
          onTap: () async {
            await AuthController.clear();
            await AuthController.getAccessToken();
            Get.snackbar('Success', 'Logout successful.',
                backgroundColor: Colors.green,
                colorText: Colors.white,
                borderRadius: 10,
                snackPosition: SnackPosition.BOTTOM);
          },
        ),
      ],
    );
  }
}
