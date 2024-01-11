import 'package:flutter/material.dart';

/// Displays detailed information about a SongItem.
class SongItemDetailsView extends StatelessWidget {
  const SongItemDetailsView({super.key});

  static const routeName = '/song_item';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: const Center(
        child: Text('More Information Here'),
      ),
    );
  }
}
