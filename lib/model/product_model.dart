

class Products {
  final int? id;
  final String? title;
  final double price;
  final String? description;
  final String? category;
  final String? image;
  final Rating? rating;
  bool isFavorite = false;
  double total = 0;
  int qunity = 1;
  Products({
    this.id = 0,
    this.title = "",
    this.price = 0.0,
    this.description = "",
    this.category = "",
    this.image = "",
    this.rating,
    this.isFavorite = false,
    this.total = 0.0,
    this.qunity = 1,
   // this.icon,
  });

  Products.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        title = json['title'] ?? '',
        price = json['price'].toDouble(),
        description = json['description'] ?? '',
        category = json['category'] ?? '',
        image = json['image'] ?? '',
        isFavorite = json['isFavorite'] ?? false,
        rating = (json['rating'] as Map<String, dynamic>?) != null
            ? Rating.fromJson(json['rating'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'description': description,
        'category': category,
        'image': image,
        'rating': rating?.toJson()
      };
}

class Rating {
  final double? rate;
  final int? count;

  Rating({
    this.rate,
    this.count,
  });

  Rating.fromJson(Map<String, dynamic> json)
      : rate = json['rate'].toDouble(),
        count = json['count'] ?? '';

  Map<String, dynamic> toJson() => {'rate': rate, 'count': count};
}
