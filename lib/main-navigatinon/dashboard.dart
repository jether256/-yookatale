import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yookatale/constants/color.dart';
import 'package:yookatale/main-navigatinon/profile/profile.dart';

import '../constants/color.dart';
import 'cart/cart.dart';
import 'categories/cotegories.dart';
import 'home/fats/fats.dart';
import 'home/home.dart';


class Dashboard extends StatefulWidget {

  static const  String id='dash-board';

  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {


  int _selectedIndex=0;

  static final List<Widget> _widgetOptions=<Widget>[
    const HomeScreen(),
    const Categories(),
    const Cart(),
    const Profile(),
    ];


  void _onItemTapped(int index){

    setState(() {
      _selectedIndex=index;
    });
  }






  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:() async{

        return false;
      },
      child: Scaffold(


        body:Container(
          decoration: const BoxDecoration(
            color:backgroundColor,
          ),
          child:_widgetOptions[_selectedIndex],
        ),
        bottomNavigationBar: BottomAppBar(
          padding: EdgeInsets.zero,
          // color:buttonColor,

          child: Container(
            height: 70,
            color:buttonColor,
            // decoration:  const BoxDecoration(
            //     gradient: LinearGradient(
            //       colors: [buttonColor,Colors.blue],
            //       begin: Alignment.topLeft,
            //       end: Alignment.topRight,
            //
            //     )
            // ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                IconButton(

                  onPressed: () {

                    _onItemTapped(0);
                  },
                  icon:Icon(_selectedIndex== 0 ? Icons.home:Icons.home_outlined,color:_selectedIndex== 0 ? backgroundColor:Colors.lightGreenAccent,size: _selectedIndex == 0 ? 30:23),

                ),

                IconButton(
                    onPressed: () {

                      _onItemTapped(1);
                    },
                    icon:Icon(_selectedIndex== 1 ? Icons.dashboard:Icons.dashboard_outlined,color:_selectedIndex== 1 ? backgroundColor:Colors.lightGreenAccent,size: _selectedIndex == 1 ? 30:23)
                ),



                IconButton(
                    onPressed: () {

                      _onItemTapped(2);
                    },
                    icon: Badge(
                      label: const Text('0',style: TextStyle(color: Colors.white,fontSize: 10),),
                      child:Icon(_selectedIndex== 2 ?Icons.shopping_cart:Icons.shopping_cart_outlined,color:_selectedIndex== 2 ? backgroundColor:Colors.lightGreenAccent,size: _selectedIndex == 2 ? 30:23) ,
                    ),
                ),

                IconButton(
                    onPressed: () {

                      _onItemTapped(3);
                    },
                    icon:Icon(_selectedIndex== 3 ? CupertinoIcons.person:Icons.person,color:_selectedIndex== 3 ? backgroundColor:Colors.lightGreenAccent,size: _selectedIndex == 3 ? 30:23)
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
