
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../api/url.dart';
import '../../constants/color.dart';
import '../../providers/catepro.dart';
import '../../providers/productprovider.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {


  final _formated= NumberFormat();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      Provider.of<ProductProvider>(context,listen: false).getPro();

    });

  }

  @override
  Widget build(BuildContext context) {


    return Container(
      width: MediaQuery.of(context).size.width,
      height: 207,
      decoration: BoxDecoration(
        //color:Colors.grey[100],
        borderRadius: BorderRadius.circular(4),
      ),
      child:Consumer<ProductProvider>(
        builder: (context,value,child){

          final cats=value.pro;

          if(value.isLoading){

            return ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {

                return  Padding(
                  padding: const EdgeInsets.only(left: 3.0,right: 3.0,top: 5,bottom: 3.0),
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),

                        color:Colors.grey.shade300
                    ),
                    child:Image.asset('assets/images/hug.gif',height:20,width: 90,) ,
                  ),
                );


              },);

          }else if(value.isNet){

            return ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {

                return  Padding(
                  padding: const EdgeInsets.only(left: 3.0,right: 3.0,top: 5,bottom: 3.0),
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),

                        color:Colors.grey.shade300
                    ),
                    child:Image.asset('assets/images/lost2.gif',height:20,width: 90,fit: BoxFit.cover,) ,
                  ),
                );


              },);

          }

          return  ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:cats.length,
            itemBuilder: (BuildContext context, int index) {

              var _price=int.parse(cats[index].price);
              String price=_formated.format(_price);

              return  Padding(
                padding: const EdgeInsets.only(left: 3.0,right: 3.0,top: 5,bottom: 3.0),
                child: Container(
                  width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color:conBack ,
                      borderRadius: BorderRadius.circular(4),

                      // color:Colors.white10
                    ),
                    child:InkWell(
                      onTap: (){


                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => Categorydeatils(
                        //         ID:cats[index].ID,NAME:cats[index].Nem,PIC:cats[index].Im,
                        //       ),
                        //     )
                        // );

                      },
                      child: Container(
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top:4.0,left:4.0,right: 4.0),
                              child: CachedNetworkImage(
                                //use the url from the  model this one was used for testing
                                imageUrl:'${BaseUrl.categoryImageUrl}${cats[index].pic}',
                                fit: BoxFit.cover,
                                height: 100,
                                width: 120,
                              ),
                            ) ,
                            const SizedBox(height: 2,),
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text(cats[index].name,maxLines: 1,style: const TextStyle( overflow: TextOverflow.ellipsis,fontWeight: FontWeight.bold,color: buttonColor),),
                            ),
                            const SizedBox(height: 2,),
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text('\Shs $price',maxLines: 1),
                            ),
                            const SizedBox(height: 2,),
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child:MaterialButton(

                                color: buttonColor,
                                onPressed: () {


                                  //add to cart function
                                },
                                child: const Text('Add to cart',style: TextStyle(color: Colors.white),),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              );


            },);

        },
      ),
    );
  }
}
