import 'package:craftybay_ecommerce_application/presentation/ui/utility/assets_path.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/circular_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreenAppbarTitle extends StatelessWidget {
  const HomeScreenAppbarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AssetsPath.craftyBayNavLogoSVG,
        ),
        const Spacer(),
        CircularIconButton(
          icon: Icons.person,
          onTap: () {},
        ),
        const SizedBox(
          width: 8,
        ),
        CircularIconButton(
          icon: Icons.call,
          onTap: () {},
        ),
        const SizedBox(
          width: 8,
        ),
        CircularIconButton(
          icon: Icons.notifications_none,
          onTap: () {},
        ),
      ],
    );
  }
}
