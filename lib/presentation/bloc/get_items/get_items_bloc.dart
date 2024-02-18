import 'package:canteen/domain/usecases/user_cases/view_content_usecase.dart';
import 'package:canteen/presentation/bloc/get_items/get_items_event.dart';
import 'package:canteen/presentation/bloc/get_items/get_items_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetItemsBloc extends Bloc<GetItemsEvent, GetItemsState> {
  final ViewContentUseCase viewContentUseCase;

  GetItemsBloc({required this.viewContentUseCase}) : super(GetItemsInitial());

  Stream<GetItemsState> mapEventToState(GetItemsEvent event) async* {
    if (event is GetItemsFetchEvent) {
      yield GetItemsFetchingState();
      final itemsEither = await viewContentUseCase();
      yield itemsEither.fold(
        (failure) => GetItemsFetchingFailureState(failure.toString()),
        (items) => GetItemsFetchingSuccessState(items: items),
      );
    }
  }
}
