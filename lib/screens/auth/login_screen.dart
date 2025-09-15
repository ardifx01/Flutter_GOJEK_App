import 'package:flutter/material.dart';
import '../../core/constants/ui_constants.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text_field.dart';
import '../home_shell.dart';
import 'forgot_password_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailCtl = TextEditingController();
    final passCtl = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppInsets.screen),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary.withValues(alpha: .12),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(Icons.local_taxi, color: Theme.of(context).colorScheme.primary, size: 32),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text('Selamat datang!', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 6),
              Text('Masuk untuk lanjut', style: Theme.of(context).textTheme.bodyMedium),

              const SizedBox(height: AppSpacing.xl),
              AppTextField(
                controller: emailCtl,
                label: 'Email atau Nomor HP',
                hintText: 'contoh: budi@example.com',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.alternate_email,
              ),
              const SizedBox(height: AppSpacing.lg),
              AppTextField(
                controller: passCtl,
                label: 'Kata Sandi',
                hintText: '••••••••',
                obscureText: true,
                prefixIcon: Icons.lock_outline,
              ),

              const SizedBox(height: AppSpacing.md),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Navigator.pushNamed(context, ForgotPasswordScreen.routeName),
                  child: const Text('Lupa Password?'),
                ),
              ),

              const SizedBox(height: AppSpacing.lg),
              AppButton(
                label: 'Masuk',
                onPressed: () => Navigator.pushReplacementNamed(context, HomeShell.routeName),
              ),

              const SizedBox(height: AppSpacing.lg),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Belum punya akun? '),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, RegisterScreen.routeName),
                    child: const Text('Daftar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
