import 'package:dio/dio.dart';
import 'package:domain_models/domain_models.dart';

class ParaApiClient {
  ParaApiClient({Dio? dio, String? baseUrl})
      : _dio = dio ?? Dio(BaseOptions(baseUrl: baseUrl ?? _defaultBaseUrl));

  static const _defaultBaseUrl = 'http://localhost:8080/api/v1';
git
  final Dio _dio;

  Future<List<Project>> fetchProjects({ProjectStatus? status}) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/projects',
      queryParameters: status != null ? {'status': status.name} : null,
    );
    final items = response.data?['items'] as List<dynamic>? ?? [];
    return items
        .map((json) => Project.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<Project> fetchProject(String id) async {
    final response = await _dio.get<Map<String, dynamic>>('/projects/$id');
    return Project.fromJson(response.data!);
  }

  Future<Project> updateProjectProgress(String id, int progress,
      {ProjectStatus? status}) async {
    final response = await _dio.patch<Map<String, dynamic>>(
      '/projects/$id/progress',
      data: {
        'progress': progress,
        if (status != null) 'status': status.name,
      },
    );
    return Project.fromJson(response.data!);
  }

  Future<List<InboxItem>> fetchInbox() async {
    final response = await _dio.get<Map<String, dynamic>>('/inbox');
    final items = response.data?['items'] as List<dynamic>? ?? [];
    return items
        .map((json) => InboxItem.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<InboxItem> createInboxItem(String content) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/inbox',
      data: {'content': content},
    );
    return InboxItem.fromJson(response.data!);
  }
}
