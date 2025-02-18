part of 'home_view.dart';

class NewsContainer extends ViewModelWidget<HomeViewModel> {
  final NewsDataModel newsDataModel;

  const NewsContainer({
    super.key,
    required this.newsDataModel,
  });

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return GestureDetector(
      onTap: () => viewModel.goToNewsDetailsView(newsDataModel),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.network(
                newsDataModel.urlToImage ?? "https://via.placeholder.com/100",
                height: 80.h,
                width: 100.w,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    FlutterLogo(size: 80.h),
              ),
            ),
            10.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newsDataModel.title ?? "Title",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                  5.verticalSpace,
                  Text(
                    DateFormatter.formatDateTime(newsDataModel.publishedAt!),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
