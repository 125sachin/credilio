part of 'home_view.dart';

class HomeViewModel extends BaseViewModel {
  final log = getLogger('HomeViewModel');

  final NavigationService _navigationService = locator<NavigationService>();
  ApiResponse? _apiResponse;

  List<NewsDataModel>? newsDataModel;

  void init() async {
    await getNews();
  }

  Future<void> getNews() async {
    setBusy(true);
    try {
      _apiResponse = await ApiService.instance.getNews();
      newsDataModel = _apiResponse!.articles ?? [];
      log.i(_apiResponse);
    } catch (e) {
      log.e("Error $e");
    } finally {
      setBusy(false);
      notifyListeners();
    }
  }

  void goToNewsDetailsView(NewsDataModel? newsDataModel) {
    if (newsDataModel == null) {
      log.e("Error");
      return;
    }
    _navigationService.navigateTo(
      Routes.newsView,
      arguments: NewsViewArguments(newsDataModel: newsDataModel),
    );
  }
}
