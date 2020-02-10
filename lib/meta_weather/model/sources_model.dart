import 'package:equatable/equatable.dart';

class Sources extends Equatable {
  final String title;
  final String slug;
  final String url;
  final int crawlRate;

  @override
  List<Object> get props => [
        title,
        slug,
        url,
        crawlRate,
      ];

  Sources({
    this.title,
    this.slug,
    this.url,
    this.crawlRate,
  });

  static fromJson(Map<String, dynamic> json) {
    var title = json['title'];
    var slug = json['slug'];
    var url = json['url'];
    var crawlRate = json['crawl_rate'];

    return Sources(
      title: title,
      slug: slug,
      url: url,
      crawlRate: crawlRate,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['url'] = this.url;
    data['crawl_rate'] = this.crawlRate;
    return data;
  }
}
