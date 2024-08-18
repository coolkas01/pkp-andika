import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soalinterview/presentation/logger/providers.dart';

class LoggerList extends ConsumerWidget {
  const LoggerList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(readSavedLogsProvider).when(
        loading: () =>
        const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, _) =>
            Center(
              child: Text('Something went wrong: $error'),
            ),
        data: (logs) =>
            ListView.builder(
              itemBuilder: (_, i) =>
                  Card(
                    child: ListTile(
                      title: Text(logs[i].createdAt),
                      subtitle: Text('${logs[i].method} - ${logs[i].code} - ${logs[i].url}\n${logs[i].body}', maxLines: 2),
                      selected: logs[i].code != 200,
                      tileColor: Colors.green.shade50,
                    ),
                  ),
              itemCount: logs.length,
            ),
      );
}