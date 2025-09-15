import 'package:flutter/material.dart';
import 'dashboard/dashboard_screen.dart';
import 'promo_screen.dart';
import 'activity_screen.dart';
import 'chat_screen.dart';
import '../widgets/gojek_bottom_nav.dart';

class HomeShell extends StatefulWidget {
  static const routeName = '/home';
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _index = 0;

  final _pages = const [
    DashboardScreen(),
    PromoScreen(),
    ActivityScreen(),
    ChatScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(top: false, child: IndexedStack(index: _index, children: _pages)),
      bottomNavigationBar: GojekBottomNav(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          GojekNavItem(icon: Icons.home_outlined, selectedIcon: Icons.home_rounded, label: 'Beranda'),
          GojekNavItem(icon: Icons.local_offer_outlined, selectedIcon: Icons.local_offer, label: 'Promo'),
          GojekNavItem(icon: Icons.receipt_long_outlined, selectedIcon: Icons.receipt_long, label: 'Aktivitas'),
          GojekNavItem(icon: Icons.chat_bubble_outline, selectedIcon: Icons.chat_bubble, label: 'Chat', badge: 2),
        ],
      ),
    );
  }
}
