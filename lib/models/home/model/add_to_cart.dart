class AddToCartModel {
  final String productId;

  @override
  String toString() {
    return 'AddToCartModel{productId: $productId, productSpecification: $productSpecification, price: $price, qty: $qty, email: $email}';
  }

  final String productSpecification;
  final String price;
  final String qty;
  final String email;

  AddToCartModel(this.productId, this.productSpecification, this.price,
      this.qty, this.email);

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'product_specification': productSpecification,
      'price': price,
      'qty': qty,
      'email': email,
    };
  }
}

class AddToCartApiResponse {
  final String message;

  AddToCartApiResponse(this.message);
  factory AddToCartApiResponse.fromJson(Map<String, dynamic> json) {
    return AddToCartApiResponse(
      json['message'] ?? '',
    );
  }
}
