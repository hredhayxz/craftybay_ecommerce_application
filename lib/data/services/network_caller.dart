import 'dart:developer';
import 'dart:convert';
import 'package:craftybay_ecommerce_application/application/app.dart';
import 'package:craftybay_ecommerce_application/data/models/network_response.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/auth/auth_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/screens/auth/email_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class NetworkCaller {
  /// get request method
  Future<NetworkResponse> getRequest(String url, {bool isLogin = false}) async {
    try {
      Response response = await get(Uri.parse(url),
          headers: {'token': AuthController.accessToken.toString()});
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200) {
        return NetworkResponse(
            true, response.statusCode, jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        if (isLogin) {
          gotoLogin();
        }
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }

  /// post request method
  Future<NetworkResponse> postRequest(String url, Map<String, dynamic> body,
      {bool isLogin = false}) async {
    try {
      Response response = await post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'token': AuthController.accessToken.toString()
        },
        body: jsonEncode(body),
      );
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200) {
        return NetworkResponse(
          true,
          response.statusCode,
          jsonDecode(response.body),
        );
      } else if (response.statusCode == 401) {
        if (isLogin == false) {
          gotoLogin();
        }
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }

  Future<void> gotoLogin() async {
    await AuthController.clear();
    Navigator.pushAndRemoveUntil(
        CraftyBay.globalKey.currentContext!,
        MaterialPageRoute(builder: (context) => EmailVerificationScreen()),
        (route) => false);
  }
}
