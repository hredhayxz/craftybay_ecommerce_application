import 'package:craftybay_ecommerce_application/presentation/state_holders/auth/email_verification_screen_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/screens/auth/otp_verification_screen.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/craftyBay_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatelessWidget {
  EmailVerificationScreen({Key? key}) : super(key: key);

  final TextEditingController _emailTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                const Center(
                  child: CraftyBayLogo(),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Welcome back',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 24,
                      ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text('Please enter your email address',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.grey)),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: _emailTEController,
                  decoration: const InputDecoration(
                      hintText: 'Email', labelText: 'Email'),
                  validator: (String? text) {
                    if (text?.isEmpty ?? true) {
                      return 'Enter your email address';
                    } else if (text!.isEmail == false) {
                      /// REGEX (Email validator)
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: GetBuilder<EmailVerificationScreenController>(
                      builder: (controller) {
                    if (controller.emailVerificationInProgress) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          verifyEmail(controller);
                        }
                      },
                      child: const Text('Next'),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> verifyEmail(EmailVerificationScreenController controller) async {
    final response =
        await controller.verifyEmail(_emailTEController.text.trim());
    if (response) {
      Get.to(() => const OTPVerificationScreen());
    } else {
      Get.snackbar(
        'Failed',
        'Email verification failed! Try again',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        borderRadius: 10,
      );
    }
  }
}
