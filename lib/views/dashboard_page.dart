import 'package:flutter/material.dart';
import 'package:g_news_app/controller/dashboard_page_controller.dart';
import 'package:g_news_app/views/new_indetails_page.dart';
import 'package:g_news_app/widgets/nav_drawer.dart';
import 'package:g_news_app/widgets/news_categorylist.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  final DashboardPageController controller = Get.put(DashboardPageController());
  DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
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
                return const Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Please wait..",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CircularProgressIndicator(),
                  ],
                ));
              } else if (controller.articles.isEmpty) {
                return const Center(
                    child: Text(
                  'No news available.',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ));
              } else {
                // // final newsListModel =
                // //     controller.newsList.first; // Get the NewsListModel
                // final articles = controller.articles;
                return ListView.builder(
                  itemCount: controller.articles.length,
                  itemBuilder: (context, index) {
                    final article = controller.articles[index];
                    controller.date = article.publishedAt!;
                    return InkWell(
                      onTap: () {
                        Get.to(() => NewIndetailsPage(
                              appTitle: article.source!.name ?? "No Source",
                              image: article.image ?? "",
                              title: article.title,
                              desc: article.description,
                              date:
                                  controller.formatDateString(controller.date),
                              website: article.url,
                            ));
                      },
                      child: Card(
                        margin: const EdgeInsets.all(12.0),
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
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 16.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    article.source!.name ?? "No Source",
                                    style: TextStyle(color: theme.primaryColor),
                                  ),
                                  Text(controller
                                      .formatDateString(controller.date))
                                ],
                              )
                            ],
                          ),
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
    );
  }
}
