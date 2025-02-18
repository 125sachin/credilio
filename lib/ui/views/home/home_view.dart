import 'package:credilio/core/models/api_response.dart';
import 'package:credilio/core/models/news_model.dart';
import 'package:credilio/file_exporter.dart';

part 'home_view_model.dart';
part 'home_view_components.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (viewModel) => viewModel.init(),
      builder: (context, model, child) {
        return Scaffold(
          body: model.isBusy
              ? Center(child: CircularProgressIndicator.adaptive())
              : SafeArea(
                  child: ListView.builder(
                    itemCount: model.newsDataModel!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return NewsContainer(
                        newsDataModel: model.newsDataModel![index],
                      );
                    },
                  ),
                ),
        );
      },
    );
  }
}
