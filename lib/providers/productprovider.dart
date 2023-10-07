
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:yookatale/api/services/services.dart';
import '../models/productmodel.dart';
import '../models/trymodel.dart';

class ProductProvider extends ChangeNotifier{

  ApiCall _service= new ApiCall();

  List<TryModel> _pro=[];
  List<TryModel> get pro => _pro;


  List<ProductModel> _fruit=[];
  List<ProductModel> get fruit => _fruit;

  List<ProductModel> _tubers=[];
  List<ProductModel> get tubers => _tubers;

  List<ProductModel> _veg=[];
  List<ProductModel> get veg => _veg;

  List<ProductModel> _grain=[];
  List<ProductModel> get grain => _grain;

  List<ProductModel> _meat=[];
  List<ProductModel> get meat => _meat;

  List<ProductModel> _fats=[];
  List<ProductModel> get fats => _fats;

  List<ProductModel> _herb=[];
  List<ProductModel> get herb => _herb;

  bool isLoading=false;
  bool isNet=false;


  //get all products
  getPro() async{


    try{
      isLoading=true;
      isNet=false;
      notifyListeners();


      final response =await _service.getProducts();
      _pro=response!;

    }on SocketException catch(_) {

      isLoading=false;
      isNet=true;
      notifyListeners();


    }catch(e){

      isNet=false;
      isLoading=false;
      notifyListeners();

    }



  }

  //get all fruit products
  getFruit() async{


    try{
      isLoading=true;
      isNet=false;
      notifyListeners();


      final response =await _service.getFruits();
      _fruit=response!;

    }on SocketException catch(_) {

      isLoading=false;
      isNet=true;
      notifyListeners();


    }catch(e){

      isNet=false;
      isLoading=false;
      notifyListeners();

    }



  }


  //get all tuber products
  getTuberss() async{


    try{
      isLoading=true;
      isNet=false;
      notifyListeners();


      final response =await _service.getTubers();
      _tubers=response!;

    }on SocketException catch(_) {

      isLoading=false;
      isNet=true;
      notifyListeners();


    }catch(e){

      isNet=false;
      isLoading=false;
      notifyListeners();

    }



  }


  //get all vegetable products
  getVegetable() async{


    try{
      isLoading=true;
      isNet=false;
      notifyListeners();


      final response =await _service.veg();
      _veg=response!;

    }on SocketException catch(_) {

      isLoading=false;
      isNet=true;
      notifyListeners();


    }catch(e){

      isNet=false;
      isLoading=false;
      notifyListeners();

    }



  }

  //get all vegetable products
  getGrains() async{


    try{
      isLoading=true;
      isNet=false;
      notifyListeners();


      final response =await _service.grain();
      _grain=response!;

    }on SocketException catch(_) {

      isLoading=false;
      isNet=true;
      notifyListeners();


    }catch(e){

      isNet=false;
      isLoading=false;
      notifyListeners();

    }



  }

  //get all meats products
  getMeats() async{


    try{
      isLoading=true;
      isNet=false;
      notifyListeners();


      final response =await _service.meats();
      _meat=response!;

    }on SocketException catch(_) {

      isLoading=false;
      isNet=true;
      notifyListeners();


    }catch(e){

      isNet=false;
      isLoading=false;
      notifyListeners();

    }



  }

  //get all fats products
  getFats() async{


    try{
      isLoading=true;
      isNet=false;
      notifyListeners();


      final response =await _service.fats();
      _fats=response!;

    }on SocketException catch(_) {

      isLoading=false;
      isNet=true;
      notifyListeners();


    }catch(e){

      isNet=false;
      isLoading=false;
      notifyListeners();

    }



  }


  //get all herbs products
  getHerbs() async{


    try{
      isLoading=true;
      isNet=false;
      notifyListeners();


      final response =await _service.herbs();
      _herb=response!;

    }on SocketException catch(_) {

      isLoading=false;
      isNet=true;
      notifyListeners();


    }catch(e){

      isNet=false;
      isLoading=false;
      notifyListeners();

    }



  }

}