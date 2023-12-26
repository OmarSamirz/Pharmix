
import 'package:flutter/material.dart';
import 'package:pharmix/Utilities/image_path.dart';
import 'package:pharmix/widgets/custom_cart_button.dart';

class PlusMinus extends StatelessWidget{
  const PlusMinus({super.key});
  

  @override
  Widget build(BuildContext context) {
    return  const Row(
      children: [
        CartButton(icon: minusIcon),
        Text('1'),
        CartButton(icon: plusIcon),
      ],
      
    );
  }
}