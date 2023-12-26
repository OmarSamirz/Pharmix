import 'package:mysql_utils/mysql_utils.dart';
import 'package:pharmix/models/product.dart';

MysqlUtils createDatabase() {
  final db = MysqlUtils(
    settings: {
      'host': 'pharmix-demo.cuwpxjvz89qz.eu-north-1.rds.amazonaws.com',
      'port': 3306,
      'user': 'admin',
      'password': 'pharmix_sql_123',
      'db': 'pharmix_db',
      // 'maxConnections': 10,
      'secure': false,
      'prefix': 'su_',
      'pool': false,
      'collation': 'utf8mb4_general_ci',
    },
  );

  return db;
}

Future<bool> findEmail(String email) async {
  final db = createDatabase();
  final result = await db.query(
    'select email from User where User.email = :email',
    values: {'email': email},
  );

  await db.close();
  return result.rows.isEmpty ? false : true;
}

Future<(bool, ResultFormat)> findPassword(String email, String password) async {
  final db = createDatabase();
  final result = await db.query(
    '''
       select *
       from User 
       where User.email = :email
       and User.password = :password
      ''',
    values: {
      'email': email,
      'password': password,
    },
  );

  await db.close();
  return (result.rows.isEmpty ? false : true, result);
}

Future<(bool, int)> createAccount(
    String fname, String lname, String email, String password) async {
  final db = createDatabase();
  final result = await db.query('''
       insert into User(first_name, last_name, email, password) 
       values(:fname, :lname, :email, :password)
    ''', values: {
    'fname': fname,
    'lname': lname,
    'email': email,
    'password': password
  });

  if (result.affectedRows > 0) {
    await db.commit();
    await db.close();
    return (true, result.lastInsertID);
  }

  await db.close();
  return (false, -1);
}

Future<List<Product>> getAllProducts() async {
  final db = createDatabase();
  final result = await db.query('''
      select product_id, image_url, name, price, company_name, category_name, amount, is_prescription, description
      from Product, Category
      where Product.category_id = Category.category_id
  ''');

  final List<Product> productsList = [];
  for (final product in result.rows) {
    productsList.add(
      Product(
          id: product['product_id'],
          image: product['image_url'],
          name: product['name'],
          price: product['price'] - 0.01,
          companyName: product['company_name'],
          category: product['category_name'],
          amount: product['amount'],
          isPrescription: false,
          isDiscount: false,
          description: product['description']),
    );
  }

  return productsList;
}

Future<List<Product>> getAllFavorites(int userID) async {
  final db = createDatabase();
  final result = await db.query(
    '''
      select product_id, image_url, name, price, company_name, category_name, amount, is_prescription, description
      from Product, Favorite
      where Product.product_id = Favorite.product_id
      and Favorite.user_id = :userID
  ''',
    values: {'userID': userID},
  );

  final List<Product> productsList = [];
  for (final product in result.rows) {
    productsList.add(
      Product(
          id: product['product_id'],
          image: product['image_url'],
          name: product['name'],
          price: product['price'] - 0.01,
          companyName: product['company_name'],
          category: product['category_name'],
          amount: product['amount'],
          isPrescription: false,
          isDiscount: false,
          description: product['description']),
    );
  }

  return productsList;
}
