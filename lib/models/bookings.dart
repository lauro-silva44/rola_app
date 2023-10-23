import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';
part 'bookings.g.dart';

const uuid = Uuid();

@JsonSerializable()
class Booking {
  Booking(
      {required this.imagePath,
      required this.name,
      required this.entryPrice,
      required this.sport,
      required this.distance,
      required this.rate,
      required this.isFavorite,
      required this.date,
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
  final DateTime date;

  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);

  Map<String, dynamic> toJson() => _$BookingToJson(this);
}
