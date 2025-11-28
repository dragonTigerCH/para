import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain_models/domain_models.dart';

import '../api/para_api_client.dart';

final paraApiClientProvider = Provider<ParaApiClient>((ref) {
  return ParaApiClient();
});

final projectListProvider = FutureProvider.autoDispose<List<Project>>((ref) {
  final api = ref.watch(paraApiClientProvider);
  return api.fetchProjects(status: ProjectStatus.active);
});

final inboxListProvider = FutureProvider.autoDispose<List<InboxItem>>((ref) {
  final api = ref.watch(paraApiClientProvider);
  return api.fetchInbox();
});

final projectDetailProvider =
    FutureProvider.autoDispose.family<Project, String>((ref, id) {
  final api = ref.watch(paraApiClientProvider);
  return api.fetchProject(id);
});

class CaptureInboxController extends AutoDisposeAsyncNotifier<void> {
  @override
  Future<void> build() async {
    // no-op
  }

  Future<void> capture(String content) async {
    final api = ref.read(paraApiClientProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await api.createInboxItem(content);
      ref.invalidate(inboxListProvider);
    });
  }
}

final captureInboxProvider =
    AutoDisposeAsyncNotifierProvider<CaptureInboxController, void>(
  CaptureInboxController.new,
);
