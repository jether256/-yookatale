
List<TryModel> tryFromJson(dynamic str) => List<TryModel>.from(
    (str).map(
          (x)=>TryModel.fromJson(x),
    ));


//just trying out a model from a different api other than the yokatale api model
class TryModel {

  final String id;
  final String name;
  final String pic;
  final String price;


  TryModel({required this.id, required this.name, required this.pic,required this.price,});

  factory TryModel.fromJson(Map<String, dynamic> json){
    return TryModel(
      id: json['ID'],
      name: json['title'],
      pic: json['image1'],
      price: json['price'],
    );
  }

}