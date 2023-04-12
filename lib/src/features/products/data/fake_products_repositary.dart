import 'package:ecommerce_app/src/constants/test_products.dart';
import '../domain/product.dart';

class FakeProductsRepositary {
  FakeProductsRepositary._();
  static FakeProductsRepositary instance = FakeProductsRepositary._();
  List<Product> getProductsList() {
    return kTestProducts;
  }

  Product? getProduct(String id) {
    return kTestProducts.firstWhere((product) => product.id == id);
  }
}
