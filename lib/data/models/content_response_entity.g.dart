// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentResponseEntity _$ContentResponseEntityFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['pages', 'items'],
  );
  return ContentResponseEntity(
    pages: (json['pages'] as List<dynamic>?)
            ?.map((e) => PageEntity.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => ItemEntity.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

PageEntity _$PageEntityFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'title', 'itemId'],
    disallowNullValues: const ['id', 'title', 'itemId'],
  );
  return PageEntity(
    id: json['id'] as String,
    title: json['title'] as String,
    itemId: json['itemId'] as String,
  );
}

ItemEntity _$ItemEntityFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'title'],
    disallowNullValues: const ['id', 'title'],
  );
  return ItemEntity(
    id: json['id'] as String,
    title: json['title'] as String,
    imageUrl: json['imageUrl'] as String?,
    body: json['body'] as String?,
    source: json['source'] as String?,
  );
}
