import 'package:credilio/core/models/news_model.dart';

class ApiResponse {
  String? status;
  int? totalResults;
  List<NewsDataModel>? articles;

  ApiResponse({this.status, this.totalResults, this.articles});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = <NewsDataModel>[];
      json['articles'].forEach((v) {
        articles!.add(NewsDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['totalResults'] = totalResults;
    if (articles != null) {
      data['articles'] = articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
