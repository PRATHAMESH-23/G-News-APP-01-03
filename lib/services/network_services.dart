import 'dart:convert';
import 'package:g_news_app/model/newslist_model.dart';
import 'package:http/http.dart' as http;

String newsApiKey = "4cb845a37afd04f2fc98b3344724a8a4";
String language = "en";
String country = "IN";
int max = 10;
String baseUrl = 'https://gnews.io/api/v4/';

class NetworkService {
  Future<NewsListModel> callNewsApi() async {
    print("In network service");
    final response = await http.get(
      Uri.parse(
          '${baseUrl}top-headlines?category=general&lang=$language&country=$country&max=$max&apikey=$newsApiKey'),
    );

    if (response.statusCode == 200) {
      final newsData = json.decode(response.body);
      print('Decoded news data: $newsData');
      if (newsData.toString().isNotEmpty) {
        return NewsListModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Articles not found in response');
      }
    } else {
      throw Exception('Failed to load news: ${response.statusCode}');
    }
  }
}
