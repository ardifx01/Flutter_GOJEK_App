import 'package:flutter/material.dart';
import '../../core/constants/ui_constants.dart';
import '../../data/sample_data.dart';
import '../../widgets/setting_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = sampleUser;
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppInsets.screen),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Text(
                      user.name.isNotEmpty ? user.name[0] : '?',
                      style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.xl),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.name, style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 4),
                        Text(user.phone, style: Theme.of(context).textTheme.bodyMedium),
                        const SizedBox(height: 2),
                        Text(user.email, style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ),
                  Chip(label: Text(user.level)),
                ],
              ),

              const SizedBox(height: AppSpacing.xl),
              Container(
                padding: const EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppRadii.lg),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Saldo GoPay', style: Theme.of(context).textTheme.bodySmall),
                          const SizedBox(height: 4),
                          Text('Rp${user.balance.toStringAsFixed(0)}', style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ),
                    const SizedBox(width: AppSpacing.lg),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Poin', style: Theme.of(context).textTheme.bodySmall),
                          const SizedBox(height: 4),
                          Text('${user.points}', style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppSpacing.xl),
              Text('Akun', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: AppSpacing.md),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppRadii.lg),
                ),
                child: const Column(
                  children: [
                    SettingTile(leading: Icons.person, title: 'Edit Profil', subtitle: 'Ubah nama, email, nomor HP'),
                    Divider(height: 1),
                    SettingTile(leading: Icons.payment, title: 'Metode Pembayaran', subtitle: 'Kelola kartu & rekening'),
                    Divider(height: 1),
                    SettingTile(leading: Icons.location_on, title: 'Alamat', subtitle: 'Alamat rumah & kantor'),
                  ],
                ),
              ),

              const SizedBox(height: AppSpacing.xl),
              Text('Keamanan', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: AppSpacing.md),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppRadii.lg),
                ),
                child: Column(
                  children: [
                    SettingTile(
                      leading: Icons.lock_reset,
                      title: 'Reset Password',
                      onTap: () => Navigator.pushNamed(context, '/reset'),
                    ),
                    const Divider(height: 1),
                    SettingTile(
                      leading: Icons.logout,
                      title: 'Keluar',
                      onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

