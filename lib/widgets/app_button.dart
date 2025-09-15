import 'package:flutter/material.dart';
import '../core/constants/ui_constants.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isPrimary;
  final IconData? icon;

  const AppButton({super.key, required this.label, this.onPressed, this.isPrimary = true, this.icon});

  @override
  Widget build(BuildContext context) {
    final style = isPrimary
        ? Theme.of(context).elevatedButtonTheme.style
        : ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Theme.of(context).colorScheme.primary,
            minimumSize: const Size(double.infinity, AppSizes.buttonHeight),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadii.lg), side: BorderSide(color: Theme.of(context).colorScheme.primary)),
            elevation: 0,
          );
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        style: style,
        onPressed: onPressed,
        icon: icon != null ? Icon(icon) : const SizedBox.shrink(),
        label: Text(label),
      ),
    );
  }
}

