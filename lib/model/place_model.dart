class Place {
  final String? placeName;
  final String? location;
  final String? image;
  final String? category;
  final String? description;
  final double? price;

  const Place(
      {required this.placeName,
      required this.location,
      required this.image,
      required this.category,
      required this.description,
      required this.price});

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
        placeName: json['placeName'] ?? '',
        location: json['location'] ?? '',
        image: json['image'] ?? '',
        category: json['category'] ?? '',
        description: json['description'] ?? '',
        price: json['price'] ?? 0.0);
  }
}
