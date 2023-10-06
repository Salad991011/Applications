import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_app/bloc/bloc_export.dart';

import '../../../models/models_exports.dart';

part 'static_basket_event.dart';
part 'static_basket_state.dart';

class StaticBasketBloc extends Bloc<StaticBasketEvent, StaticBasketState> {
  StaticBasketBloc() : super(StaticBasketLoading()) {
    on<StartStaticBasket>(_onStartStaticBasket);
    on<RemoveItem>(
        _onRemoveItem as EventHandler<RemoveItem, StaticBasketState>);
    on<AddItem>(_onAddItem as EventHandler<AddItem, StaticBasketState>);
  }
  void _onStartStaticBasket(
    StartStaticBasket event,
    Emitter<StaticBasketState> emit,
  ) async {
    emit(StaticBasketLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(const StaticBasketLoaded(basketItems: StaticBasket()));
    } catch (_) {}
  }

  void _onAddItem(
    AddItem event,
    Emitter<StaticBasketState> emit,
  ) {
    final currentState = state;
    if (currentState is StaticBasketLoaded) {
      try {
        final updatedItems = List<MenuItem>.from(currentState.basketItems.items)
          ..add(event.item);
        final updatedBasket =
            currentState.basketItems.copyWith(items: updatedItems);
        emit(StaticBasketLoaded(basketItems: updatedBasket));
      } catch (_) {}
    }
  }

  void _onRemoveItem(
    RemoveItem event,
    Emitter<StaticBasketState> emit,
  ) {
    final currentState = state;
    if (currentState is StaticBasketLoaded) {
      try {
        final updatedItems = List<MenuItem>.from(currentState.basketItems.items)
          ..remove(event.item);
        final updatedBasket =
            currentState.basketItems.copyWith(items: updatedItems);
        emit(StaticBasketLoaded(basketItems: updatedBasket));
      } catch (_) {}
    }
  }
}
