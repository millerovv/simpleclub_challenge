import 'package:dio/dio.dart';
import 'package:simpleclub_challenge/data/models/content_response_entity.dart';

class ContentRepository {

  static const _contentUrl = 'https://simpleclub-coding-challenges.web.app/navigating-dynamic-content/';

  final Dio dio = Dio();

  Future<ContentResponseEntity> fetchContent({required String contentId}) async {
    final Response response = await dio.get('$_contentUrl$contentId');
    return ContentResponseEntity.fromJson(response.data);
  }
}