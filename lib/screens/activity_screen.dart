import 'package:flutter/material.dart';
import '../core/constants/ui_constants.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aktivitas')),
      body: ListView.separated(
        padding: const EdgeInsets.all(AppInsets.screen),
        itemBuilder: (context, i) => ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withValues(alpha: .12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.receipt_long),
          ),
          title: Text('Transaksi #${i + 1}'),
          subtitle: const Text('Detail transaksi terbaru'),
          trailing: const Text('- Rp15.000'),
        ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: 12,
      ),
    );
  }
}

