//
// List<CategoryWithProduct> categoryProFromJson(dynamic str) => List<CategoryWithProduct>.from(
//     (str).map(
//           (x)=>CategoryWithProduct.fromJson(x),
//     ));
//
//
//
// class CategoryWithProduct {
//   final String category;
//   final List<ProductModels> product;
//
//   CategoryWithProduct(
//       {required this.category,required this.product});
//
//   factory CategoryWithProduct.fromJson(Map<String, dynamic> data) {
//     var list = data['product'] as List;
//     List<ProductModels> listProduct =
//     list.map((e) => ProductModels.fromJson(e)).toList();
//     return CategoryWithProduct(
//         category: data['category'],
//         product: listProduct);
//   }
// }
//
// class ProductModels {
//
//   final String id;
//   final String name;
//   final String category;
//   final String description;
//   final String subCategory;
//   final String images;
//   final String price;
//   final String createdAt;
//   final String updatedAt;
//   final String v;
//   final String unit;
//
//   ProductModels({required this.id, required this.name, required this.category, required this.description, required this.subCategory, required this.images, required this.price, required this.createdAt, required this.updatedAt, required this.v, required this.unit,});
//
//   factory ProductModels.fromJson(Map<String, dynamic> json){
//     return ProductModels(
//       id: json['_id'],
//       name: json['name'],
//       category: json['category'],
//       description: json['description'],
//       subCategory: json['subCategory'],
//       images: json['images'],
//       price: json['price'],
//       createdAt: json['createdAt'],
//       updatedAt: json['updatedAt'],
//       v: json['v'],
//       unit: json['unit'],
//     );
//   }
