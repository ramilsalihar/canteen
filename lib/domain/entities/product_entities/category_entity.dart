import 'package:canteen/domain/entities/product_entities/product_entity.dart';
import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String id;
  final String categoryName;
  final List<ProductEntity> products;

  const CategoryEntity({
    required this.id,
    required this.categoryName,
    required this.products,
  });

  @override
  List<Object?> get props => [id, categoryName, products];
}
