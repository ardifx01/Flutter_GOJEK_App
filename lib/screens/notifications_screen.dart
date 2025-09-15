import 'package:flutter/material.dart';
import '../core/constants/ui_constants.dart';
import '../data/sample_data.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  String _relativeTime(DateTime time) {
    final diff = DateTime.now().difference(time);
    if (diff.inMinutes < 60) return '${diff.inMinutes}m';
    if (diff.inHours < 24) return '${diff.inHours}j';
    return '${diff.inDays}h';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifikasi')),
      body: ListView.separated(
        padding: const EdgeInsets.all(AppInsets.screen),
        itemCount: sampleNotifications.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, i) {
          final n = sampleNotifications[i];
          return ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withValues(alpha: .12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.notifications, color: Theme.of(context).colorScheme.primary),
            ),
            title: Text(n.title),
            subtitle: Text(n.message),
            trailing: Text(_relativeTime(n.time), style: Theme.of(context).textTheme.bodySmall),
          );
        },
      ),
    );
  }
}
