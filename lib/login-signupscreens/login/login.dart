
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../../constants/color.dart';
import '../signup/signup.dart';

class LoginScreen extends StatefulWidget {

  static const  String id='login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  final _formKey=GlobalKey<FormState>();
  final _ema=TextEditingController();
  final _pass=TextEditingController();



  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            padding: EdgeInsets.only(top: 20.0,bottom: 20),
                            child: Center(child: Text('Welcome to Yookatale',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: buttonColor))),
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

                          Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: (){

                                },
                                child:  const Text('Forgot password?',style: TextStyle(color:buttonColor),
                                ),
                              )),

                          const SizedBox(height: 20,),

                          Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor:buttonColor),
                              onPressed: (){



                              }, child:const Text('Login',style: TextStyle(color: Colors.white),),
                            ),
                          ),

                          const SizedBox(height: 20,),

                          Align(
                              alignment: Alignment.centerLeft,
                              child: InkWell(
                                onTap: (){
                                  Navigator.pushReplacementNamed(context,SignUp.id);
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
