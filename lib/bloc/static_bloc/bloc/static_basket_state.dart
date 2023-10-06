part of 'static_basket_bloc.dart';

abstract class StaticBasketState extends Equatable {
  const StaticBasketState();

  @override
  List<Object?> get props => [];
}

class StaticBasketLoading extends StaticBasketState {}

class StaticBasketLoaded extends StaticBasketState {
  final StaticBasket basketItems;
  const StaticBasketLoaded({required this.basketItems});

  @override
  List<Object?> get props => [basketItems];
}
