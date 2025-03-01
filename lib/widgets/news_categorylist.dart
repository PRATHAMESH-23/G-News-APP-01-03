import 'package:flutter/material.dart';

class NewsCategorylist extends StatelessWidget {
  NewsCategorylist({super.key});
  final List<String> categories = [
    'General',
    'Business',
    'Technology',
    'Entertainment',
    'Sports',
    'Science',
    'Health',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 12),
      child: SizedBox(
        height: 50.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  print('Selected category: ${categories[index]}');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).colorScheme.secondaryContainer,
                  foregroundColor:
                      Theme.of(context).colorScheme.onSecondaryContainer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Text(categories[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
