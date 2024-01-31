import 'package:equatable/equatable.dart';

// part of 'get_items_bloc.dart';

// @immutable
abstract class GetItemsEvent extends Equatable {
  const GetItemsEvent();

  @override
  List<Object> get props => [];
}

class GetItemsFetchEvent extends GetItemsEvent {}

class GetItemsPostEvent extends GetItemsEvent {}
