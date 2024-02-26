import 'package:canteen/domain/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String id;
  final String name;
  final String image;
  final List<ProductEntity> products;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.products,
  });

  @override
  List<Object?> get props => [id, name, image];
}
