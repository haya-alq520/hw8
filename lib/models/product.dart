class Product {
  int? id;
  String? title;
  double? rating;
  List<String>? tags;
  String? thumbnail;

  Product({this.id, this.title, this.rating, this.tags, this.thumbnail});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(id: json["id"], title: json ["title"], rating: json ["rating"], tags: json["tage"] , thumbnail: json["thumbnail"]);

  }
}