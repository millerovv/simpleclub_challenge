import 'package:equatable/equatable.dart';
import 'package:simpleclub_challenge/presentation/models/page_model.dart';
import 'package:simpleclub_challenge/presentation/routing/tab_page_router.dart';

class ItemModel extends Equatable {
  const ItemModel({required this.id, required this.title, this.imageUrl, this.body, this.source, this.page});

  final String id;
  final String title;
  final String? imageUrl;
  final String? body;
  final String? source;
  final PageModel? page;

  String get itemInfoViewRoute => '$itemInfoViewRouteName/$id';

  @override
  List<Object?> get props => [id, title, imageUrl, body, source, page];
}