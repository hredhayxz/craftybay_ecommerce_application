import 'package:craftybay_ecommerce_application/data/models/payment/paymentMethod.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/payment/create_invoice_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/screens/payment/payment_webview_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectPaymentMethodScreen extends StatefulWidget {
  const SelectPaymentMethodScreen({super.key});

  @override
  State<SelectPaymentMethodScreen> createState() =>
      _SelectPaymentMethodScreenState();
}

class _SelectPaymentMethodScreenState extends State<SelectPaymentMethodScreen> {
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<CreateInvoiceController>().createInvoice().then((value) {
        isCompleted = value;
        if (mounted) {
          setState(() {});
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Choose Payment Method'),
        ),
        body: GetBuilder<CreateInvoiceController>(builder: (controller) {
          if (controller.inProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!isCompleted) {
            return const Center(
              child: Text('Please complete your profile first'),
            );
          }
          return ListView.separated(
            itemCount:
                controller.invoiceCreateResponseModel?.paymentMethod?.length ??
                    0,
            itemBuilder: (context, index) {
              final PaymentMethod paymentMethod =
                  controller.invoiceCreateResponseModel!.paymentMethod![index];
              return ListTile(
                leading: Image.network(
                  paymentMethod.logo ?? '',
                  width: 60,
                ),
                title: Text(paymentMethod.name ?? ''),
                onTap: () {
                  Get.off(() => PaymentWebViewScreen(
                      paymentUrl: paymentMethod.redirectGatewayURL!));
                },
              );
            },
            separatorBuilder: (_, __) => const Divider(),
          );
        }));
  }
}
