import 'package:flutter/material.dart';
import '../../core/constants/ui_constants.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text_field.dart';
import '../auth/login_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  static const routeName = '/reset';
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pass1 = TextEditingController();
    final pass2 = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Reset Password')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppInsets.screen),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextField(
                controller: pass1,
                label: 'Password Baru',
                hintText: '••••••••',
                obscureText: true,
                prefixIcon: Icons.lock_outline,
              ),
              const SizedBox(height: AppSpacing.lg),
              AppTextField(
                controller: pass2,
                label: 'Konfirmasi Password',
                hintText: '••••••••',
                obscureText: true,
                prefixIcon: Icons.lock_outline,
              ),
              const SizedBox(height: AppSpacing.xl),
              AppButton(
                label: 'Reset Password',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Password berhasil direset')));
                  Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (route) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

