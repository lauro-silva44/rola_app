// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Booking _$BookingFromJson(Map<String, dynamic> json) => Booking(
      imagePath: json['imagePath'] as String,
      name: json['name'] as String,
      entryPrice: (json['entryPrice'] as num).toDouble(),
      sport: json['sport'] as String,
      distance: (json['distance'] as num).toDouble(),
      rate: (json['rate'] as num).toDouble(),
      isFavorite: json['isFavorite'] as bool,
      date: DateTime.parse(json['date'] as String),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$BookingToJson(Booking instance) => <String, dynamic>{
      'id': instance.id,
      'imagePath': instance.imagePath,
      'name': instance.name,
      'entryPrice': instance.entryPrice,
      'sport': instance.sport,
      'distance': instance.distance,
      'rate': instance.rate,
      'isFavorite': instance.isFavorite,
      'date': instance.date.toIso8601String(),
    };
