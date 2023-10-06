import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'models_exports.dart';

class Restaurant extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final String description;
  final List<String> tags;
  final List<Category> categories;
  final List<Product> products;
  final List<OpeningHours> openingHours;
  final int deliveryTime;

  final double deliveryFee;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.tags,
    required this.categories,
    required this.products,
    required this.openingHours,
    this.deliveryTime = 10,
    this.deliveryFee = 10,
  });

  factory Restaurant.fromSnapshot(DocumentSnapshot snap) {
    final data = snap.data() as Map<String, dynamic>;
    print("$snap");
    return Restaurant(
      id: snap.id,
      name: data['name'],
      imageUrl: data['imageUrl'],
      description: data['description'],
      categories: (snap['categories'] is List<dynamic>
          ? (snap['categories'] as List<dynamic>).map(
              (category) {
                return Category.fromSnapshot(category);
              },
            ).toList()
          : []),
      tags: List<String>.from(data['tags']),
      products: (data['products'] as List<dynamic>)
          .map((product) => Product.fromSnapshot(product))
          .toList(),
      openingHours: (data['openingHours'] as List<dynamic>)
          .map((openingHour) => OpeningHours.fromSnapshot(openingHour))
          .toList(),
      deliveryTime: data['deliveryTime'] ?? 10,
      deliveryFee: data['deliveryFee'] ?? 10.0,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      description,
      imageUrl,
      tags,
      categories,
      products,
      openingHours,
      deliveryTime,
      deliveryFee,
    ];
  }
}
