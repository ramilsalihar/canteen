import 'package:canteen/domain/models/category_model.dart';
import 'package:canteen/domain/models/product_model.dart';

class ProductListModel {
  final List<ProductModel> products;
  final List<CategoryModel> categories;

  ProductListModel({
    required this.products,
    required this.categories,
  });
}
