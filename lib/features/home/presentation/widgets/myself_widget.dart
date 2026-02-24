import 'package:flutter/material.dart';

class MyselfWidget extends StatelessWidget {
  const MyselfWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .start,
      crossAxisAlignment: .start,
      children: [
        /* CircleAvatar(
          radius: 102,
          backgroundColor: primaryColor.withValues(alpha: 0.3),
          child: CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage(AppImages.me),
          ),
        ),*/
      ],
    );
  }
}
