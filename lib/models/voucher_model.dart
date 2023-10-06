import 'package:equatable/equatable.dart';

class Voucher extends Equatable {
  final int id;
  final String code;
  final double value;

  const Voucher({
    required this.id,
    required this.code,
    required this.value,
  });

  @override
  List<Object?> get props => [id, code, value];
  static List<Voucher> voucher = [
    const Voucher(id: 1, code: 'SAVE5%', value: 5),
    const Voucher(id: 2, code: 'SAVE10%', value: 10),
    const Voucher(id: 3, code: 'SAVE15%', value: 15),
  ];
}
