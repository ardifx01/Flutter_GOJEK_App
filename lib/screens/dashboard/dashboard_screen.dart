import 'package:flutter/material.dart';
import '../../core/constants/ui_constants.dart';
import '../../data/sample_data.dart';
import '../../widgets/feature_item.dart';
import '../../widgets/more_services_sheet.dart';
import '../../widgets/promo_card.dart';
import '../../widgets/section_header.dart';
import '../../widgets/search_header.dart';
import '../../widgets/hero_banner.dart';
import '../../widgets/wallet_card.dart';
import '../../widgets/food_reco_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(pinned: true, toolbarHeight: 0.1),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(AppInsets.screen),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SearchHeader(),
                const HeroBanner(),
                const SizedBox(height: AppSpacing.md),
                const WalletCard(balance: 'Rp68.610', coins: '50 coins'),

                const SizedBox(height: AppSpacing.lg),

                const SectionHeader(title: 'Layanan'),

                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: AppSpacing.xxl,
                    mainAxisSpacing: AppSpacing.xxl,
                    childAspectRatio: 0.75,
                    mainAxisExtent: 90,
                  ),
                  itemCount: sampleFeatures.length,
                  itemBuilder: (context, i) {
                    final data = sampleFeatures[i];
                    return Container(
                      alignment: Alignment.center,
                      child: FeatureItem(
                        data: data,
                        onTap: () {
                          if (data.id == 'more') {
                            showMoreServicesSheet(context);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Halaman ${data.title} belum tersedia',
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    );
                  },
                  scrollDirection: Axis.vertical,
                ),

                const SizedBox(height: AppSpacing.lg),
                const SectionHeader(title: 'Promo untuk kamu'),
                SizedBox(
                  height: 110,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: samplePromos.length,
                    itemBuilder: (context, i) =>
                        PromoCard(promo: samplePromos[i]),
                  ),
                ),

                const SizedBox(height: AppSpacing.xl),
                const SectionHeader(title: 'Lebih cepet buat book lagi'),
                SizedBox(
                  height: 130,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: sampleFoodCards.length,
                    itemBuilder: (context, i) =>
                        FoodRecoCard(data: sampleFoodCards[i]),
                  ),
                ),

                const SizedBox(height: AppSpacing.xl),
                const SectionHeader(title: 'Aktivitas Terbaru'),
                ...[
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withValues(alpha: .1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.receipt_long,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    title: const Text('Pembayaran GoFood'),
                    subtitle: const Text('Nasi goreng + es teh'),
                    trailing: const Text('- Rp35.000'),
                  ),
                  const Divider(),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: Colors.orange.withValues(alpha: .12),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.local_taxi, color: Colors.orange),
                    ),
                    title: const Text('GoRide ke kantor'),
                    subtitle: const Text('Jarak 5.2 km'),
                    trailing: const Text('- Rp14.000'),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
