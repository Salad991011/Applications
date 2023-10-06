part of 'static_basket_bloc.dart';

abstract class StaticBasketEvent extends Equatable {
  const StaticBasketEvent();

  @override
  List<Object?> get props => [];
}

class StartStaticBasket extends StaticBasketEvent {
  @override
  List<Object> get props => [];
}

class AddItem extends StaticBasketEvent {
  final MenuItem item;

  const AddItem(this.item);

  @override
  List<Object?> get props => [item];
}

class RemoveItem extends StaticBasketEvent {
  final MenuItem item;

  const RemoveItem(this.item);

  @override
  List<Object?> get props => [item];
}
