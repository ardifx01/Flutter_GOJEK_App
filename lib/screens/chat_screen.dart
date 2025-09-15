import 'package:flutter/material.dart';
import '../core/constants/ui_constants.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: ListView.separated(
        padding: const EdgeInsets.all(AppInsets.screen),
        itemBuilder: (context, i) => ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Text('U${i+1}', style: const TextStyle(color: Colors.white, fontSize: 12)),
          ),
          title: Text('CS GoFood #${i + 1}'),
          subtitle: const Text('Halo, ada yang bisa kami bantu?'),
          trailing: const Text('Baru'),
        ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: 8,
      ),
    );
  }
}

