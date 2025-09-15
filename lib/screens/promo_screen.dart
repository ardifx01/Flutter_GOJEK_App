import 'package:flutter/material.dart';
import '../core/constants/ui_constants.dart';

class PromoScreen extends StatelessWidget {
  const PromoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Promo')),
      body: ListView.separated(
        padding: const EdgeInsets.all(AppInsets.screen),
        itemBuilder: (context, i) => ListTile(
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: Text('Promo spesial #${i + 1}'),
          subtitle: const Text('Diskon menarik untukmu hari ini'),
          trailing: const Icon(Icons.chevron_right),
        ),
        separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.md),
        itemCount: 10,
      ),
    );
  }
}

