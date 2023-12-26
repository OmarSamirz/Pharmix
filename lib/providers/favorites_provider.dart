import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharmix/data/data_query.dart';
import 'package:pharmix/models/product.dart';

class FavoritesNotifier extends StateNotifier<List<Product>> {
  FavoritesNotifier(super.state);

  void createFavoriteList(int userID) async {
    final favoriteProducts = await getAllFavorites(userID);
    state = [...favoriteProducts];
  }

  Future<bool> toggleFavoriteStatus(Product product, int userID) async {
    final productsFavorite = state.contains(product);
    if (productsFavorite) {
      state = state.where((p) => p.id != product.id).toList();

      final db = createDatabase();
      db.query(
        '''
          delete from Favorite
          where Favorite.user_id = :userID
          and Favorite.product_id = :product_id
      ''',
        values: {'userID': userID, 'product_id': product.id},
      );
      return false;
    } else {
      state = [...state, product];

      final db = createDatabase();
      db.query(
        '''
          insert into Favorite
          values(:userID, :product_id)
      ''',
        values: {'userID': userID, 'product_id': product.id},
      );
      return true;
    }
  }
}
