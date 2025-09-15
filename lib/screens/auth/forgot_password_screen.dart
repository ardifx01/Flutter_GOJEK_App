import 'package:flutter/material.dart';
import '../../core/constants/ui_constants.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text_field.dart';
import 'reset_password_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const routeName = '/forgot';
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctl = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Lupa Password')), 
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppInsets.screen),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.md),
              Text('Masukkan email atau nomor HP untuk reset password.', style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: AppSpacing.lg),
              AppTextField(
                controller: ctl,
                label: 'Email atau Nomor HP',
                hintText: 'contoh: budi@example.com',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.alternate_email,
              ),
              const SizedBox(height: AppSpacing.xl),
              AppButton(
                label: 'Kirim',
                onPressed: () => Navigator.pushNamed(context, ResetPasswordScreen.routeName),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

