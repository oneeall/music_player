import 'package:flutter/material.dart';

class HomePlayerPage extends StatelessWidget {
  const HomePlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Player'),
      ),
      body: const Center(
        child: Text('helo'),
      ),
    );
  }
}
