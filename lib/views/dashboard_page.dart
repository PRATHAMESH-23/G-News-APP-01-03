import 'package:flutter/material.dart';
import 'package:g_news_app/widgets/nav_drawer.dart';
import 'package:g_news_app/widgets/news_categorylist.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          title: Text("G-News App"),
          actions: [Icon(Icons.search)],
          backgroundColor: theme.colorScheme.primary,
        ),
        body: Column(
          children: [
            NewsCategorylist(),
          ],
        ),
      ),
    );
  }
}
