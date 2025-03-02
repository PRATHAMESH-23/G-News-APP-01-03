import 'package:g_news_app/model/newslist_model.dart';
import 'package:g_news_app/services/network_services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DashboardPageController extends GetxController {
  NewsListModel newsList = NewsListModel();
  RxBool isLoading = false.obs;
  List<Article> articles = <Article>[].obs;
  NetworkService networkService = NetworkService();
  late DateTime date;

  @override
  void onInit() {
    super.onInit();
    getNewsListData(); // Load data when controller is initialized
  }

  Future<void> getNewsListData() async {
    isLoading.value = true; // Set loading to true
    try {
      print("Calling News API");
      NewsListModel fetchedNews = await networkService.callNewsApi();
      articles = fetchedNews.articles!;
    } catch (e) {
      print('Error fetching news: $e');
      Get.snackbar(
        'Error',
        'Failed to fetch news. Please check your internet connection.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false; // Set loading to false
    }
  }

  String formatDateString(DateTime dateTime) {
    try {
      return DateFormat('MMM d, yyyy').format(dateTime);
    } catch (e) {
      print('Error parsing date: $e');
      return 'Invalid Date'; // Or handle the error as needed
    }
  }
}
