import 'package:equatable/equatable.dart';

class SliverModel extends Equatable {
  final String name;
  final num price;
  final String symbol;
  final String updatedAt;
  final String updatedAtReadable;
  const SliverModel({
    required this.name,
    required this.price,
    required this.symbol,
    required this.updatedAt,
    required this.updatedAtReadable,
  });
  factory SliverModel.fromJson(Map<String, dynamic> json) {
    return SliverModel(
      name: json['name'],
      price: json['price'],
      symbol: json['symbol'],
      updatedAt: json['updated_at'],
      updatedAtReadable: json['updated_at_readable'],
    );
  }

  @override
  List<Object?> get props => [
    name,
    price,
    symbol,
    updatedAt,
    updatedAtReadable,
  ];
}
