import 'package:flutter/material.dart';
import '../../core/constants/ui_constants.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text_field.dart';
import '../home_shell.dart';

class RegisterScreen extends StatelessWidget {
  static const routeName = '/register';
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameCtl = TextEditingController();
    final emailCtl = TextEditingController();
    final passCtl = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Daftar')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppInsets.screen),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextField(
                controller: nameCtl,
                label: 'Nama Lengkap',
                hintText: 'contoh: Budi Santoso',
                prefixIcon: Icons.person_outline,
              ),
              const SizedBox(height: AppSpacing.lg),
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
              const SizedBox(height: AppSpacing.xl),
              AppButton(
                label: 'Daftar',
                onPressed: () => Navigator.pushReplacementNamed(context, HomeShell.routeName),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

