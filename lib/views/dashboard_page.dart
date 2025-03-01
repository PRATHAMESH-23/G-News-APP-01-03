import 'package:flutter/material.dart';
import 'package:g_news_app/controller/dashboard_page_controller.dart';
import 'package:g_news_app/widgets/nav_drawer.dart';
import 'package:g_news_app/widgets/news_categorylist.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  final DashboardPageController controller = Get.put(DashboardPageController());
  DashboardPage({super.key});

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
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else if (controller.articles.isEmpty) {
                  return const Center(child: Text('No news available.'));
                } else {
                  // // final newsListModel =
                  // //     controller.newsList.first; // Get the NewsListModel
                  // final articles = controller.articles;
                  return ListView.builder(
                    itemCount: controller.articles.length,
                    itemBuilder: (context, index) {
                      final article = controller.articles[index];
                      return Card(
                        margin: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                article.image ?? '',
                                width: double.infinity,
                                height: 150.0,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const SizedBox(
                                    width: double.infinity,
                                    height: 150.0,
                                    child: Center(child: Icon(Icons.error)),
                                  );
                                },
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                article.title ?? 'No Title',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                article.description ?? 'No Description',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                article.publishedAt?.toIso8601String() ??
                                    'Unknown Date',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
