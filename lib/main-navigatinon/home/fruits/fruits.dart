
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../providers/productprovider.dart';
import '../../product-details/productdetails.dart';

class Fruits extends StatefulWidget {
  const Fruits({super.key});

  @override
  State<Fruits> createState() => _FruitsState();
}

class _FruitsState extends State<Fruits> {


  final _formated= NumberFormat();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      Provider.of<ProductProvider>(context,listen: false).getFruit();

    });

  }



  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      decoration: BoxDecoration(
        //color:Colors.grey[100],
        borderRadius: BorderRadius.circular(4),
      ),
      child:Consumer<ProductProvider>(
        builder: (context,value,child){

          final cats=value.fruit;

          if(value.isLoading){

            return ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {

                return  Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 5),
                  child: Container(
                    width: 120,
                    height: 30,
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
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 5),
                  child: Container(
                    width: 120,
                    height: 30,
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

              return  Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 5),
                child: Container(
                  //width: 120,
                    height: 60,
                    decoration: BoxDecoration(
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
                          children: [
                            CachedNetworkImage(
                              imageUrl:cats[index].images,
                              fit: BoxFit.cover,
                              height: 50,
                              width: 50,
                            ) ,
                            const SizedBox(height: 4,),
                            Text(cats[index].name,maxLines: 2),
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
