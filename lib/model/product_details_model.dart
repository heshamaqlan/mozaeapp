class ProductDetails {
  int? id;
  int categoryId;
  int customerId;
  int quantity;
  String orderDate;
  double paid;
  double remaining;
  String note;


  String? categoryName;
  String? customerName;

  ProductDetails({
    this.id,
    required this.categoryId,
    required this.customerId,
    required this.quantity,
    required this.orderDate,
    required this.paid,
    required this.remaining,
    required this.note,
   
    this.categoryName,
    this.customerName,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) {
    return ProductDetails(
      id: json['id'],
      categoryId: json['category_id'],
      customerId: json['customer_id'],
      quantity: json['quantity'],
      orderDate: json['order_date'],
      paid: json['paid'],
      remaining: json['remaining'],
      note: json['note'],
      
      categoryName: json['category_name'], 
      customerName: json['customer_name'], 
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category_id': categoryId,
      'customer_id': customerId,
      'quantity': quantity,
      'order_date': orderDate,
      'paid': paid,
      'remaining': remaining,
      'note': note,
    };
    
  }
}
