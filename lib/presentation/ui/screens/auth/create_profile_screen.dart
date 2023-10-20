import 'package:craftybay_ecommerce_application/presentation/state_holders/auth/create_profile_screen_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/craftyBay_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateProfileScreen extends StatelessWidget {
  CreateProfileScreen({super.key});

  final TextEditingController _cusNameTEController = TextEditingController();
  final TextEditingController _cusAddTEController = TextEditingController();
  final TextEditingController _cusCityTEController = TextEditingController();
  final TextEditingController _cusStateTEController = TextEditingController();
  final TextEditingController _cusPostcodeTEController =
      TextEditingController();
  final TextEditingController _cusCountryTEController = TextEditingController();
  final TextEditingController _cusMobileTEController = TextEditingController();
  final TextEditingController _cusFaxTEController = TextEditingController();
  final TextEditingController _shipNameTEController = TextEditingController();
  final TextEditingController _shipAddTEController = TextEditingController();
  final TextEditingController _shipCityTEController = TextEditingController();
  final TextEditingController _shipStateTEController = TextEditingController();
  final TextEditingController _shipPostcodeTEController =
      TextEditingController();
  final TextEditingController _shipCountryTEController =
      TextEditingController();
  final TextEditingController _shipMobileTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Center(
                    child: CraftyBayLogo(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Complete Profile',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 24,
                        ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text('Get started with us by share your details',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.grey)),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    'User Details',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 20,
                        ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: _cusNameTEController,
                    decoration: const InputDecoration(
                      hintText: 'John Doe',
                      labelText: 'Full Name',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your full name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    maxLines: 5,
                    keyboardType: TextInputType.text,
                    controller: _cusAddTEController,
                    decoration: const InputDecoration(
                      hintText: '237 Delia Ports',
                      labelText: 'Your Address',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _cusCityTEController,
                    decoration: const InputDecoration(
                      hintText: 'Mireyamouth',
                      labelText: 'City',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your city name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _cusStateTEController,
                    decoration: const InputDecoration(
                      hintText: 'Texas',
                      labelText: 'State',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your state name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _cusPostcodeTEController,
                    decoration: const InputDecoration(
                      hintText: '55064-6682',
                      labelText: 'Postcode',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your postcode';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _cusCountryTEController,
                    decoration: const InputDecoration(
                      hintText: 'USA',
                      labelText: 'Country',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your country name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: _cusMobileTEController,
                    decoration: const InputDecoration(
                      hintText: '01**********',
                      labelText: 'Mobile',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your mobile number';
                      } else {
                        if (text!.length < 11) {
                          return 'Mobile should be at least 11 digit';
                        }
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: _cusFaxTEController,
                    decoration: const InputDecoration(
                      hintText: '356******',
                      labelText: 'Fax',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your fax number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Shipping Details',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 20,
                        ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: _shipNameTEController,
                    decoration: const InputDecoration(
                      hintText: 'John Doe',
                      labelText: 'Shipping Person Name',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter shipping person full name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    maxLines: 5,
                    keyboardType: TextInputType.text,
                    controller: _shipAddTEController,
                    decoration: const InputDecoration(
                      hintText: '237 Delia Ports',
                      labelText: 'Shipping Address',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _shipCityTEController,
                    decoration: const InputDecoration(
                      hintText: 'Mireyamouth',
                      labelText: 'Shipping City',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter shipping city name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _shipStateTEController,
                    decoration: const InputDecoration(
                      hintText: 'Texas',
                      labelText: 'Shipping State',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter shipping state name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _shipPostcodeTEController,
                    decoration: const InputDecoration(
                      hintText: '55064-6682',
                      labelText: 'Shipping Postcode',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter shipping postcode';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _shipCountryTEController,
                    decoration: const InputDecoration(
                      hintText: 'USA',
                      labelText: 'Shipping Country',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter shipping country name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: _shipMobileTEController,
                    decoration: const InputDecoration(
                      hintText: '01**********',
                      labelText: 'Shipping Mobile',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter shipping mobile number';
                      } else {
                        if (text!.length < 11) {
                          return 'Mobile should be at least 11 digit';
                        }
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: GetBuilder<CreateProfileScreenController>(
                        builder: (createProfileScreenController) {
                      if (createProfileScreenController
                          .completeProfileInProgress) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            createProfileScreenController
                                .createProfile(
                              _cusNameTEController.text.trim(),
                              _cusAddTEController.text.trim(),
                              _cusCityTEController.text.trim(),
                              _cusStateTEController.text.trim(),
                              _cusPostcodeTEController.text.trim(),
                              _cusCountryTEController.text.trim(),
                              _cusMobileTEController.text.trim(),
                              _cusFaxTEController.text.trim(),
                              _shipNameTEController.text.trim(),
                              _shipAddTEController.text.trim(),
                              _shipCityTEController.text.trim(),
                              _shipStateTEController.text.trim(),
                              _shipPostcodeTEController.text.trim(),
                              _shipCountryTEController.text.trim(),
                              _shipMobileTEController.text.trim(),
                            )
                                .then((result) {
                              if (result) {
                                Get.snackbar(
                                    'Success', 'Profile create successful.',
                                    backgroundColor: Colors.green,
                                    colorText: Colors.white,
                                    borderRadius: 10,
                                    snackPosition: SnackPosition.BOTTOM);
                                Get.offAll(() => const MainBottomNavScreen());
                              } else {
                                Get.snackbar('Failed',
                                    'Profile create failed! Try again.',
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,
                                    borderRadius: 10,
                                    snackPosition: SnackPosition.BOTTOM);
                              }
                            });
                          }
                        },
                        child: const Text('Complete'),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
