import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:craftybay_ecommerce_application/application/state_holder_binder.dart';
import 'package:craftybay_ecommerce_application/application/utility/app_colors.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/theme_manager_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatefulWidget {
  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

  const CraftyBay({Key? key}) : super(key: key);

  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {
  late final StreamSubscription _connectivityStatusStream;
  ThemeMode _themeMode = ThemeMode.system;

  @override
  void initState() {
    checkInitialInternetConnection();
    checkInternetConnectivityStatus();
    ThemeManager.getThemeMode().then((themeMode) {
      if (themeMode == ThemeMode.system) {
        ThemeManager.setThemeMode(ThemeMode.light);
      }
      _themeMode = themeMode;
    });
    super.initState();
  }

  void checkInitialInternetConnection() async {
    final result = await Connectivity().checkConnectivity();
    handleConnectivityStates(result);
  }

  void checkInternetConnectivityStatus() {
    _connectivityStatusStream =
        Connectivity().onConnectivityChanged.listen((status) {
      handleConnectivityStates(status);
    });
  }

  void handleConnectivityStates(ConnectivityResult status) {
    if (status != ConnectivityResult.mobile &&
        status != ConnectivityResult.wifi) {
      Get.defaultDialog(
        title: "No Internet",
        middleText: "Please check your internet connection.",
        barrierDismissible: false,
        titleStyle: const TextStyle(color: Colors.red),
      );
    } else {
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: CraftyBay.globalKey,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      initialBinding: StateHolderBinder(),
      themeMode: _themeMode,
      theme: ThemeData(
          primarySwatch:
              MaterialColor(AppColors.primaryColor.value, AppColors().color),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              textStyle: const TextStyle(
                  fontSize: 16,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w600),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          )),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch:
              MaterialColor(AppColors.primaryColor.value, AppColors().color),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              textStyle: const TextStyle(
                  fontSize: 16,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w600),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          )),
    );
  }
}
