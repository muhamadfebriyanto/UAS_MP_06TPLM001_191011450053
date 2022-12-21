class BeritaModel {
  bool? success;
  Null? message;
  Data? data;

  BeritaModel({this.success, this.message, this.data});

  BeritaModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? link;
  String? image;
  String? description;
  String? title;
  List<Posts>? posts;

  Data({this.link, this.image, this.description, this.title, this.posts});

  Data.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    image = json['image'];
    description = json['description'];
    title = json['title'];
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['link'] = this.link;
    data['image'] = this.image;
    data['description'] = this.description;
    data['title'] = this.title;
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Posts {
  String? link;
  String? title;
  String? pubDate;
  String? description;
  String? thumbnail;

  Posts(
      {this.link, this.title, this.pubDate, this.description, this.thumbnail});

  Posts.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    title = json['title'];
    pubDate = json['pubDate'];
    description = json['description'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['link'] = this.link;
    data['title'] = this.title;
    data['pubDate'] = this.pubDate;
    data['description'] = this.description;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}
