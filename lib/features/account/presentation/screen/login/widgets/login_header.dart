import 'package:flutter/material.dart';
import 'package:jewish_app/core/constants/judaism_assets.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background block
        Container(
          width: double.infinity,
          height: 337,
          color: Colors.transparent,
        ),
        // Single wave image decoration
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Image.asset(
            JudaismAssets.branding.loginTopWave,
            height: 357,
            width: 357,
            fit: BoxFit.cover,
            errorBuilder: (context, _, __) => const SizedBox.shrink(),
          ),
        ),

        // Center logo
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 101.0),
            child: Image.asset(
              JudaismAssets.branding.logo,
              width: 260,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
