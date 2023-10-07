
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../models/procart.dart';
import '../../models/productmodel.dart';
import '../../models/trymodel.dart';
import '../url.dart';

class ApiCall{


///get categories with products
// Future<List<CategoryWithProduct>? > getCatProducts() async{
//
//
//   var response = await http.get(
//       Uri.parse(BaseUrl.getCategoryProduct),
//       headers: {"Accept": "headers/json"});
//
//
//   if (response.statusCode == 200) {
//
//     return categoryProFromJson(
//         json.decode(response.body)
//     );
//
//   } else {
//
//     return null;
//
//   }
//
//
// }



///get products
  ///trying out a different api from another web project and it fetches data perfectly
  Future<List<TryModel>?> getProducts() async{

  // Map<String, String> requestHeaders =
  // {'Content-type': 'application/json',
  //   'Accept': 'application/json',};

  var response =await http.get(
    Uri.parse("https://eazyrent256.com/api/user/catalpro.php"),
      headers: {
          "Accept": "application/json",
              }
  );

  if (response.statusCode == 200) {

    return tryFromJson(
        json.decode(response.body)
    );

  } else {

    return null;

  }


}



///get Fruit products
  ///the url passed below works in a webrowser and postman but doesnot get data in te flutter app
Future<List<ProductModel>?> getFruits() async{

    //the url passed below works in a webrowser and postman but doesnot get data in te flutter app
  var response =await http.get(
      Uri.parse("https://yookatale-server.onrender.com/api/products/fruits"),
      headers: {
        "Accept":"headers/json",

      }
  );

  if (response.statusCode == 200) {

    return productsFromJson(
        json.decode(response.body)
    );


  } else {

    return null;

  }


}


///get Tubers products
Future<List<ProductModel>?> getTubers() async{

  var response =await http.get(
      Uri.parse(BaseUrl.getProductRootTubers),
      headers: {"Accept":"headers/json"}
  );

  if (response.statusCode == 200) {

    return productsFromJson(
        json.decode(response.body)
    );

  } else {

    return null;

  }


}


///get vegetable products
Future<List<ProductModel>?> veg() async{

  var response =await http.get(
      Uri.parse(BaseUrl.getProductVegatables),
      headers: {"Accept":"headers/json"}
  );

  if (response.statusCode == 200) {

    return productsFromJson(
        json.decode(response.body)
    );

  } else {

    return null;

  }


}


///get grain products
Future<List<ProductModel>?> grain() async{

  var response =await http.get(
      Uri.parse(BaseUrl.getProductGrains),
      headers: {"Accept":"headers/json"}
  );

  if (response.statusCode == 200) {

    return productsFromJson(
        json.decode(response.body)
    );

  } else {

    return null;

  }


}


///get meats products
Future<List<ProductModel>?> meats() async{

  var response =await http.get(
      Uri.parse(BaseUrl.getProductMeats),
      headers: {"Accept":"headers/json"}
  );

  if (response.statusCode == 200) {

    return productsFromJson(
        json.decode(response.body)
    );

  } else {

    return null;

  }


}


///get fats products
Future<List<ProductModel>?> fats() async{

  var response =await http.get(
      Uri.parse(BaseUrl.getProductFats),
      headers: {"Accept":"headers/json"}
  );

  if (response.statusCode == 200) {

    return productsFromJson(
        json.decode(response.body)
    );

  } else {

    return null;

  }


}


///get herbs products
Future<List<ProductModel>?> herbs() async{

  var response =await http.get(
      Uri.parse(BaseUrl.getProductHerbs),
      headers: {"Accept":"headers/json"}
  );

  if (response.statusCode == 200) {

    return productsFromJson(
        json.decode(response.body)
    );

  } else {

    return null;

  }


}


}

