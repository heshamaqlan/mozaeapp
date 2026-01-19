class Customer {
  int? id;
  String name;
  String phone;
  String address;
  String note;

  Customer({
    this.id,
    required this.name,
    required this.phone,
    required this.address,
    required this.note,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
      name: json['name'],
      phone: json['phone']?.toString() ?? '',
      address: json['address'],
      note: json['note'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'address': address,
      'note': note,
    };
  }
}
