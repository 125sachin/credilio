part of 'news_view.dart';

class NewsContainer extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String date;
  const NewsContainer({
    super.key,
    required this.title,
    required this.date,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          SizedBox(
            height: 80,
            width: 100,
            child: Image.network(
              imageUrl,
              errorBuilder: (context, error, stackTrace) => FlutterLogo(),
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // color: Colors.red,
                  padding: EdgeInsets.all(5),
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    // color: Colors.red,
                    padding: EdgeInsets.all(10),
                    child: Text(date, overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
