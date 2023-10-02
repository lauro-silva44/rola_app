import 'package:json_annotation/json_annotation.dart';
part 'activity.g.dart';

@JsonSerializable()
class Activity {
  const Activity(this.name, this.imagePath, this.venues);
  final String name;
  final String imagePath;
  final String venues;

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityToJson(this);
}
