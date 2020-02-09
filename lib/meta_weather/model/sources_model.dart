class Sources {
  String title;
  String slug;
  String url;
  int crawlRate;

  Sources({this.title, this.slug, this.url, this.crawlRate});

  Sources.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    slug = json['slug'];
    url = json['url'];
    crawlRate = json['crawl_rate'];
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
