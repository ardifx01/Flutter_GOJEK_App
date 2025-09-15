import 'package:flutter/material.dart';
import '../core/constants/ui_constants.dart';

class GojekNavItem {
  final IconData icon;
  final IconData? selectedIcon;
  final String label;
  final int badge;
  const GojekNavItem({
    required this.icon,
    required this.label,
    this.selectedIcon,
    this.badge = 0,
  });
}

class GojekBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<GojekNavItem> items;
  const GojekBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      destinations: [
        for (final item in items)
          NavigationDestination(
            icon: _BadgeIcon(
              icon: Icon(item.icon, size: AppSizes.iconMd),
              count: item.badge,
              color: colorScheme.error,
            ),
            selectedIcon: _BadgeIcon(
              icon: Icon(item.selectedIcon ?? item.icon, size: AppSizes.iconMd),
              count: item.badge,
              color: colorScheme.error,
            ),
            label: item.label,
          ),
      ],
    );
  }
}

class _BadgeIcon extends StatelessWidget {
  final Widget icon;
  final int count;
  final Color? color;

  const _BadgeIcon({
    required this.icon,
    required this.count,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    if (count <= 0) return icon;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        icon,
        Positioned(
          right: -6,
          top: -6,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            decoration: BoxDecoration(
              color: color ?? Theme.of(context).colorScheme.error,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '$count',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 9,
                fontWeight: FontWeight.w700,
                height: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
