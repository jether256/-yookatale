
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constants/color.dart';
import '../login/login.dart';
class SignUp extends StatefulWidget {

  static const  String id='signup';

  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _formKey=GlobalKey<FormState>();
  final _first=TextEditingController();
  final _last=TextEditingController();
  final _phone=TextEditingController();
  final _gender=TextEditingController();
  final _address=TextEditingController();
  final  dateInput=TextEditingController();
  final _ema=TextEditingController();

  final _pass=TextEditingController();


  bool _isChecked = false;
  bool _isChecked2 = false;


  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  final List<String> _sextype=[
    'Male',
    'Female',
  ];




  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }



  @override
  Widget build(BuildContext context) {


    Widget _appBar(title,fieldValue){

      return  AppBar(
        backgroundColor:buttonColor,
        iconTheme: const IconThemeData(color: Colors.white),
        shape: Border(
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
        automaticallyImplyLeading: false,
        title: Text('$title>$fieldValue',style: const TextStyle(color: Colors.white,fontSize: 14),),
      );
    }


    Widget _sexTypelist({fieldValue,list,textController}){

      return Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _appBar('Gender',fieldValue),
            ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder:(BuildContext context, int index){
                  return ListTile(
                    onTap: (){
                      textController.text=list[index];
                      Navigator.pop(context);
                    },


                    title: Text(list[index],style: const TextStyle(color: Colors.black),),

                  );
                })
          ],
        ),
      );
    }


    getDate() async {


      DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1950),
          //DateTime.now() - not to allow to choose before today.
          lastDate: DateTime(2100));

      if (pickedDate != null) {
        print(
            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
        String formattedDate =
        DateFormat('yyyy-MM-dd').format(pickedDate);
        print(
            formattedDate); //formatted date output using intl package =>  2021-03-16
        setState(() {
          dateInput.text = formattedDate; //set output date to TextField value.
        });
      } else {}
    }



    return  Scaffold(
      body: Container(
        decoration:const BoxDecoration(
          // color: Colors.black.withOpacity(0.2),
            image:DecorationImage(
              image: AssetImage("assets/images/veg.png"),
              fit: BoxFit.cover,
              alignment: Alignment(-0.3, 0),
            )
        ),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [backgroundColor.withOpacity(0.8),backgroundColor.withOpacity(0.8)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.7,1],
              )
          ),
          child: Form(
            key: _formKey,
            child: ListView(
              padding:const EdgeInsets.only(left: 20,right: 20),
              children:  [

                const SizedBox(height: 20,),

                Image.asset('assets/images/loo.png',height: 100,),



                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)

                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [

                          const Padding(
                            padding: EdgeInsets.only(top: 10.0,bottom: 10),
                            child: Center(child: Text('Create an account on Yookatale',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: buttonColor))),
                          ),

                          const SizedBox(height: 10,),


                          //first name
                          TextFormField(
                              controller: _first,
                              cursorColor: Colors.blue.shade200,
                              decoration: InputDecoration(
                                  hintText: 'Firstname',
                                  prefixIcon:const Icon(Icons.person,size: 18,color:Colors.grey,),
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  enabledBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: const BorderSide(color: Colors.blue),
                                  )
                              ),

                              validator: (value){
                                if(value!.isEmpty){
                                  return 'Enter your Firstname';

                                }
                                return null;
                              }

                          ),


                          const SizedBox(height: 10,),

                          //last name
                          TextFormField(
                              controller: _last,
                              cursorColor: Colors.blue.shade200,
                              decoration: InputDecoration(
                                  hintText: 'Lastname',
                                  prefixIcon:const Icon(Icons.person,size: 18,color:Colors.grey,),
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  enabledBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: const BorderSide(color: Colors.blue),
                                  )
                              ),

                              validator: (value){
                                if(value!.isEmpty){
                                  return 'Enter your Lastname';

                                }
                                return null;
                              }

                          ),


                          const SizedBox(height: 10,),

                          //phone
                          TextFormField(
                              controller: _phone,
                              cursorColor: Colors.blue.shade200,
                              decoration: InputDecoration(
                                  hintText: 'Phonenumber (+256)',
                                  prefixIcon:const Icon(Icons.phone,size: 18,color:Colors.grey,),
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  enabledBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: const BorderSide(color: Colors.blue),
                                  )
                              ),

                              validator: (value){
                                if(value!.isEmpty){
                                  return 'Enter your phone number';

                                }
                                return null;
                              }

                          ),


                          const SizedBox(height: 10,),

                          //gender
                          InkWell(
                            onTap: (){

                              //lets show the list of cars instead of manually typing
                              showDialog(context: context, builder:(BuildContext context){
                                return _sexTypelist(fieldValue: 'Type',list: _sextype,textController: _gender);

                              });
                            },
                            child: TextFormField(
                                controller: _gender,
                               // readOnly: true,
                                enabled: false,
                                cursorColor: Colors.blue.shade200,
                                decoration: InputDecoration(
                                    hintText: 'Gender',
                                    prefixIcon:const Icon(Icons.male,size: 18,color:Colors.grey,),
                                    filled: true,
                                    fillColor: Colors.grey.shade200,
                                    enabledBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: const BorderSide(color: Colors.blue),
                                    )
                                ),

                                validator: (value){
                                  if(value!.isEmpty){
                                    return 'Enter your gender';

                                  }
                                  return null;
                                }

                            ),
                          ),


                          const SizedBox(height: 10,),

                          //email textfield
                          TextFormField(
                              controller: _ema,
                              cursorColor: Colors.blue.shade200,
                              decoration: InputDecoration(
                                  hintText: 'Email',
                                  prefixIcon:const Icon(Icons.email,size: 18,color:Colors.grey,),
                                  filled: true,
                                  fillColor:Colors.grey.shade200,
                                  enabledBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: const BorderSide(color: Colors.blue),
                                  )
                              ),
                              validator: (value){
                                if(value!.isEmpty){

                                  return 'Enter Email';
                                }
                                bool _isValid= (EmailValidator.validate(value));
                                if(_isValid==false){
                                  return 'Enter Valid Email Address';

                                }
                                return null;

                              }
                          ),

                          const SizedBox(height: 10,),

                          //date of birth
                          InkWell(
                            onTap: () {

                                    getDate();
                            },
                            child: TextFormField(
                                controller: dateInput,
                                enabled: false,
                                cursorColor: Colors.blue.shade200,
                                decoration: InputDecoration(
                                    hintText: 'Date of birth',
                                    prefixIcon:const Icon(Icons.calendar_today,size: 18,color:Colors.grey,),
                                    filled: true,
                                    fillColor: Colors.grey.shade200,
                                    enabledBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: const BorderSide(color: Colors.blue),
                                    )
                                ),

                                validator: (value){
                                  if(value!.isEmpty){
                                    return 'Enter Date of birth';

                                  }
                                  return null;
                                }

                            ),
                          ),


                          const SizedBox(height: 10,),

                          //address
                          TextFormField(
                              controller: _address,
                              cursorColor: Colors.blue.shade200,
                              decoration: InputDecoration(
                                  hintText: 'Address',
                                  prefixIcon:const Icon(Icons.map_sharp,size: 18,color:Colors.grey,),
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  enabledBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: const BorderSide(color: Colors.blue),
                                  )
                              ),

                              validator: (value){
                                if(value!.isEmpty){
                                  return 'Enter your Address';

                                }
                                return null;
                              }

                          ),

                          const SizedBox(height: 10,),

                          //password textfiled
                          TextFormField(
                              controller: _pass,
                              cursorColor: Colors.blue.shade200,
                              obscureText: _secureText,
                              decoration: InputDecoration(
                                  hintText: 'Password',
                                  prefixIcon: const Icon(Icons.lock,size: 18,color:Colors.grey,),
                                  suffixIcon: IconButton(
                                    onPressed: showHide,
                                    icon: _secureText
                                        ? const Icon(
                                      Icons.visibility_off,
                                      color: Colors.grey,
                                      size: 20,
                                    )
                                        : const Icon(
                                      Icons.visibility,
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor:Colors.grey.shade200,
                                  enabledBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: const BorderSide(color: Colors.blue),
                                  )
                              ),

                              validator: (value){
                                if(value!.isEmpty){
                                  return 'Enter your Password';

                                }
                                return null;
                              }

                          ),


                          const SizedBox(height: 10,),

                          Row(
                            children:[

                              Checkbox(
                                value: _isChecked,
                                onChanged: (value) {
                                  setState(() {
                                    _isChecked = value!;
                                  });
                                },
                              ),//Checkbox

                              const SizedBox(
                                width: 10,
                              ), //SizedBox
                              const Text(
                                'Are you vegetarian? ',
                                style: TextStyle(fontSize: 14.0),
                              ), //Text
                              const SizedBox(width: 10), //SizedBox


                            ], //<Widget>[]
                          ),

                         // const SizedBox(height: 10,),

                          Row(
                            children:[

                              Checkbox(
                                value: _isChecked2,
                                onChanged: (value) {
                                  setState(() {
                                    _isChecked2 = value!;
                                  });
                                },
                              ),//Checkbox

                              const SizedBox(
                                width: 10,
                              ),

                              //SizedBox
                              const Text(
                                'I agree to terms and conditions ',
                                style: TextStyle(fontSize: 14.0),
                              ), //Text
                              const SizedBox(width: 10), //SizedBox


                            ], //<Widget>[]
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor:buttonColor),
                              onPressed: (){



                              }, child:const Text('Sign Up',style: TextStyle(color: Colors.white),),
                            ),
                          ),

                          const SizedBox(height: 20,),

                          Align(
                              alignment: Alignment.centerLeft,
                              child: InkWell(
                                onTap: (){
                                  Navigator.pushReplacementNamed(context,LoginScreen.id);
                                },
                                child:   const Text('Dont have an account? ${'Sign Up'}',style: TextStyle(color:buttonColor),
                                ),
                              )),

                          const SizedBox(height: 50,),
                        ],
                      ),
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
