
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:yookatale/main-navigatinon/home/tubers/tubers.dart';
import 'package:yookatale/main-navigatinon/home/tubers/tubersmore.dart';
import 'package:yookatale/main-navigatinon/home/vegetables/vegmore.dart';

import '../../constants/color.dart';
import '../../login-signupscreens/login/login.dart';
import '../cart/cart.dart';
import '../categories/categorymore.dart';
import '../categories/cotegories.dart';
import '../premium/premium.dart';
import 'fats/fatsmore.dart';
import 'fruits/fruits.dart';
import 'fruits/fruitsmore.dart';
import 'grains/grainsmore.dart';
import 'herbs/herbsmore.dart';
import 'meats/moremeats.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        leading:Padding(
          padding: const EdgeInsets.all(2.0),
          child: Image.asset('assets/images/loo.png',height: 50,width: 50,),
        ) ,
        actions: [
          IconButton(
              onPressed: () {

                //Navigator.pushReplacementNamed(context,LoginScreen.id);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const LoginScreen())));


              },
              icon: const Icon(Icons.login,color: buttonColor,)),
          IconButton(
              onPressed: () {

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const Cart())));

              },
              icon:const Badge(
                label:Text('0',style: TextStyle(color: Colors.white,fontSize: 10),),
                child: Icon(Icons.notifications,color: buttonColor,),
              )
          ),
        ],
        flexibleSpace:Container(
          decoration:const BoxDecoration(
            // color: Colors.black.withOpacity(0.2),
              image:DecorationImage(
                image: AssetImage("assets/images/veg.png"),
                fit: BoxFit.cover,
              )
          ),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [backgroundColor.withOpacity(0.9),backgroundColor.withOpacity(0.8)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
            ),
          ),
        ),
        title: const Center(child: Text("Yookatale",style:TextStyle(color:buttonColor),)),
        bottom:  PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child:Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Column(
              children: [
                Row(
                  children: [

                    Expanded(
                      child:InkWell(
                        onTap: () {


                        },
                        child: Container(
                          child:TextField(
                            enabled: false,
                            decoration: InputDecoration(
                              hintText: 'Search a product',
                              prefixIcon: const Icon(Icons.search,color:Colors.grey ,),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.zero,
                              filled: true,
                              fillColor:Colors.grey.shade200,
                            ),

                          ),
                        ),
                      ),
                    ),

                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const Cart())));
                        },
                        icon:const Badge(
                          label:Text('0',style: TextStyle(color: Colors.white,fontSize: 10),),
                          child: Icon(Icons.shopping_cart,color: buttonColor,),
                        )
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  height: 20,
                  width: MediaQuery.of(context).size.width,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      Row(
                        children: [
                          Icon(Icons.info_outline,size:12,color:buttonColor),
                          Text('100 % Fresh',style: TextStyle(color:buttonColor,fontSize:12 ),)
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.work,size:12,color:buttonColor),
                          Text('24-7 delivery',style: TextStyle(color: buttonColor,fontSize:12 ),)
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.production_quantity_limits,size:12,color:buttonColor),
                          Text('Trusted suppliers',style: TextStyle(color:buttonColor,fontSize:12 ),)
                        ],
                      ),
                    ],
                  ),

                ),
              ],
            ),
          ) ,
        ),

      ),
      body:ListView(
        padding: const EdgeInsets.only(left: 8,top: 10,right: 10,bottom: 10),
        children: [

          const SizedBox(height: 10,),
          
          const Text('Hi,Welcome to Yookatale',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

          const SizedBox(height: 10,),

          Container(
            width: MediaQuery.of(context).size.width,
            height: 180,
            decoration:  const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(40),bottomRight: Radius.circular(70)),
                gradient: LinearGradient(
                  colors: [buttonColor,Colors.blue],
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,

                ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10,right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const Text('Forget about going \n to the the market, \n get a Premium  \n access to your Home \n digital  mobile \n food market',style: TextStyle(color:backgroundColor,fontSize: 12),),

                        // const SizedBox(height: 10,),

                        MaterialButton(
                          color:backgroundColor,
                          child: const Text('Go Premium',style: TextStyle(color: buttonColor),),
                          onPressed: (){


                            //route to premium
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>const Premium()));
                          },
                        )
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 30,),


                Image.asset('assets/images/back.png',width: 140,),
              ],
            ),

          ),

          const SizedBox(height: 10,),

          Container(
            decoration: BoxDecoration(
                color:Colors.grey[100],
                borderRadius: BorderRadius.circular(8)
            ),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text('Fruit Products',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: InkWell(

                            onTap: (){


                              //route to fruits more


                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => const CategoryMore())));


                            },
                            child: const Text('view more',style: TextStyle(fontSize: 17,color: buttonColor),)
                        ),
                      ),
                    ],
                  ),
                ),
                //const ActionCategory(),
                const Categories(),
              ],
            ),
          ),
          const SizedBox(height: 10,),
          //fruits widget

          // replicate this for the remaining items which include rootubers,vegetables,grains,meats,fats and herbs.
          //use their apis to extract the needed data
          Container(
            decoration: BoxDecoration(
                color:Colors.grey[100],
                borderRadius: BorderRadius.circular(8)
            ),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text('Fruit Products',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: InkWell(

                            onTap: (){


                              //route to fruits more


                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => const FruitsMore())));


                            },
                            child: const Text('view more',style: TextStyle(fontSize: 17,color: buttonColor),)
                        ),
                      ),
                    ],
                  ),
                ),
                //const ActionCategory(),
                const Fruits(),
              ],
            ),
          ),

          const SizedBox(height: 10,),

          //root tubers widget
          Container(
            decoration: BoxDecoration(
                color:Colors.grey[100],
                borderRadius: BorderRadius.circular(8)
            ),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text('RootTubers Products',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: InkWell(
                            onTap: (){

                              //route to tubers more page

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => const TubersMore())));

                            },


                            child: const Text('view more',style: TextStyle(fontSize: 17,color: buttonColor),)
                        ),
                      ),
                    ],
                  ),
                ),

                //remove comment after working on the tubers widget
                //const Tubers(),
              ],
            ),
          ),

          const SizedBox(height: 10,),

          //vegetable widget
          Container(
            decoration: BoxDecoration(
                color:Colors.grey[100],
                borderRadius: BorderRadius.circular(8)
            ),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text('Vegetables Products',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: InkWell(
                            onTap: (){

                              //route to vegetable more page

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => const VegetablesMore())));

                            },


                            child: const Text('view more',style: TextStyle(fontSize: 17,color: buttonColor),)
                        ),
                      ),
                    ],
                  ),
                ),

                //remove comment after working on the vegetable widget
                //const Vegetables(),
              ],
            ),
          ),

          const SizedBox(height: 10,),
          //grains widget
          Container(
            decoration: BoxDecoration(
                color:Colors.grey[100],
                borderRadius: BorderRadius.circular(8)
            ),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text('Grains and Flour Products',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: InkWell(
                            onTap: (){

                              //route to grains more page

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => const GrainsMore())));

                            },


                            child: const Text('view more',style: TextStyle(fontSize: 17,color: buttonColor),)
                        ),
                      ),
                    ],
                  ),
                ),

                //remove comment after working on the grains widget
                //const Grains(),
              ],
            ),
          ),

          const SizedBox(height: 10,),
          //meats widget
          Container(
            decoration: BoxDecoration(
                color:Colors.grey[100],
                borderRadius: BorderRadius.circular(8)
            ),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text('Meats Products',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: InkWell(
                            onTap: (){

                              //route to meat more page

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => const MoreMeaat())));

                            },


                            child: const Text('view more',style: TextStyle(fontSize: 17,color: buttonColor),)
                        ),
                      ),
                    ],
                  ),
                ),

                //remove comment after working on the meats widget
                //const Meats(),
              ],
            ),
          ),
          const SizedBox(height: 10,),

          //fats widget
          Container(
            decoration: BoxDecoration(
                color:Colors.grey[100],
                borderRadius: BorderRadius.circular(8)
            ),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text('Fats and Oils Products',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: InkWell(
                            onTap: (){

                              //route to fats more page

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => const FatsMore())));

                            },


                            child: const Text('view more',style: TextStyle(fontSize: 17,color: buttonColor),)
                        ),
                      ),
                    ],
                  ),
                ),

                //remove comment after working on the fats widget
                //const Fats(),
              ],
            ),
          ),

          const SizedBox(height: 10,),
          //herbs widget
          Container(
            decoration: BoxDecoration(
                color:Colors.grey[100],
                borderRadius: BorderRadius.circular(8)
            ),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text('Herbs and Spices Products',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: InkWell(
                            onTap: (){

                              //route to herbs more page

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => const HerbsMore())));

                            },


                            child: const Text('view more',style: TextStyle(fontSize: 17,color: buttonColor),)
                        ),
                      ),
                    ],
                  ),
                ),

                //remove comment after working on the herbs widget
                //const Herbs(),
              ],
            ),
          ),

          const SizedBox(height: 10,),




          Container(
            decoration: BoxDecoration(
                color:Colors.grey[100],
                borderRadius: BorderRadius.circular(8)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text('Fruit Products',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: InkWell(
                          onTap: (){

                          },
                            child: const Text('view more',style: TextStyle(fontSize: 17),)
                        ),
                      ),
                    ],
                  ),
                ),
                //const ActionCategory(),
                Fruits(),
              ],
            ),
          ),

          const SizedBox(height: 10,),

          //fruits list
          Container(
            decoration: BoxDecoration(
                color:Colors.grey[100],
                borderRadius: BorderRadius.circular(8)
            ),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      const Text('Fruitssss Products',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: buttonColor),),

                      InkWell(
                          onTap: (){

                            //view more of the fruits

                           // Navigator.push(context,MaterialPageRoute(builder:(context) => const Deals()));


                          },
                          child: const Text('View More',)
                      )
                    ],
                  ),
                ),
                const Fruits(),
              ],
            ),
          ),

          const SizedBox(height: 10,),


        ],
      ),
    );
  }
}
