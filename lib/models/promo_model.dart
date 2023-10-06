import 'package:equatable/equatable.dart';

class PromoModel extends Equatable {
  final int id;
  final String title;
  final String description;
  final String imageUrl;

  const PromoModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.imageUrl});

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        imageUrl,
      ];
  static List<PromoModel> promos = [
    const PromoModel(
        id: 1,
        title: '20% OFF  ON SELECTED RESTAURANTS',
        description: 'GET A DISCOUNT AT MORE THAN 20+ RESTURANTS!',
        imageUrl: 'assets/logos/akel.jpg'),
    const PromoModel(
        id: 2,
        title: 'FREE DELIVERY ON FIRST 3 ORDERS',
        description:
            'PLACE AN ORDER OF \10JD OR MORE TO GET A FREE DELIVERY ON US!',
        imageUrl: 'assets/logos/akel.jpg'),
    const PromoModel(
        id: 3,
        title: 'FREE DELIVERY ON FIRST 3 ORDERS',
        description:
            'PLACE AN ORDER OF \10JD OR MORE TO GET A FREE DELIVERY ON US!',
        imageUrl: 'assets/logos/akel.jpg'),
  ];
}
