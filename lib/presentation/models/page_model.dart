import 'package:equatable/equatable.dart';
import 'package:simpleclub_challenge/presentation/models/item_model.dart';

class PageModel extends Equatable {
  const PageModel({required this.id, required this.title, required this.itemId, this.itemModel});

  final String id;
  final String title;
  final String itemId;
  final ItemModel? itemModel;

  PageModel copyWith({ItemModel? itemModel}) => PageModel(id: id, title: title, itemId: itemId, itemModel: itemModel);

  @override
  List<Object?> get props => [id, title, itemId];
}
