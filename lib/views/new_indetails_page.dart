import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewIndetailsPage extends StatelessWidget {
  const NewIndetailsPage(
      {super.key,
      this.appTitle,
      this.image,
      this.title,
      this.desc,
      this.date,
      this.website});

  final String? appTitle;
  final String? image;
  final String? title;
  final String? desc;
  final String? date;
  final String? website;

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(appTitle ?? ''),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.share))],
          backgroundColor: theme.colorScheme.primary,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
          child: Column(
            children: [
              Image.network(
                image ?? '',
                width: double.infinity,
                height: 250.0,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox(
                    width: double.infinity,
                    height: 150.0,
                    child: Center(child: Icon(Icons.error)),
                  );
                },
              ),
              const SizedBox(height: 12.0),
              Text(
                title ?? 'No Title',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(date ?? "No date"),
                  TextButton(
                      onPressed: () {
                        final Uri url = Uri.parse("https://flutter.dev");
                        _launchUrl(url); // Replace with your URL
                      },
                      child: Text("Read More"))
                ],
              ),
              const SizedBox(height: 4.0),
              Text(
                desc ?? 'No Description',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
