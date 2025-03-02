import 'package:flutter/material.dart';

class ReadingHistoryPage extends StatelessWidget {
  const ReadingHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        title: Text("Reading History"),
        actions: [Icon(Icons.delete)],
      ),
    );
  }
}
