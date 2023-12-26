import 'package:flutter/material.dart';
import 'package:pharmix/Utilities/colors.dart';
import 'package:pharmix/Utilities/size_helpers.dart';
import 'package:pharmix/data/cart_list.dart';
import 'package:pharmix/data/product_list.dart';
// import 'package:pharmix/Utilities/size_helpers.dart';
import 'package:pharmix/models/product.dart';
import 'package:pharmix/widgets/cart_item_for_list.dart';

// class CartItem extends StatelessWidget {
//   const CartItem({
//     super.key,
//     required this.product,
//   });

//   final Product product;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         padding: const EdgeInsets.all(10),
//         width: screenWidthSize(context) * 0.9,
//         height: screenHeightSize(context) * 0.2,
//         decoration: ShapeDecoration(
//           color: Colors.white,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           shadows: const [
//             BoxShadow(
//               color: Color(0x3F8FBDFD),
//               blurRadius: 7,
//               offset: Offset(0, 4),
//               spreadRadius: 4,
//             )
//           ],
//         ),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Image.asset(
//                   product.image,
//                   width: screenWidthSize(context) * 0.26,
//                   height: screenHeightSize(context) * 0.14,
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           productCategory,
//                           style: TextStyle(
//                               color: fifthTextColor,
//                               fontSize: 13,
//                               fontWeight: FontWeight.w400),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         Text(
//                           productName,
//                           style: TextStyle(
//                             color: primaryTextColor,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         Text(
//                           productDescription,
//                           style: TextStyle(
//                             color: secondaryTextColor,
//                             fontSize: 15,
//                             fontWeight: FontWeight.w500,
//                           ),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             Container(
//               height: screenHeightSize(context) * 0.03,
//               decoration: const ShapeDecoration(
//                 color: Colors.green,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(10),
//                     bottomRight: Radius.circular(10),
//                   ),
//                 ),
//                 shadows: [
//                   BoxShadow(
//                     color: Color(0x3F8FBDFD),
//                     blurRadius: 8,
//                     offset: Offset(0, -4),
//                     spreadRadius: 4,
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class CartListView extends StatelessWidget {
  const CartListView({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      //actual full container
      width: screenWidthSize(context) * 0.9,
      height: screenHeightSize(context) * 0.20,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),

        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x3F8FBDFD),
            blurRadius: 8,
            offset: Offset(0, 4),
            spreadRadius: 4,
          )
        ],
      ),
      //top part of the container
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: screenHeightSize(context) * 0.05,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3F8FBDFD),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                      spreadRadius: 4,
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (ctx, index) => CartItem(
                    product: productList[index],
                  ),
                  itemCount: cartList.length,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 9),
            child: Text(
              'Cart Items',
              style: TextStyle(
                color: cartColor,
                fontSize: 20,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}
