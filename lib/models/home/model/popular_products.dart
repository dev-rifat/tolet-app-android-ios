class PopularProduct {
  List<Products>? products;

  PopularProduct({this.products});

  PopularProduct.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  String? productId;
  String? productName;
  String? productAtrrId;
  String? categoryId;
  Null? images;
  Null? othersImages;
  String? price;
  String? quantity;
  String? expiryDate;
  String? createdAt;
  String? updatedAt;

  Products(
      {this.id,
        this.productId,
        this.productName,
        this.productAtrrId,
        this.categoryId,
        this.images,
        this.othersImages,
        this.price,
        this.quantity,
        this.expiryDate,
        this.createdAt,
        this.updatedAt});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    productName = json['product_name'];
    productAtrrId = json['product_atrr_id'];
    categoryId = json['category_id'];
    images = json['images'];
    othersImages = json['others_images'];
    price = json['price'];
    quantity = json['quantity'];
    expiryDate = json['expiry_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_atrr_id'] = this.productAtrrId;
    data['category_id'] = this.categoryId;
    data['images'] = this.images;
    data['others_images'] = this.othersImages;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['expiry_date'] = this.expiryDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
