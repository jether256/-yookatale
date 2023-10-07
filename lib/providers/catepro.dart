import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:yookatale/api/services/services.dart';

import '../models/procart.dart';

class CategoryProductProvider extends ChangeNotifier{

//    final ApiCall _service=  ApiCall();
//
//   List<CategoryWithProduct> _catPro=[];
//   List<CategoryWithProduct> get catPro=> _catPro;
//
//   bool isLoading=false;
//   bool isNet=false;
//
//
//   getCat() async{
//
//     try{
//
//       isLoading=true;
//       isNet=false;
//       notifyListeners();
//
//       final response =await _service.getCatProducts();
//       _catPro=response!;
//
//       isLoading=false;
//       isNet=false;
//       notifyListeners();
//
//
//    } on SocketException catch(_) {
//       isLoading=false;
//       isNet=true;
//       notifyListeners();
//
//
//     }catch(e){
//
//       isLoading=false;
//       isNet=false;
//       notifyListeners();
//
//
//    }
// }


}
