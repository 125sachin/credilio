import 'package:credilio/core/models/news_model.dart';
import 'package:credilio/file_exporter.dart';
import 'package:url_launcher/url_launcher.dart';

part 'news_view_model.dart';
part 'news_view_components.dart';

class NewsView extends StatelessWidget {
  final NewsDataModel? newsDataModel;
  const NewsView(this.newsDataModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewsViewModel>.reactive(
      viewModelBuilder: () => NewsViewModel(newsDataModel),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              newsDataModel?.source?.name ?? "News",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(8.0.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 200.h,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        newsDataModel?.urlToImage ??
                            "https://via.placeholder.com/200",
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return FlutterLogo(size: 100.w);
                        },
                      ),
                    ),
                  ),
                  10.verticalSpace,
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      DateFormatter.formatDateTime(newsDataModel!.publishedAt!),
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                  10.verticalSpace,
                  Text(
                    newsDataModel?.title ?? "No Title Available",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                  ),
                  20.verticalSpace,
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        newsDataModel?.description ??
                            "No Description Available",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String? url = newsDataModel?.url;
                      if (url != null &&
                          Uri.tryParse(url)?.hasAbsolutePath == true) {
                        model.goToWebSite(url);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Invalid URL")),
                        );
                      }
                    },
                    child: const Text("GO TO WEBSITE"),
                  ),
                  10.verticalSpace,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
