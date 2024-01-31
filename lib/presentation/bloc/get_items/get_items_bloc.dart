import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:canteen/presentation/bloc/get_items/get_items_event.dart';
import 'package:canteen/presentation/bloc/get_items/get_items_state.dart';
import 'package:canteen/domain/usecases/user_cases/get_all_items.dart';

class GetItemsBloc extends Bloc<GetItemsEvent, GetItemsState> {
  final GetAllItems getAllItems;

  GetItemsBloc({required this.getAllItems}) : super(GetItemsInitial());

  Stream<GetItemsState> mapEventToState(GetItemsEvent event) async* {
    if (event is GetItemsFetchEvent) {
      yield GetItemsFetchingState();
      final itemsEither = await getAllItems();
      yield itemsEither.fold(
        (failure) => GetItemsFetchingFailureState(failure.toString()),
        (items) => GetItemsFetchingSuccessState(items: items),
      );
    }
  }
}