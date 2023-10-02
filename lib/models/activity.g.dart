// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Activity _$ActivityFromJson(Map<String, dynamic> json) => Activity(
      json['name'] as String,
      json['imagePath'] as String,
      json['venues'] as String,
    );

Map<String, dynamic> _$ActivityToJson(Activity instance) => <String, dynamic>{
      'name': instance.name,
      'imagePath': instance.imagePath,
      'venues': instance.venues,
    };
