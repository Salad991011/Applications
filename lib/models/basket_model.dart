import 'package:equatable/equatable.dart';
import 'package:food_app/models/models_exports.dart';

class Basket extends Equatable {
  final List<Product> product;

  final bool cutlery;
  final Voucher? voucher;

  const Basket({
    this.product = const <Product>[],
    this.cutlery = false,
    this.voucher,
  });
  Basket copyWith({
    List<Product>? product,
    bool? cutlery,
    Voucher? voucher,
  }) {
    return Basket(
      product: product ?? this.product,
      cutlery: cutlery ?? this.cutlery,
      voucher: voucher ?? this.voucher,
    );
  }

  @override
  List<Object?> get props => [
        product,
        cutlery,
        voucher,
      ];
  Map itemQuantity(products) {
    var quantity = {};

    for (var product in product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    }
    return quantity;
  }

  double get subtotal =>
      product.fold(0, (total, current) => total + current.price);
  double total(subtotal) {
    return (voucher == null) ? subtotal + 2 : subtotal + 5 - voucher!.value;
  }

  String get subtotalString => subtotal.toStringAsFixed(2);
  String get totalString => total(subtotal).toStringAsFixed(2);
}
