import 'package:flutter/material.dart';

class Recommend extends StatefulWidget {
  const Recommend({super.key});

  @override
  State<Recommend> createState() {
    return _Recommend();
  }
}

class _Recommend extends State<Recommend> {
  @override
  Widget build(BuildContext context) {
    return const Card(
      child: ExpansionTile(
        title: Text('Recommended'),
        
      ),
    );
  }
}
