class Category {
  int? id;
  String name;
  double price;

  Category({this.id, required this.name, required this.price});

  factory Category.fromJson(Map<String, dynamic> json) {
    final raw = json['price'];
    final priceValue = raw is num
        ? raw.toDouble()
        : double.tryParse(raw?.toString() ?? '0') ?? 0.0;
    return Category(
      id: json['id'],
      name: json['name'],
      price: priceValue,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'price': price};
  }
}
