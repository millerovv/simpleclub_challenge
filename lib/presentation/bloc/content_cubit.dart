import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simpleclub_challenge/data/models/content_response_entity.dart';
import 'package:simpleclub_challenge/data/repository/content_repository.dart';

/// Loads simpleclub's test challenge content from API via [ContentRepository]
class ContentCubit extends Cubit<ContentState> {
  ContentCubit(this._contentRepository) : super(const ContentState());

  final ContentRepository _contentRepository;

  Future<void> loadContent({required String contentId}) async {

  }
}

enum ContentStateType { initial, loading, success, error }

class ContentState extends Equatable {
  const ContentState({this.stateType = ContentStateType.initial, this.contentId, this.pages, this.items});

  final ContentStateType stateType;

  final String? contentId;
  final List<PageEntity>? pages;
  final List<ItemEntity>? items;

  ContentState toLoading() => copyWith(stateType: ContentStateType.loading);

  ContentState toSuccess(List<PageEntity> pages, List<ItemEntity> items) =>
      copyWith(stateType: ContentStateType.success, pages: pages, items: items);

  ContentState toError() => copyWith(stateType: ContentStateType.error);

  @override
  List<Object?> get props => [stateType, contentId, pages, items];

  ContentState copyWith({ContentStateType? stateType, String? contentId, List<PageEntity>? pages, List<ItemEntity>? items}) => ContentState(
      stateType: stateType ?? this.stateType,
      contentId: contentId ?? this.contentId,
      pages: pages ?? this.pages,
      items: items ?? this.items);
}
