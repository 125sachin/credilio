part of 'news_view.dart';

class NewsViewModel extends BaseViewModel {
  final NewsDataModel? newsDataModel;
  final log = getLogger('NewsViewModel');

  NewsViewModel(this.newsDataModel);

  void goToWebSite(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      if (!await launchUrl(uri)) {
        log.e('Could not launch URL: $url');
      }
    } catch (e) {
      log.e('Error launching URL: $e');
    }
  }
}
