import 'package:flutter/material.dart';
import 'package:g_news_app/controller/dashboard_page_controller.dart';
import 'package:get/get.dart';

class NewsCategorylist extends StatelessWidget {
  final DashboardPageController controller =
      Get.find<DashboardPageController>();
  NewsCategorylist({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 12),
      child: SizedBox(
        height: 50.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            final category = controller.categories[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Obx(
                () => ElevatedButton(
                  onPressed: () {
                    controller.selectCategory(category);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        controller.selectedCategory.value == category
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.secondaryContainer,
                    foregroundColor: controller.selectedCategory.value ==
                            category
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.onSecondaryContainer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Row(
                    children: [
                      if (controller.selectedCategory.value == category)
                        Icon(
                          Icons.check_circle,
                          color: Colors.white,
                          size: 25,
                        ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(category),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
