class FacebookNews {
  String? image;
  String? title;
   
  FacebookNews({this.image, this.title, });
  FacebookNews.fromjson(Map<String, dynamic> json) {
    image = json['urlToImage'];
    title = json['title'];
  }
}
