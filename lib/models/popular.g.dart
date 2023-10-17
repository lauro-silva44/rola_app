// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Popular _$PopularFromJson(Map<String, dynamic> json) => Popular(
      name: json['name'] as String,
      imagePath: json['imagePath'] as String,
      entryPrice: (json['entryPrice'] as num).toDouble(),
      sport: json['sport'] as String,
      isFavorite: json['isFavorite'] as bool,
      distance: (json['distance'] as num).toDouble(),
      rate: (json['rate'] as num).toDouble(),
    );

Map<String, dynamic> _$PopularToJson(Popular instance) => <String, dynamic>{
      'imagePath': instance.imagePath,
      'name': instance.name,
      'entryPrice': instance.entryPrice,
      'sport': instance.sport,
      'distance': instance.distance,
      'rate': instance.rate,
      'isFavorite': instance.isFavorite,
    };
