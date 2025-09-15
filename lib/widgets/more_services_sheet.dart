import 'package:flutter/material.dart';

import '../core/constants/ui_constants.dart';
import '../data/sample_data.dart';

void showMoreServicesSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Theme.of(context).colorScheme.surface,
    showDragHandle: true,
    builder: (ctx) {
      return const FractionallySizedBox(
        heightFactor: 1,
        child: MoreServicesSheet(),
      );
    },
  );
}

class MoreServicesSheet extends StatelessWidget {
  const MoreServicesSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final topItems = sampleFeatures
        .where((e) => e.id != 'more')
        .toList(growable: false);

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(
        AppInsets.screen,
        0,
        AppInsets.screen,
        AppInsets.screen,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Layanan teratas', style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.lg),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: AppSpacing.lg,
              mainAxisSpacing: AppSpacing.lg,
              childAspectRatio: 0.8,
            ),
            itemCount: topItems.length,
            itemBuilder: (context, i) {
              final item = topItems[i];
              return _TopServiceItem(
                icon: item.icon,
                color: item.color,
                label: item.title,
              );
            },
          ),

          const SizedBox(height: AppSpacing.xl),
          Text('Layanan lainnya', style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.lg),

          for (final section in sampleMoreServiceSections) ...[
            Text(section.title, style: textTheme.titleMedium),
            const SizedBox(height: AppSpacing.md),
            Card(
              margin: EdgeInsets.zero,
              child: Column(
                children: [
                  for (int i = 0; i < section.items.length; i++) ...[
                    _MoreServiceTile(data: section.items[i]),
                    if (i < section.items.length - 1) const Divider(height: 1),
                  ],
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
          ],
        ],
      ),
    );
  }
}

class _TopServiceItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  const _TopServiceItem({
    required this.icon,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: color.withValues(alpha: .12),
            borderRadius: BorderRadius.circular(AppRadii.lg),
          ),
          child: Icon(icon, color: color, size: 30),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class _MoreServiceTile extends StatelessWidget {
  final MoreServiceItemData data;
  const _MoreServiceTile({required this.data});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: data.color.withValues(alpha: .12),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(data.icon, color: data.color),
      ),
      title: Text(data.title, style: Theme.of(context).textTheme.bodyLarge),
      subtitle: Text(
        data.subtitle,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      onTap: () {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Buka ${data.title}')), // placeholder action
        );
      },
    );
  }
}
