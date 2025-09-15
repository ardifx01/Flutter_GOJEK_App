import 'package:flutter/material.dart';

class AppUser {
  final String id;
  final String name;
  final String phone;
  final String email;
  final int points;
  final double balance;
  final String level;

  const AppUser({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.points,
    required this.balance,
    required this.level,
  });
}

class FeatureItemData {
  final String id;
  final String title;
  final IconData icon;
  final Color color;
  final String? badge;
  final bool spacer;

  const FeatureItemData({
    required this.id,
    required this.title,
    required this.icon,
    required this.color,
    this.badge,
    this.spacer = false,
  });
}

class MoreServiceItemData {
  final String id;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  const MoreServiceItemData({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });
}

class MoreServiceSectionData {
  final String title;
  final List<MoreServiceItemData> items;

  const MoreServiceSectionData({
    required this.title,
    required this.items,
  });
}

class PromoItemData {
  final String title;
  final String subtitle;
  final Color color;

  const PromoItemData({
    required this.title,
    required this.subtitle,
    required this.color,
  });
}

class NotificationItemData {
  final String title;
  final String message;
  final DateTime time;

  const NotificationItemData({
    required this.title,
    required this.message,
    required this.time,
  });
}

// Sample user
const sampleUser = AppUser(
  id: 'u1',
  name: 'Budi Santoso',
  phone: '+62 812-3456-7890',
  email: 'budi@example.com',
  points: 1240,
  balance: 152000.0,
  level: 'Gold',
);

// Sample dashboard features
const sampleFeatures = <FeatureItemData>[
  FeatureItemData(
    id: 'goride',
    title: 'GoRide',
    icon: Icons.two_wheeler,
    color: Color(0xFF00AA13),
    badge: '5RB!',
  ),
  FeatureItemData(
    id: 'gocar',
    title: 'GoCar',
    icon: Icons.directions_car,
    color: Color(0xFF10B981),
    badge: '6RB!',
  ),
  FeatureItemData(
    id: 'gofood',
    title: 'GoFood',
    icon: Icons.fastfood,
    color: Color(0xFFEF4444),
    badge: '-75%',
  ),
  FeatureItemData(
    id: 'gosend',
    title: 'GoSend',
    icon: Icons.local_shipping,
    color: Color(0xFF3B82F6),
    badge: '5RB!',
  ),
  FeatureItemData(
    id: 'gomart',
    title: 'GoMart',
    icon: Icons.store,
    color: Color(0xFFF59E0B),
    badge: '30MINS',
  ),
  FeatureItemData(
    id: 'gopinj',
    title: 'GoPay Pinjam',
    icon: Icons.savings,
    color: Color(0xFF0EA5E9),
    badge: '25JUTA',
  ),
  FeatureItemData(
    id: 'gosehat',
    title: 'GoFood Sehat',
    icon: Icons.local_grocery_store,
    color: Color(0xFFA855F7),
    badge: '-50%',
  ),
  FeatureItemData(
    id: 'more',
    title: 'Lainnya',
    icon: Icons.more_horiz,
    color: Color(0xFF9CA3AF),
  ),
];

