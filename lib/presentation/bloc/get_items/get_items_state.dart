import 'package:canteen/domain/entities/product_entities/product_entity.dart';
import 'package:equatable/equatable.dart';

abstract class GetItemsState extends Equatable {
  const GetItemsState();

  @override
  List<Object> get props => [];
}

class GetItemsInitial extends GetItemsState {}

class GetItemsFetchingState extends GetItemsState {}

class GetItemsFetchingSuccessState extends GetItemsState {
  final List<ProductEntity> items;

  const GetItemsFetchingSuccessState({required this.items});

  @override
  List<Object> get props => [items];
}

class GetItemsFetchingFailureState extends GetItemsState {
  final String message;

  const GetItemsFetchingFailureState(this.message);

  @override
  List<Object> get props => [message];
}
