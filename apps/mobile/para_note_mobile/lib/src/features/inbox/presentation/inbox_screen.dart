import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/providers.dart';

class InboxScreen extends ConsumerStatefulWidget {
  const InboxScreen({super.key});

  static const routeName = 'inbox';

  @override
  ConsumerState<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends ConsumerState<InboxScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inbox = ref.watch(inboxListProvider);
    final captureState = ref.watch(captureInboxProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Inbox')),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Capture an idea…',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: captureState.isLoading
                        ? null
                        : () async {
                            if (_controller.text.trim().isEmpty) {
                              return;
                            }
                            await ref
                                .read(captureInboxProvider.notifier)
                                .capture(_controller.text.trim());
                            _controller.clear();
                          },
                    child: captureState.isLoading
                        ? const SizedBox(
                            height: 16,
                            width: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.send),
                  ),
                ],
              ),
            ),
            Expanded(
              child: inbox.when(
                data: (items) => ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return ListTile(
                      title: Text(item.content),
                      subtitle: Text(item.capturedAt.toIso8601String()),
                    );
                  },
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stackTrace) => Center(
                  child: Text('Failed to load inbox: $error'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