// Additional services shown in the "Lainnya" bottom sheet
const sampleMoreServiceSections = <MoreServiceSectionData>[
  MoreServiceSectionData(
    title: 'Pesan makan dan belanja',
    items: [
      MoreServiceItemData(
        id: 'gofood',
        title: 'GoFood',
        subtitle: 'Jawaban semua ke-BM-an mamammu',
        icon: Icons.fastfood,
        color: Color(0xFFEF4444),
      ),
      MoreServiceItemData(
        id: 'gomart',
        title: 'GoMart',
        subtitle: 'Belanja kebutuhan dadakan? Pasti ada!',
        icon: Icons.store,
        color: Color(0xFFF59E0B),
      ),
      MoreServiceItemData(
        id: 'gosehat',
        title: 'GoFood Sehat',
        subtitle: 'Makan sehat jadi praktis',
        icon: Icons.local_grocery_store,
        color: Color(0xFFA855F7),
      ),
      MoreServiceItemData(
        id: 'gofood_hemat',
        title: 'GoFood HEMAT',
        subtitle: 'Makan hemat udah sama ongkir',
        icon: Icons.thumb_up,
        color: Color(0xFFEF4444),
      ),
      MoreServiceItemData(
        id: 'goshop',
        title: 'GoShop',
        subtitle: 'Solusi pas mager belanja',
        icon: Icons.shopping_bag,
        color: Color(0xFFDC2626),
      ),
      MoreServiceItemData(
        id: 'godinein',
        title: 'GoDinein',
        subtitle: 'Sedia voucher sebelum ngumpul di resto',
        icon: Icons.restaurant_menu,
        color: Color(0xFFE11D48),
      ),
    ],
  ),
  MoreServiceSectionData(
    title: 'Transportasi dan pengantaran',
    items: [
      MoreServiceItemData(
        id: 'goride',
        title: 'GoRide',
        subtitle: 'Ojek cepat dan hemat',
        icon: Icons.two_wheeler,
        color: Color(0xFF00AA13),
      ),
      MoreServiceItemData(
        id: 'gocar',
        title: 'GoCar',
        subtitle: 'Mobil nyaman ke mana aja',
        icon: Icons.directions_car,
        color: Color(0xFF10B981),
      ),
      MoreServiceItemData(
        id: 'gosend',
        title: 'GoSend',
        subtitle: 'Kirim cepat dalam kota',
        icon: Icons.local_shipping,
        color: Color(0xFF3B82F6),
      ),
    ],
  ),
  MoreServiceSectionData(
    title: 'Keuangan',
    items: [
      MoreServiceItemData(
        id: 'gopay_pinjam',
        title: 'GoPay Pinjam',
        subtitle: 'Pinjaman cepat sampai 25 juta',
        icon: Icons.savings,
        color: Color(0xFF0EA5E9),
      ),
      MoreServiceItemData(
        id: 'gopay_later',
        title: 'GoPayLater',
        subtitle: 'Belanja sekarang, bayarnya nanti',
        icon: Icons.payment,
        color: Color(0xFF22C55E),
      ),
      MoreServiceItemData(
        id: 'coins',
        title: 'GoPay Coins',
        subtitle: 'Kumpulkan dan tukar reward',
        icon: Icons.monetization_on,
        color: Color(0xFFF59E0B),
      ),
    ],
  ),
];

class FoodCardData {
  final String brand;
  final String title;
  final String subtitle;
  final String cta;
  const FoodCardData({
    required this.brand,
    required this.title,
    required this.subtitle,
    required this.cta,
  });
}

const sampleFoodCards = <FoodCardData>[
  FoodCardData(
    brand: 'gofood',
    title: 'Kopi Kenangan, Ruko Tuparev Cirebon',
    subtitle: 'Diskon 35%, maks. 9…',
    cta: 'Buka GoFood',
  ),
  FoodCardData(
    brand: 'gofood',
    title: 'Kopi Kenangan, Ruko …',
    subtitle: 'GRATIS COINS',
    cta: 'Buka GoFood',
  ),
];

// Sample promos
const samplePromos = <PromoItemData>[
  PromoItemData(
    title: 'Diskon 50% GoFood',
    subtitle: 'Pakai kode GOFOODHEMAT',
    color: Color(0xFFDCFCE7),
  ),
  PromoItemData(
    title: 'Cashback 20% GoPay',
    subtitle: 'Minimal transaksi 50rb',
    color: Color(0xFFE0F2FE),
  ),
  PromoItemData(
    title: 'Voucher GoRide 10k',
    subtitle: 'Khusus pengguna setia',
    color: Color(0xFFFFF7ED),
  ),
];

// Sample notifications
final sampleNotifications = <NotificationItemData>[
  NotificationItemData(
    title: 'Promo Spesial',
    message: 'Nikmati promo GoFood hingga 50%!',
    time: DateTime.now().subtract(const Duration(minutes: 32)),
  ),
  NotificationItemData(
    title: 'Saldo GoPay Bertambah',
    message: 'Top up berhasil sebesar Rp50.000',
    time: DateTime.now().subtract(const Duration(hours: 4)),
  ),
  NotificationItemData(
    title: 'Aktivitas Akun',
    message: 'Login baru terdeteksi dari perangkat lain',
    time: DateTime.now().subtract(const Duration(days: 1, hours: 2)),
  ),
];

// Sample users for Halaman Pengguna
const sampleUsers = <AppUser>[
  AppUser(
    id: 'u1',
    name: 'Budi Santoso',
    phone: '+62 812-3456-7890',
    email: 'budi@example.com',
    points: 1240,
    balance: 152000.0,
    level: 'Gold',
  ),
  AppUser(
    id: 'u2',
    name: 'Siti Aminah',
    phone: '+62 811-2222-333',
    email: 'siti@example.com',
    points: 890,
    balance: 98000.0,
    level: 'Silver',
  ),
  AppUser(
    id: 'u3',
    name: 'Andi Wijaya',
    phone: '+62 852-123-4567',
    email: 'andi@example.com',
    points: 420,
    balance: 12000.0,
    level: 'Bronze',
  ),
  AppUser(
    id: 'u4',
    name: 'Dewi Lestari',
    phone: '+62 857-987-6543',
    email: 'dewi@example.com',
    points: 1560,
    balance: 207000.0,
    level: 'Platinum',
  ),
];
