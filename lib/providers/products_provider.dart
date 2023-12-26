import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharmix/data/data_query.dart';

final productsProvider = Provider((ref) async {
  return await getAllProducts();
});
