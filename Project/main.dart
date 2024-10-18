import 'dart:convert';
import 'dart:io';

String response = """
{
  "Products":
  [
    {"id":0, "name":"MouseV1", "companyname":"Razor" , "price":56.0, "category":"electronics"  },
    {"id":1, "name":"MouseV1.5", "companyname":"Razor" , "price":564.0, "category":"electronics"  },
    {"id":2,"name":"MouseV2", "companyname":"Razor" , "price":562.0, "category":"electronics"  },
    {"id":3,"name":"MouseV3", "companyname":"Razor" , "price":56.0, "category":"electronics"  },
    {"id":4,"name":"Shirt", "companyname":"AlanSolly" , "price":34.0, "category":"clothes"  },
    {"id":5,"name":"TShirt", "companyname":"AlanSolly" , "price":34.0, "category":"clothes"  }
  ]

}
"""; 

enum itemCategory { electronics, clothing, groceries, others }

class Product{
  int? id;
  String? name;
  String? companyName;
  double? price;
  itemCategory? category;

  Product({
    this.id,
    this.name,
    this.companyName,
    this.price,
    this.category
  });

  // Fixed field name for companyName and category matching
  factory Product.fromJson(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      companyName: map['companyname'], // Fixed the case to match the key
      price: map['price'],
      category: itemCategory.values.firstWhere(
          (e) => e.toString().split('.').last.toLowerCase() == map['category'].toLowerCase(),
          orElse: () => itemCategory.others), // Handle default case
    );
  }

}


class User {
  static int _idCounter = 0;

  int? id;
  String? username;
  String? password;

  User({
    this.username,
    this.password
  }) { 
    this.id = _idCounter;
    _idCounter++;
  }
}


class UserDetails extends User{
  String? address;
  int? age;
  String? phoneNumber;

  // Updated to use `this` directly in constructor
  UserDetails(String username, String password, this.address, this.age, this.phoneNumber) 
    : super(username: username, password: password);
}

double CalculateOrderPrice(List<Product> products) {
  double total = 0;
  for (var a in products) {
    total += a.price ?? 0;
  }
  return total;
}

class Order {
  static int _idCounter = 1;

  int? orderId;
  List<Product> products = [];
  late DateTime createdDateTime;
  User? user;
  double? totalPrice;

  void createOrder(List<Product> products, User user) {
    this.orderId = _idCounter;
    _idCounter++; // Increment static order id
    this.products = products;
    this.createdDateTime = DateTime.now();
    this.totalPrice = CalculateOrderPrice(products);
    this.user = user;
  }
}


void main() {
  dynamic res = jsonDecode(response);

  List<Product> productList = [];
  for (var a in res["Products"]) {
    productList.add(Product.fromJson(a));
  }

  print("Welcome To our shop !! ");
  print("products:");
  for (var a in productList) {
    print("id: ${a.id} | name: ${a.name} | price: ${a.price} | category: ${a.category} ");
  }

  UserDetails u1 = UserDetails("sameer", "password", "pune", 21, "1234567890");

  stdout.write("Enter Products (id) you want to buy (comma separated): ");
  String? cart = stdin.readLineSync();
  print(cart);


  List<int> selectedIds = cart?.split(',').map((e) => int.parse(e.trim())).toList() ?? [];

  List<Product> selectedProducts = productList.where((product) => selectedIds.contains(product.id)).toList();

 

  Order o1 = Order();
  o1.createOrder(selectedProducts, u1);

  print("User: ${o1.user?.username}");
  print("\nTotal Bill:  ${o1.totalPrice}");

  print("\nOrdered Products:");
  for (var p in selectedProducts) {
    print("id: ${p.id} | name: ${p.name} | price: ${p.price}");
  }
}
