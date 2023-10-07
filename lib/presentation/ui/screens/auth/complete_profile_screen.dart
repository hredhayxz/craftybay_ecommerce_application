import 'package:craftybay_ecommerce_application/presentation/ui/widgets/craftyBay_logo.dart';
import 'package:flutter/material.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
                  height: 24,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'First Name',
                    labelText: 'First Name',
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Last Name',
                    labelText: 'Last Name',
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Mobile',
                    labelText: 'Mobile',
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'City',
                    labelText: 'City',
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  maxLines: 6,
                  decoration: const InputDecoration(
                    hintText: 'Shipping Address',
                    labelText: 'Shipping Address',
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Complete'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
