
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {

  final String id;
  final String name;
  final String category;
  final String desc;
  final String sub;
  final String image;
  final String price;
  final String created;
  final String update;
  final String v;
  final String unit;

  const ProductDetails({super.key, required this.id, required this.name, required this.category, required this.desc, required this.sub, required this.image, required this.price, required this.created, required this.update, required this.v, required this.unit});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Text('Product Details');
  }
}
