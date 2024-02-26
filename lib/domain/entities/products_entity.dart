import 'package:canteen/domain/entities/category_entity.dart';
import 'package:canteen/domain/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

class Products extends Equatable {
  final List<ProductEntity> products;
  final List<CategoryEntity> categories;

  const Products({
    required this.products,
    required this.categories,
  });

  @override
  List<Object> get props {
    return [
      products,
      categories,
    ];
  }
}
