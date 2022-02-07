import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simpleclub_challenge/data/models/content_response_entity.dart';
import 'package:simpleclub_challenge/data/repository/content_repository.dart';
import 'package:simpleclub_challenge/presentation/models/item_model.dart';
import 'package:simpleclub_challenge/presentation/models/page_model.dart';
import 'package:simpleclub_challenge/utils/app_extensions.dart';

/// Loads simpleclub's test challenge content from API via [ContentRepository]
class ContentCubit extends Cubit<ContentState> {
  ContentCubit(this._contentRepository) : super(const ContentState());

  final ContentRepository _contentRepository;

  Future<void> loadContent({required String contentId}) async {
    if (state.stateType == ContentStateType.success && state.contentId == contentId) {
      final successState = state;
      emit(state.toLoading(contentId));
      return emit(successState);
    }
    emit(state.toLoading(contentId));
    try {
      ContentResponseEntity response = await _contentRepository.fetchContent(contentId: contentId);
      List<ItemModel> items =
          response.items.map((e) => ItemModel(id: e.id, title: e.title, imageUrl: e.imageUrl, body: e.body, source: e.source)).toList();
      List<PageModel> pages = response.pages
          .map((p) => PageModel(
                id: p.id,
                title: p.title,
                itemId: p.itemId,
                itemModel: items.firstWhereOrNull((i) => i.id == p.itemId),
              ))
          .toList();
      emit(state.toSuccess(pages, items));
    } catch (ex) {
      emit(state.toError());
    }
  }
}

enum ContentStateType { initial, loading, success, error }

class ContentState extends Equatable {
  const ContentState({this.stateType = ContentStateType.initial, this.contentId, this.pages, this.items});

  final ContentStateType stateType;

  final String? contentId;
  final List<PageModel>? pages;
  final List<ItemModel>? items;

  ContentState toLoading(String contentId) => copyWith(stateType: ContentStateType.loading, contentId: contentId);

  ContentState toSuccess(List<PageModel> pages, List<ItemModel> items) =>
      copyWith(stateType: ContentStateType.success, pages: pages, items: items);

  ContentState toError() => copyWith(stateType: ContentStateType.error);

  @override
  List<Object?> get props => [stateType, contentId, pages, items];

  ContentState copyWith({ContentStateType? stateType, String? contentId, List<PageModel>? pages, List<ItemModel>? items}) => ContentState(
      stateType: stateType ?? this.stateType,
      contentId: contentId ?? this.contentId,
      pages: pages ?? this.pages,
      items: items ?? this.items);
}
