import 'package:canteen/domain/models/product_model.dart';

class ProductBillModel {
  String id;
  String date;
  List<ProductModel> products;
  String total;

  ProductBillModel({
    required this.id,
    required this.date,
    required this.products,
    required this.total,
  });
}
