import 'package:craftybay_ecommerce_application/presentation/state_holders/auth/create_profile_screen_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/auth/read_profile_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/craftyBay_logo.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController _fNameTEController = TextEditingController();

  final TextEditingController _lNameTEController = TextEditingController();

  final TextEditingController _mobileTEController = TextEditingController();

  final TextEditingController _cityTEController = TextEditingController();

  final TextEditingController _shippingAddressTEController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ReadProfileController readProfileController =
      Get.put(ReadProfileController());

  @override
  void initState() {
    if (readProfileController.readProfileModel.data != null &&
        readProfileController.readProfileModel.data!.isNotEmpty) {
      _fNameTEController.text =
          readProfileController.readProfileModel.data!.first.firstName ?? '';
      _lNameTEController.text =
          readProfileController.readProfileModel.data!.first.lastName ?? '';
      _mobileTEController.text =
          readProfileController.readProfileModel.data!.first.mobile ?? '';
      _cityTEController.text =
          readProfileController.readProfileModel.data!.first.city ?? '';
      _shippingAddressTEController.text =
          readProfileController.readProfileModel.data!.first.shippingAddress ??
              '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(
          title: 'Update Profile',
          elevation: 1,
        ),
      ),
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
                    'Update Profile',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 24,
                        ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                      'Update your profile & please write your current information.',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.grey)),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    controller: _fNameTEController,
                    decoration: const InputDecoration(
                      hintText: 'First Name',
                      labelText: 'First Name',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your first name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _lNameTEController,
                    decoration: const InputDecoration(
                      hintText: 'Last Name',
                      labelText: 'Last Name',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your last name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _mobileTEController,
                    decoration: const InputDecoration(
                      hintText: 'Mobile',
                      labelText: 'Mobile',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your mobile number';
                      } else {
                        if (text!.length < 11) {
                          return 'Mobile should be 11 digit';
                        }
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _cityTEController,
                    decoration: const InputDecoration(
                      hintText: 'City',
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
                    controller: _shippingAddressTEController,
                    maxLines: 6,
                    decoration: const InputDecoration(
                      hintText: 'Shipping Address',
                      labelText: 'Shipping Address',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your shipping address';
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
                                    _fNameTEController.text.trim(),
                                    _lNameTEController.text.trim(),
                                    _mobileTEController.text.trim(),
                                    _cityTEController.text.trim(),
                                    _shippingAddressTEController.text.trim())
                                .then((result) {
                              if (result) {
                                Get.snackbar(
                                    'Success', 'Profile Update successful.',
                                    backgroundColor: Colors.green,
                                    colorText: Colors.white,
                                    borderRadius: 10,
                                    snackPosition: SnackPosition.BOTTOM);
                                Get.offAll(() => const MainBottomNavScreen());
                              } else {
                                Get.snackbar('Failed',
                                    'Profile Update failed! Try again.',
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,
                                    borderRadius: 10,
                                    snackPosition: SnackPosition.BOTTOM);
                              }
                            });
                          }
                        },
                        child: const Text('Update'),
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
