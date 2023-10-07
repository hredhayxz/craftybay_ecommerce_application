import 'package:craftybay_ecommerce_application/presentation/ui/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class CreateReviewScreen extends StatelessWidget {
  const CreateReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(title: 'Create Review', elevation: 1),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 20,),
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
                  maxLines: 10,
                  decoration: const InputDecoration(
                    hintText: 'Write Review',
                    labelText: 'Write Review',
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
                    child: const Text('Submit'),
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
