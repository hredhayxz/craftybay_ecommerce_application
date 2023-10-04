import 'dart:developer';

import 'package:craftybay_ecommerce_application/data/models/network_response.dart';
import 'package:craftybay_ecommerce_application/data/models/product_details_model.dart';
import 'package:craftybay_ecommerce_application/data/services/network_caller.dart';
import 'package:craftybay_ecommerce_application/data/utility/urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreenController extends GetxController {
  bool _getProductDetailsInProgress = false;
  ProductDetailsData _productDetailsData = ProductDetailsData();
  String _errorMessage = '';
  final List<String> _colorCodes = [];
  final List<Color> _colors = [];
  List<String> _availableSizes = [];

  bool get getProductDetailsInProgress => _getProductDetailsInProgress;

  ProductDetailsData get productDetailsData => _productDetailsData;

  String get errorMessage => _errorMessage;

  List<Color> get availableColors => _colors;

  List<String> get availableSizes => _availableSizes;

  void updateAllState() {
    update();
  }

  Future<bool> getProductDetails(int id) async {
    _getProductDetailsInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.getProductDetails(id));
    _getProductDetailsInProgress = false;
    if (response.isSuccess) {
      _productDetailsData =
          (ProductDetailsModel.fromJson(response.responseJson ?? {}))
              .data!
              .first;
      _colorCodes.clear();
      _colors.clear();
      _storeColorCodes(_productDetailsData.color ?? '');
      _convertColorCode();
      _convertStringToSizes(_productDetailsData.size ?? '');
      log(_colors.toString());
      update();
      return true;
    } else {
      _errorMessage = 'Fetch product details has been failed! Try again.';
      update();
      return false;
    }
  }

  void _storeColorCodes(String color) {
    final List<String> splittedColors = color.split(',');
    for (String c in splittedColors) {
      if (c.isNotEmpty) {
        _colorCodes.add(c);
      }
    }
  }

  void _convertColorCode() {
    for (var code in _colorCodes) {
      final color = Color(int.parse(code.replaceAll('#', '0xFF')));
      _colors.add(color);
    }
  }

  void _convertStringToSizes(String sizes) {
    _availableSizes = sizes.split(',');
  }
}
