import 'package:flutter/material.dart';
import 'package:pharmix/widgets/custom_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      appBar: CustomAppBar(title: 'Profile'),
    );
  }
}
