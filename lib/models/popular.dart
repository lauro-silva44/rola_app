import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'popular.g.dart';

const uuid = Uuid();

@JsonSerializable()
class Popular {
  Popular(
      {required this.name,
      required this.imagePath,
      required this.entryPrice,
      required this.sport,
      required this.isFavorite,
      required this.distance,
      required this.rate,
      String? id})
      : id = id ?? uuid.v4();
  final String id;
  final String imagePath;
  final String name;
  final double entryPrice;
  final String sport;
  final double distance;
  final double rate;
  final bool isFavorite;

  factory Popular.fromJson(Map<String, dynamic> json) =>
      _$PopularFromJson(json);

  Map<String, dynamic> toJson() => _$PopularToJson(this);
}
