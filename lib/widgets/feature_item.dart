import 'package:flutter/material.dart';
import '../core/constants/ui_constants.dart';
import '../data/sample_data.dart';

class FeatureItem extends StatelessWidget {
  final FeatureItemData data;
  final VoidCallback? onTap;
  const FeatureItem({super.key, required this.data, this.onTap});

  @override
  Widget build(BuildContext context) {
    if (data.spacer) return const SizedBox.shrink();

    final radius = BorderRadius.circular(AppRadii.lg);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Hover & ripple hanya pada kartu ikon
            Material(
              color: data.color.withValues(alpha: .12),
              borderRadius: radius,
              child: InkWell(
                onTap: onTap,
                borderRadius: radius,
                hoverColor: data.color.withValues(alpha: .18),
                splashColor: data.color.withValues(alpha: .24),
                child: SizedBox(
                  width: 52,
                  height: 52,
                  child: Icon(data.icon, color: data.color, size: 28),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            // Label tetap bisa ditap, tapi tanpa efek hover/splash
            GestureDetector(
              onTap: onTap,
              behavior: HitTestBehavior.opaque,
              child: Text(
                data.title,
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                softWrap: false,
              ),
            ),
          ],
        ),
        if (data.badge != null)
          Positioned(
            top: -6,
            left: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                data.badge!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: .2,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
