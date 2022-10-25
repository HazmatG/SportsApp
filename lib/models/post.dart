import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  Post({
    required this.next,
    this.previous,
    required this.count,
    required this.pageSize,
    required this.numPages,
    required this.results,
  });

  int next;
  dynamic previous;
  int count;
  int pageSize;
  int numPages;
  List<Result> results;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        next: json["next"],
        previous: json["previous"],
        count: json["count"],
        pageSize: json["page_size"],
        numPages: json["num_pages"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "next": next,
        "previous": previous,
        "count": count,
        "page_size": pageSize,
        "num_pages": numPages,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.id,
    required this.title,
    required this.price,
    required this.address,
    required this.image,
  });

  int id;
  String title;
  int price;
  String address;
  String image;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        address: json["address"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "address": address,
        "image": image,
      };
}