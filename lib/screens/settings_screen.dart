import 'package:flutter/material.dart';
import '../core/constants/ui_constants.dart';
import '../widgets/setting_tile.dart';
import 'users_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notif = true;
  bool _dark = false; // Dark theme not implemented; acts as placeholder

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pengaturan')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppInsets.screen),
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppRadii.lg),
              ),
              child: Column(
                children: [
                  SettingTile(
                    leading: Icons.notifications_active,
                    title: 'Notifikasi',
                    trailing: Switch(value: _notif, onChanged: (v) => setState(() => _notif = v)),
                  ),
                  const Divider(height: 1),
                  SettingTile(
                    leading: Icons.dark_mode,
                    title: 'Mode Gelap',
                    trailing: Switch(value: _dark, onChanged: (v) => setState(() => _dark = v)),
                  ),
                  const Divider(height: 1),
                  SettingTile(
                    leading: Icons.language,
                    title: 'Bahasa',
                    subtitle: 'Indonesia',
                    onTap: () {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.xl),
            Text('Lainnya', style: Theme.of(context).textTheme.titleMedium),
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
                    leading: Icons.group,
                    title: 'Pengguna',
                    subtitle: 'Lihat daftar pengguna',
                    onTap: () => Navigator.pushNamed(context, UsersScreen.routeName),
                  ),
                  const Divider(height: 1),
                  const SettingTile(
                    leading: Icons.info_outline,
                    title: 'Tentang Aplikasi',
                    subtitle: 'Versi 1.0.0',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

