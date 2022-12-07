import 'package:bloc_demo/model/safe_convert.dart';

class NewsModel {
  final String status;
  final int totalResults;
  final List<ArticlesItem>? articles;

  NewsModel({
    this.status = "",
    this.totalResults = 0,
     this.articles,
  });

  factory NewsModel.fromJson(Map<String, dynamic>? json) => NewsModel(
    status: asT<String>(json, 'status'),
    totalResults: asT<int>(json, 'totalResults'),
    articles: asT<List>(json, 'articles').map((e) => ArticlesItem.fromJson(e)).toList(),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'totalResults': totalResults,
    'articles': articles?.map((e) => e.toJson()).toList(),
  };
}

class ArticlesItem {
  final Source source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  ArticlesItem({
    required this.source,
    this.author = "",
    this.title = "",
    this.description = "",
    this.url = "",
    this.urlToImage = "",
    this.publishedAt = "",
    this.content = "",
  });

  factory ArticlesItem.fromJson(Map<String, dynamic>? json) => ArticlesItem(
    source: Source.fromJson(asT<Map<String, dynamic>>(json, 'source')),
    author: asT<String>(json, 'author'),
    title: asT<String>(json, 'title'),
    description: asT<String>(json, 'description'),
    url: asT<String>(json, 'url'),
    urlToImage: asT<String>(json, 'urlToImage'),
    publishedAt: asT<String>(json, 'publishedAt'),
    content: asT<String>(json, 'content'),
  );

  Map<String, dynamic> toJson() => {
    'source': source.toJson(),
    'author': author,
    'title': title,
    'description': description,
    'url': url,
    'urlToImage': urlToImage,
    'publishedAt': publishedAt,
    'content': content,
  };
}

class Source {
  final dynamic id;
  final String name;

  Source({
    this.id,
    this.name = "",
  });

  factory Source.fromJson(Map<String, dynamic>? json) => Source(
    id: asT<dynamic>(json, 'id'),
    name: asT<String>(json, 'name'),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
  };
}

