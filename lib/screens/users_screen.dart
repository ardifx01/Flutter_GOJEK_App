import 'package:flutter/material.dart';
import '../core/constants/ui_constants.dart';
import '../data/sample_data.dart';

class UsersScreen extends StatefulWidget {
  static const routeName = '/users';
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final users = sampleUsers
        .where((u) => '${u.name} ${u.phone} ${u.email}'.toLowerCase().contains(_query.toLowerCase()))
        .toList();
    return Scaffold(
      appBar: AppBar(title: const Text('Pengguna')),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(AppInsets.screen),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Cari nama, nomor, email',
                  prefixIcon: const Icon(Icons.search),
                ),
                onChanged: (v) => setState(() => _query = v),
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: AppInsets.screen),
                itemCount: users.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, i) {
                  final u = users[i];
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: Text(u.name[0], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                    title: Text(u.name),
                    subtitle: Text('${u.phone} • ${u.email}'),
                    trailing: Chip(label: Text(u.level)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

