import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'content_response_entity.g.dart';

@JsonSerializable(createToJson: false)
class ContentResponseEntity extends Equatable {
  const ContentResponseEntity({required this.pages, required this.items});

  factory ContentResponseEntity.fromJson(Map<String, dynamic> json) => _$ContentResponseEntityFromJson(json);

  @JsonKey(required: true, defaultValue: [])
  final List<PageEntity> pages;
  @JsonKey(required: true, defaultValue: [])
  final List<ItemEntity> items;

  @override
  List<Object?> get props => [pages, items];
}

@JsonSerializable(createToJson: false)
class PageEntity extends Equatable {
  const PageEntity({required this.id, required this.title, required this.itemId});

  factory PageEntity.fromJson(Map<String, dynamic> json) => _$PageEntityFromJson(json);

  @JsonKey(required: true, disallowNullValue: true)
  final String id;
  @JsonKey(required: true, disallowNullValue: true)
  final String title;
  @JsonKey(required: true, disallowNullValue: true)
  final String itemId;

  @override
  List<Object?> get props => [id, title, itemId];
}

@JsonSerializable(createToJson: false)
class ItemEntity extends Equatable {
  const ItemEntity({required this.id, required this.title, this.imageUrl, this.body, this.source});

  factory ItemEntity.fromJson(Map<String, dynamic> json) => _$ItemEntityFromJson(json);

  @JsonKey(required: true, disallowNullValue: true)
  final String id;
  @JsonKey(required: true, disallowNullValue: true)
  final String title;
  final String? imageUrl;
  final String? body;
  final String? source;

  @override
  List<Object?> get props => [id, title, imageUrl, body, source];
}
