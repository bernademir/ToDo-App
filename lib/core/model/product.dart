class Product {
  String productName;
  int money;
  String imageUrl;
  String key;

  Product({this.productName, this.money, this.imageUrl});

  Product.fromJson(Map<String, dynamic> json) {
    productName = json['productName'];
    money = json['money'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productName'] = this.productName;
    data['money'] = this.money;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}

class ProductList {
  List<Product> products = [];
  ProductList.fromJsonList(Map value) {
    value.forEach((key, value) {
      var product = Product.fromJson(value);
      product.key = key;
      products.add(product);
    });
  }
}
