part of 'basket_bloc.dart';

abstract class BasketEvent extends Equatable {
  const BasketEvent();

  @override
  List<Object?> get props => [];
}

class StartBasket extends BasketEvent {
  @override
  List<Object> get props => [];
}

class AddProduct extends BasketEvent {
  final Product product;

  const AddProduct(this.product);

  @override
  List<Object?> get props => [product];
}

class RemoveProduct extends BasketEvent {
  final Product product;

  const RemoveProduct(this.product);

  @override
  List<Object?> get props => [product];
}

class ToggleSwitch extends BasketEvent {
  const ToggleSwitch();

  @override
  List<Object?> get props => [];
}

class AddVoucher extends BasketEvent {
  final Voucher voucher;
  const AddVoucher(
    this.voucher,
  );

  @override
  List<Object?> get props => [voucher];
}
