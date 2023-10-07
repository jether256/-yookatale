
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Fats extends StatefulWidget {
  const Fats({super.key});

  @override
  State<Fats> createState() => _FatsState();
}

class _FatsState extends State<Fats> {

  @override
  void initState() {
    // TODO: implement initState

    getPro();
    super.initState();
  }


  late List published = [];
  Future getPro() async {
    var response=await http.get(Uri.parse('https://eazyrent256.com/api/user/category.php'),
        headers: {"Accept": "headers/json"},
        );

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);


      setState(() {
        published = jsonData;

      });

      print(jsonData);
      return jsonData;
    }
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        builder:(BuildContext context,AsyncSnapshot<dynamic> snapshot){

        return   ListView.builder(
              shrinkWrap: true,
              scrollDirection:Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: published.length,
              itemBuilder:(context,index){

                return Text(published[index]['name']);

              }
          );
        }
    );
  }
}
