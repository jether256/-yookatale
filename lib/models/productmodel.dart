
List<ProductModel> productsFromJson(dynamic str) => List<ProductModel>.from(
    (str).map(
          (x)=>ProductModel.fromJson(x),
    ));



class ProductModel {

  final String id;
  final String name;
  final String category;
  final String description;
  final String subCategory;
  final String images;
  final String price;
  final String createdAt;
  final String updatedAt;
  final String v;
  final String unit;

  ProductModel({required this.id, required this.name, required this.category, required this.description, required this.subCategory, required this.images, required this.price, required this.createdAt, required this.updatedAt, required this.v, required this.unit,});

  factory ProductModel.fromJson(Map<String, dynamic> json){
    return ProductModel(
      id: json['_id'],
      name: json['name'],
      category: json['category'],
      description: json['description'],
      subCategory: json['subCategory'],
      images: json['images'],
      price: json['price'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['v'],
      unit: json['unit'],
    );
  }

  factory ProductModel.fromMap(Map<String, dynamic> json){
    return ProductModel(
      id: json['_id'],
      name: json['name'],
      category: json['category'],
      description: json['description'],
      subCategory: json['subCategory'],
      images: json['images'],
      price: json['price'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['_v'],
      unit: json['unit'],
    );
  }


  Map<String, dynamic> toJson() =>
      {
        "_id": id,
        "name":name,
        "category":category,
        "description":description,
        "subCategory":subCategory,
        "images":images,
        "price": price,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "_v": v,
        "unit": unit,
      };

  Map<String, dynamic> toMap() {
    return {
      "_id": id,
      "name":name,
      "category":category,
      "description":description,
      "subCategory":subCategory,
      "images":images,
      "price": price,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
      "_v": v,
      "unit": unit,
    };
  }

}