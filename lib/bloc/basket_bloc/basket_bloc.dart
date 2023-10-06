import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/models_exports.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(BasketLoading()) {
    on<StartBasket>(_onStartBasket);
    on<AddProduct>(_onAddProduct);
    on<RemoveProduct>(_onRemoveProduct);
    on<ToggleSwitch>(_onToggleSwitch);

    on<AddVoucher>(_onAddVoucher);
  }

  void _onStartBasket(
    StartBasket event,
    Emitter<BasketState> emit,
  ) async {
    emit(BasketLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(const BasketLoaded(basket: Basket()));
    } catch (_) {}
  }

  void _onAddProduct(
    AddProduct event,
    Emitter<BasketState> emit,
  ) {
    final currentState = state;
    if (currentState is BasketLoaded) {
      try {
        final updatedProducts = List<Product>.from(currentState.basket.product)
          ..add(event.product);
        final updatedBasket =
            currentState.basket.copyWith(product: updatedProducts);
        emit(BasketLoaded(basket: updatedBasket));
      } catch (_) {}
    }
  }

  void _onRemoveProduct(
    RemoveProduct event,
    Emitter<BasketState> emit,
  ) {
    final currentState = state;
    if (currentState is BasketLoaded) {
      try {
        final updatedProducts = List<Product>.from(currentState.basket.product)
          ..remove(event.product);
        final updatedBasket =
            currentState.basket.copyWith(product: updatedProducts);
        emit(BasketLoaded(basket: updatedBasket));
      } catch (_) {}
    }
  }

  void _onToggleSwitch(
    ToggleSwitch event,
    Emitter<BasketState> emit,
  ) {
    final currentState = state;
    if (currentState is BasketLoaded) {
      try {
        final updatedBasket =
            currentState.basket.copyWith(cutlery: !currentState.basket.cutlery);
        emit(BasketLoaded(basket: updatedBasket));
      } catch (_) {}
    }
  }

  void _onAddVoucher(
    AddVoucher event,
    Emitter<BasketState> emit,
  ) {
    final currentState = state;
    if (currentState is BasketLoaded) {
      try {
        final updatedBasket =
            currentState.basket.copyWith(voucher: event.voucher);
        emit(BasketLoaded(basket: updatedBasket));
      } catch (_) {}
    }
  }
}
