
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:yookatale/constants/color.dart';

import '../../api/url.dart';
import '../../providers/productprovider.dart';

class CategoryMore extends StatefulWidget {

  const CategoryMore({super.key});

  @override
  State<CategoryMore> createState() => _CategoryMoreState();
}

class _CategoryMoreState extends State<CategoryMore> {



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
    return  Scaffold(
      backgroundColor:backgroundColor,
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration:   BoxDecoration(
            color:buttonColor.withOpacity(0.9),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        title:const Text('Categories ',maxLines: 1,overflow:TextOverflow.ellipsis,style: TextStyle(color: Colors.white)),
      ),
      body:Padding(
        padding: const EdgeInsets.only(top: 8.0,left: 8.0,right: 8.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Consumer<ProductProvider>(
            builder: (context,value,child){

              final pros=value.pro;

              if(value.isLoading){

                return GridView.builder(
                    gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:2,
                      childAspectRatio: 1/1,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder:(context,index){

                      return Container(
                        decoration: BoxDecoration(
                            color:Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(4)
                        ),
                        child:Image.asset('assets/images/hug.gif'),
                      );



                    }
                );

              }
              //
              // else if(value.noNet){
              //
              //   return GridView.builder(
              //       gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount:2,
              //         childAspectRatio: 1/1,
              //         crossAxisSpacing: 20,
              //         mainAxisSpacing: 10,
              //       ),
              //       itemBuilder:(context,index){
              //
              //         return Container(
              //           decoration: BoxDecoration(
              //               color:themeProvider.isDarkMode ? Colors.grey.shade500: Colors.grey.shade300,
              //               borderRadius: BorderRadius.circular(4)
              //           ),
              //           child:Image.asset('assets/images/disconnected.png',fit:BoxFit.cover,),
              //         );
              //
              //
              //
              //       }
              //   );
              // }

              else{




                return GridView.builder(
                    itemCount: pros.length,
                    gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:2,
                      childAspectRatio: 1/1,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder:(context,index){

                      var s_price=int.parse(pros[index].price);
                      String sprice=_formated.format(s_price);

                      return InkWell(
                        onTap: (){

                          // Navigator.push(context,MaterialPageRoute(builder:(context) => ProductDetails(
                          //   id:pros[index].id,nem:pros[index].nem,regp:pros[index].regp,selp:pros[index].selp,catid:pros[index].catid,disr:pros[index].disr,ratin:pros[index].ratin,
                          //   im1:pros[index].im1,im2:pros[index].im2,im3:pros[index].im3,manid:pros[index].manid,storeid:pros[index].storeid,ava:pros[index].ava,desc:pros[index].desc,
                          //   promoid:pros[index].promoid, create:pros[index].create,subid:pros[index].subid,modoid:pros[index].modoid,fe:pros[index].fe,retun:pros[index].retun,
                          //   psdec:pros[index].psdec,end:pros[index].end,
                          // )));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color:Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(4)
                          ),
                          child:Stack(
                            children: [
                              CachedNetworkImage(
                                //use the url from the  model this one was used for testing
                                imageUrl:'${BaseUrl.categoryImageUrl}${pros[index].pic}',
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              ),

                                Positioned(
                            top: 0,
                            left: 0,
                            child: IconButton(icon:const Icon(CupertinoIcons.heart_fill,color:Colors.red),
                              onPressed: () {


                              },
                            ),
                          ),


                              Positioned(
                                top: 0,
                                right: 0,
                                child: IconButton(icon:const Icon(CupertinoIcons.shopping_cart,color:Colors.black,),
                                  onPressed: () {



                                  },
                                ),
                              ),


                              Positioned(
                                bottom: 43,
                                left:2,
                                child:  Text('Shs ${sprice}',maxLines:2,overflow:TextOverflow.ellipsis,textAlign: TextAlign.start,style: const TextStyle(color:Colors.black,fontSize: 17,fontWeight: FontWeight.bold
                                ),),
                              ),

                              Positioned(
                                bottom: 2,
                                left: 2,
                                right: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 2.0,bottom: 2,top: 2),
                                  child: Text(pros[index].name,maxLines:2,overflow:TextOverflow.ellipsis,textAlign: TextAlign.start,style: const TextStyle(fontSize:14 ),),
                                ),
                              ),

                            ],
                          ),
                        ),
                      );



                    }
                );
              }


            },
          ),
        ),
      ),

    );
  }
}
