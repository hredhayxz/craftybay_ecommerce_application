import 'package:craftybay_ecommerce_application/presentation/ui/screens/auth/otp_verification_screen.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/craftyBay_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                'Welcome Back',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 24,
                    ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text('Please Enter Your Email Address',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.grey)),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email'
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(const OTPVerificationScreen());
                  },
                  child: const Text('Next'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
