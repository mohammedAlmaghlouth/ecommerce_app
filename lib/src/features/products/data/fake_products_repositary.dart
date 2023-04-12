import 'package:ecommerce_app/src/constants/test_products.dart';
import '../domain/product.dart';

class FakeProductsRepository {
  FakeProductsRepository._();
  final List<Product> _products = kTestProducts;
  static FakeProductsRepository instance = FakeProductsRepository._();
  List<Product> getProductsList() {
    return _products;
  }

  Product? getProduct(String id) {
    return _products.firstWhere((product) => product.id == id);
  }

  Future<List<Product>> fetchProductList() {
    return Future.value(_products);
  }

  Stream<List<Product>> watchProductList() {
    return Stream.value(_products);
  }

  Stream<Product?> watchProduct(String id) {
    return watchProductList().map((product)=>_products.firstWhere((product) => product.id == id));
  }

}
